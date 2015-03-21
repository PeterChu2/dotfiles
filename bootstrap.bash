#!/bin/sh
git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

git pull origin master;

function syncDotFiles() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.bash" \
    --exclude "setup_brew.sh" --exclude "README.md" \
    --exclude "Sublime" -avh --no-perms . ~;
  source ~/.bash_profile;
}

function update_git_completion () {
  # try to download the "correct" version of git completion
  git_version=`git --version | cut -d" " -f3`

  # check if we have the right version of git completion stuffs
  if [[ -f git-completion.bash && -f git_completion_version && $git_version == `cat git_completion_version` ]]
  then
    echo "Up to date for $git_version"
  else
    rm git_completion_version &>/dev/null
    echo $git_version > git_completion_version
    echo "Downloading git completion script for $git_version"
    # here we fail (-f) quietly and save to same name as remote (-O)
    curl -f -L -O https://raw.githubusercontent.com/git/git/v$git_version/contrib/completion/git-completion.bash
    curl -f -L -O https://raw.githubusercontent.com/git/git/v$git_version/contrib/completion/git-prompt.sh
  fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  syncDotFiles;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    syncDotFiles;
  fi;
fi;
unset syncDotFiles;

update_git_completion
unset update_git_completion