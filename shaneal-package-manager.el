(provide 'shaneal-package-manager)

(add-to-list 'load-path (concat *emacs-lib-base* "package.el/"))
(load "package")
(package-initialize)