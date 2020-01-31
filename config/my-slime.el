;; my-slime.el
;;
(require 'slime)
(require 'slime-autoloads)
(require 'ac-slime)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; using slime-company package
;
(slime-setup '(slime-repl 
               slime-fuzzy
               slime-fancy 
               slime-asdf 
               slime-indentation
               ;slime-company
               ))

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
;; (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; (add-hook 'slime-repl-mode-hook (lambda () (slime-mode t)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ; ???
                                        ; (add-hook 'slime-mode-hook 
                                        ; (lambda ()
                                        ; (unless (slime-connected-p)
                                        ; (save-excursion (slime)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; using ac-slime package
(eval-after-load "auto-complete"
                 '(add-to-list 'ac-modes 'slime-repl-mode))

(add-hook 'slime-mode-hook (lambda ()
                             (unless (slime-connected-p)
                               (save-excursion (slime)))
                             (set-up-slime-ac)
                             (auto-complete-mode)))
(add-hook 'slime-repl-mode-hook (lambda ()
                                  (slime-mode t)
                                  (set-up-slime-ac)
                                  (evil-lispy-mode)
                                  (auto-complete-mode)))


;; Это включает алгоритмы выравнивания лиспового кода из SLIME,
;; в противоположность стандартным из Emacs
(setq lisp-indent-function 'common-lisp-indent-function)


;; may be it is not so elegant?
;;
;(if (or 
     ;(file-exists-p unix-sbcl-bin) 
     ;(file-exists-p windows-sbcl-bin))

(if (my-system-is-windows)
    (progn
      ;(setq inferior-lisp-program windows-sbcl-bin)
        (setq inferior-lisp-program (executable-find "sbcl"))
        (setq common-lisp-hyperspec-root "file:///c:/myinfo/HyperSpec/"))
    (progn
        (setq inferior-lisp-program (executable-find "sbcl"))
       ;(setq inferior-lisp-program unix-sbcl-bin)
        (setq common-lisp-hyperspec-root "file:///usr/share/doc/hyperspec/"))
    ;; (message "%s" "SBCL not found...")
    )
;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; testing
(if (my-system-is-windows)
    (progn
      (message "%s" "my-slime: system is windows.")))

(if (my-system-is-linux)
    (progn
      (message "%s" "my-slime: system is linux.")))
;; --------------------------------------------

;; (setq ac-auto-show-menu 0.1)

(setq slime-net-coding-system 'utf-8-unix)

(add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode))

(provide 'my-slime)
