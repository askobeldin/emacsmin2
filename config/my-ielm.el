;; my-ielm.el
;;
;; elisp interpreter shell settings
(require 'evil-lispy)

; (add-hook 'ielm-mode-hook 'electric-pair-mode)
(add-hook 'ielm-mode-hook #'evil-lispy-mode)

(provide 'my-ielm)
