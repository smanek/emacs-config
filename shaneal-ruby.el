(provide 'shaneal-ruby)

(add-to-list 'load-path (concat *emacs-lib-base* "ruby-mode"))
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
