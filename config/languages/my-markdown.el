;; my-markdown.el
;; Settings for editing Markdown files.


(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (progn
    (setq markdown-command "multimarkdown")
    (add-hook 'markdown-mode-hook (lambda ()
                                     (set-fill-column 80)))))

(provide 'my-markdown)
