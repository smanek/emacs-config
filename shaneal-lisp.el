(provide 'shaneal-lisp)

;;Paredit Mode
(autoload 'paredit-mode "paredit"
   "Minor mode for pseudo-structurally editing Lisp code." t)
(dolist (hook '(emacs-lisp-mode-hook
	lisp-mode-hook
	clojure-mode-hook))
  ;; don't want paredit in my REPL. if I want it back, add 'slime-repl-mode-hook' to prev list
  (add-hook hook #'(lambda nil (paredit-mode 1))))

(defun get-inferior-lisp-program ()
  (let ((ordered-preference '("/opt/local/bin/sbcl"
			      "/usr/local/bin/sbcl"
			      (shell-command-to-string  "which sbcl")
			      (shell-command-to-string "which clisp"))))
    (dolist (bin ordered-preference)
      (when (file-executable-p bin)
	(return bin)))))

;;SLIME
(add-to-list 'load-path (concat *emacs-lib-base* "slime/"))
(setq inferior-lisp-program (get-inferior-lisp-program))
(setq slime-enable-evaluate-in-emacs t)
(require 'slime-autoloads)
(add-hook 'lisp-mode-hook (lambda ()
			    (cond ((not (featurep 'slime))
				   (require 'slime)
				   (normal-mode)))))
 (eval-after-load "slime"
   '(progn
      (add-to-list 'load-path (concat *emacs-lib-base* "slime/contrib/"))
      (slime-setup '(slime-fancy slime-asdf slime-banner slime-tramp))
      (slime-banner-init)
      (slime-asdf-init)
      (setq slime-complete-symbol*-fancy t)
      (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
      (slime-setup)))

;;redshank
(add-to-list 'load-path (concat *emacs-lib-base* "redshank/"))
(require 'redshank-loader)
(eval-after-load "redshank-loader"
   `(redshank-setup '(lisp-mode-hook
                      slime-repl-mode-hook) t))

(setq auto-mode-alist
      (append '(
 		("\\.emacs$" . emacs-lisp-mode)
 		("\\.lisp$" . lisp-mode)
 		("\\.lsp$" . lisp-mode)
 		("\\.asd$" . lisp-mode)
 		("\\.cl$" . lisp-mode))
 	      auto-mode-alist))



;;cldoc
;; (autoload 'turn-on-cldoc-mode "cldoc" nil t)
;; (add-hook 'lisp-mode-hook 'turn-on-cldoc-mode)

;; (add-hook 'slime-repl-mode-hook
;;            #'(lambda ()
;;                (turn-on-cldoc-mode)
;;                (define-key slime-repl-mode-map " " nil)))
;; (add-hook 'slime-mode-hook
;; 	  #'(lambda () (define-key slime-mode-map " " nil)))
;; (setq slime-use-autodoc-mode nil)
