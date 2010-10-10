(provide 'shaneal-web)

;;JS
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;XML
(load (concat *emacs-lib-base* "nxml-mode/rng-auto.el"))
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
 	    auto-mode-alist))

