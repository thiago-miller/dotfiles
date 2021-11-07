install_plugins: $(TARGET_DIR)/.tmux/plugins/tpm/tpm
	$(<D)/bin/install_plugins

.PHONY: install_plugins

$(TARGET_DIR)/.tmux/plugins/tpm/tpm: $(TARGET_DIR)/.tmux.conf
	git clone https://github.com/tmux-plugins/tpm $(@D)

$(TARGET_DIR)/.tmux.conf: .tmux.conf
	stow -d $(ROOT_DIR) -t $(TARGET_DIR) tmux
