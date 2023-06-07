.PHONY: fzfkeys gbr

fzfkeys:
	cp current/key-bindings.zsh /usr/local/opt/fzf/shell/key-bindings.zsh


CURRENT = ./current
BAK = ~/.backups-$(shell date +%Y-%M-%d-%m-%S)

backup:
	mkdir ${BAK}
	echo ${BAK}
	cp /opt/homebrew/opt/fzf/shell/key-bindings.zsh ${BAK}
	cp ~/.config/nvim/init.vim ${BAK}
	cp ~/.fzf.zsh ${BAK}
	cp ~/.tmux.conf ${BAK}
	cp ~/.zshenv ${BAK}
	cp ~/.zshrc ${BAK}

setup2: backup
	ln -sf $(shell pwd)/${CURRENT}/zshrc             ~/.zshrc
	ln -sf $(shell pwd)/${CURRENT}/zshenv            ~/.zshenv
	ln -sf $(shell pwd)/${CURRENT}/tmux.conf         ~/.tmux.conf
	ln -sf $(shell pwd)/${CURRENT}/key-bindings.zsh  /opt/homebrew/opt/fzf/shell/key-bindings.zsh
	ln -sf $(shell pwd)/${CURRENT}/fzf.zsh           ~/.fzf.zsh
	ln -sf $(shell pwd)/${CURRENT}/init.vim          ~/.config/nvim/init.vim
