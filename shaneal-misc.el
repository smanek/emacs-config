(provide 'shaneal-misc)

;;ido mode
(require 'ido)
(ido-mode t)
(setq confirm-nonexistent-file-or-buffer nil)

(icomplete-mode 99)

;;utf8
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

;;don't leave the emacs *~ files all over the fs
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs-backups")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)

;;same thing for #*# things
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs-backups" t))) 


;;spellchecker
(dolist (hook '(text-mode-hook 
		latex-mode-hook
		tex-mode-hook
		bibtex-mode-hook
		change-log-mode-hook
		log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;;windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;custom keys
(global-set-key "\M-g" 'goto-line)

;;indentation
(setq-default indent-tabs-mode nil)