#! /bin/zsh -e

pwd=$(pwd)

if [ -f "$HOME/.sources" ]; then
  rm "$HOME/.sources"
fi
add_source (){
  echo $1 >> ~/.sources
  chmod +x $1
}
link_replace() {
 if [ -L $2 ]; then
   echo " - rm link $2"
   rm $2
 fi
 if [ -f $2 ]; then
   echo " - rm file $2"
   rm $2
 fi
 echo " - link $1 -> $2"
 ln -s $1 $2
}


echo "+ Add prezto"
if [ ! -d "$HOME/.zprezto" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
  chsh -s /bin/zsh
fi

echo "+ Add fzf"
if [ ! -d "$HOME/.fzf" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install
fi

echo "+ Install nvim settings"

if [ ! -d "$HOME/.config/nvim" ]; then
  mkdir -p .config/nvim
  #install plug
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
link_replace "$pwd/nvim/init.vim" "$HOME/.config/nvim/init.vim"

echo "+ Add prezto theme"
link_replace "$pwd/zprezto/prompt_yak_setup" "$HOME/.zprezto/modules/prompt/functions/prompt_yak_setup"

#copy all symplink
echo "+ Add symlinks"
for src in $(find $pwd -name \*.symlink -maxdepth 2  ); do
  name=$(echo $(basename $src) | sed -e "s|\.symlink||g")
  dest="$HOME/.$name"
  echo " - link $src -> $dest"
  link_replace $src $dest
done

#add zsh sources
echo "+ Add sources"
for src in $(find $pwd -name \*.zsh -maxdepth 2  ); do
  echo " - $src"
  add_source $src
done

exec $SHELL

