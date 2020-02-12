(require 'evil-lispy)

;; Always eldoc in lispy modes.
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(add-hook 'emacs-lisp-mode-hook #'evil-lispy-mode)
(add-hook 'emacs-lisp-mode-hook (lambda () (set-fill-column 100)))


(provide 'my-elisp)
