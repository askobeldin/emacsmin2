;; config common lisp system
;;

(require 'evil-lispy)

(use-package lisp-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
    (add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode))
    (add-to-list 'auto-mode-alist '("\\.asd\\'" . lisp-mode)))
  :config
  (setq common-lisp-style-default "modern")

  (add-hook 'lisp-mode-hook (lambda () (set-fill-column 100)))
  (add-hook 'lisp-mode-hook #'evil-lispy-mode))


(provide 'my-cl)

