# oh-my-zsh settings
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mortalscumbag"
COMPLETION_WAITING_DOTS="true"
plugins=(git pip autojump)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
#source $HOME/.nvm/nvm.sh

#export VIMRUNTIME=/usr/local/share/vim/vim74

# enabling autojump autocomplete
# https://github.com/joelthelion/autojump/issues/86
autoload -U compinit; compinit
export AUTOJUMP_IGNORE_CASE=1
export PATH=$HOME/.local/bin:$HOME/.cabal/bin:$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$HOME/.rvm/bin:$HOME/.bin:/usr/local/share/python:/usr/local/share/npm/bin:/usr/local/sbin:/usr/local/bin:/usr/X11/bin:/usr/bin:/usr/sbin:/sbin:/bin
export GOPATH=$HOME/ownCloud/code/gocode
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim
export TERM=xterm-256color
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH  # for pygit2

# golang
if command_exists brew; then
	export GOPATH=$HOME/.go
	export GOROOT=`brew --prefix`/Cellar/go/1.4/libexec
	export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$GOROOT/bin

	if command_exists gdircolors; then
		export PATH=`brew --prefix`/Cellar/coreutils/8.20/libexec/gnubin:$PATH
	fi
fi

if command_exists virtualenvwrapper.sh; then
  export WORKON_HOME=~/.virtualenvs
  export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
  source virtualenvwrapper.sh
fi

if command_exists dircolors; then
	eval `dircolors ~/.dir_colors`
else
	export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
fi

# ctrl-s for vim
stty -ixon

# python brew
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# for docker-compose https://docs.docker.com/compose/completion/
fpath=(~/.zsh/completion $fpath)
