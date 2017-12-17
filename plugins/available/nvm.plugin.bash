# Bash-it no longer bundles nvm, as this was quickly becoming outdated.
#
# Please install nvm from https://github.com/creationix/nvm.git if you want to use it.

cite about-plugin
about-plugin 'node version manager configuration'

export NVM_DIR="$HOME/.nvm"
# This loads nvm
if command -v brew &>/dev/null && [ -s $(brew --prefix nvm)/nvm.sh ]
then
  . $(brew --prefix nvm)/nvm.sh
else
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

