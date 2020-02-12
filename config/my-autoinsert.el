;; my-autoinsert.el
;; 
;;
(require 'autoinsert)

;; Adds hook to find-files-hook
(auto-insert-mode)

;; Or use custom, Trailing slash important
(setq auto-insert-directory (concat user-emacs-directory "/templates/"))

;; If you don't want to be prompted before insertion
(setq auto-insert-query nil)

;; templates
(define-auto-insert "\.py" "python-template")


(provide 'my-autoinsert)
