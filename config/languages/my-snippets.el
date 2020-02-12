;; my-snippets.el
;;
;; Code snippets for speedy snipping.

(use-package yasnippet
  :ensure yasnippet
  :config
  (progn
    (add-to-list 'yas-prompt-functions 'my-yas/helm-prompt)))

;; From http://emacswiki.org/emacs/Yasnippet
(defun my-yas/helm-prompt (prompt choices &optional display-fn)
  "Use helm to select a snippet. Put this into `yas/prompt-functions.'"
  (interactive)
  (setq display-fn (or display-fn 'identity))
  (if (require 'helm-config)
      (let (tmpsource cands result rmap)
        (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
        (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
        (setq tmpsource
              (list
               (cons 'name prompt)
               (cons 'candidates cands)
               '(action . (("Expand" . (lambda (selection) selection))))
               ))
        ;; (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
        (setq result (helm-other-buffer '(tmpsource) "*helm*"))
        (if (null result)
            (signal 'quit "user quit!")
          (cdr (assoc result rmap))))
    nil))


(provide 'my-snippets)
