;; my python config
;;
(when (featurep 'python) (unload-feature 'python t))

(autoload 'python-mode "python-mode" "Python editing mode." t)

(use-package python-mode
      :commands python-mode
      :mode "\\.py\\'"
      :init
      (progn
        (add-to-list 'auto-mode-alist '("/PYDOCS\\'" . help-mode))
        (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode)))
      :config
      (progn
        (setq python-indent 4
              python-indent-offset 4)
        (setq python-indent-guess-indent-offset nil)

        (setq py-electric-comment-p t)
        (setq python-shell-interpreter "python3") ;?
        ;; (setq py-max-help-buffer-p nil)
        ;; (setq py-electric-comment-add-space-p nil)
        ;; (setq py-tab-indent nil)
        ;; (setq py-smart-indentation t)
        ;; (setq py-complete-function nil)
        ;; (setq py-empty-line-closes-p nil)
        
        ;; yasnippet
        ;; (yas-reload-all)

        ;; evil
        (evil-define-key 'insert python-mode-map (kbd "RET") 'electric-newline-and-maybe-indent)
        ;; yasnippet config
        ;; (evil-define-key 'insert python-mode-map (kbd "C-c i") 'yas-insert-snippet)
        ))

(add-hook 'python-mode-hook (lambda ()
                              ;; other config
                              (set-fill-column 80)
                              ;; sphinx-doc usage: move the cursor to
                              ;; some function/method definition and hit C-c M-d
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)
                              ;; yasnippet
                              ;; (yas-minor-mode t)
                              ))

(provide 'my-python)
