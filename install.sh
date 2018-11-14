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


echo "+ Add fzf"
if [ ! -d "$HOME/.fzf" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install
fi

echo "+ Install nvim settings"

if [ ! -d "$HOME/.config/nvim" ]; then
  mkdir -p .config/nvim
  mkdir "$HOME/.config/nvim/config"

  # install dein
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
  exec sh /tmp/installer.sh
fi
link_replace "$pwd/nvim/init.vim" "$HOME/.config/nvim/init.vim"
link_replace "$pwd/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
link_replace "$pwd/nvim/snippets" "$HOME/.config/nvim/snippets"
link_replace "$pwd/nvim/config/plugins" "$HOME/.config/nvim/config/plugins"

echo "+ Add prezto theme"
link_replace "$pwd/zprezto/prompt_yak_setup" "$HOME/.zprezto/modules/prompt/functions/prompt_yak_setup"

echo "+ Add fish configuration"
if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir $HOME/.config/fish/
fi
link_replace "$pwd/fish/config.fish" "$HOME/.config/fish/config.fish"

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

# prevent the z script to throw an error
touch $HOME/.z

exec $SHELL

