;; my-slime.el
;;
(require 'slime)
(require 'slime-autoloads)
(require 'ac-slime)
;; (require 'slime-cl-indent)

;; (add-to-list 'slime-contribs 'slime-cl-indent)

;(setq lisp-indent-function 'common-lisp-indent-function)
;; Available styles are: basic, classic, modern and sbcl
;; (setq common-lisp-style-default "sbcl")
;(setq common-lisp-style-default "modern")

(slime-setup '(slime-repl 
               slime-fuzzy
               slime-fancy 
               slime-asdf 
               ;; slime-indentation
               ;;slime-company
               ))

;; (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; (add-hook 'slime-repl-mode-hook (lambda () (slime-mode t)))

(eval-after-load "slime"
                 '(progn
                   (setq
                    ;; lisp-indent-function 'common-lisp-indent-function
                    slime-complete-symbol-function 'slime-fuzzy-complete-symbol
                    slime-fuzzy-completion-in-place t
                    slime-enable-evaluate-in-emacs t
                    slime-autodoc-use-multiline-p t)))
;; using ac-slime package

(eval-after-load "auto-complete"
                 '(add-to-list
                   'ac-modes
                   'slime-repl-mode))

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

(add-hook 'lisp-mode-hook (lambda ()
                            (set-up-slime-ac)
                            (auto-complete-mode)))
;; Это включает алгоритмы выравнивания лиспового кода из SLIME,
;; в противоположность стандартным из Emacs
;; (setq lisp-indent-function 'common-lisp-indent-function)

(if (my-system-is-windows)
    (progn
      ;; (setq inferior-lisp-program windows-sbcl-bin)
      (setq inferior-lisp-program (executable-find "sbcl"))
      (setq common-lisp-hyperspec-root "file:///c:/myinfo/HyperSpec/"))
    (progn
      (setq inferior-lisp-program (executable-find "sbcl"))
      ;; (setq inferior-lisp-program unix-sbcl-bin)
      (setq common-lisp-hyperspec-root (expand-file-name "/home/andrey/hyperspec/"))
      (setq common-lisp-hyperspec-symbol-table 
            (expand-file-name "~/hyperspec/Data/Map_Sym.txt"))))

(if (my-system-is-windows)
    (progn
      (message "%s" "my-slime: system is windows.")))

(if (my-system-is-linux)
    (progn
      (message "%s" "my-slime: system is linux.")))

(setq slime-net-coding-system 'utf-8-unix)

;(add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode))

(provide 'my-slime)
