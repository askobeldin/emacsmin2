;; my-evil.el
;;
;; Settings for ostracizing me from both the Emacs and Vim communities.
;; a.k.a. evil-mode
;; In order to work properly, we need to load evil-leader-mode before we load
;; evil-mode.

(use-package evil-leader
  :commands (evil-leader-mode global-evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :config
    (progn
        (evil-leader/set-leader ",")
        (global-evil-leader-mode t)))
        
(require 'evil-lispy)
;; make evil-lispy start in the modes you want
(add-hook  'emacs-lisp-mode-hook    #'evil-lispy-mode)

;; Here's what we've all been waiting for.
;; Recreate Vim inside Emacs.
(use-package evil
  :ensure evil
  :config
  (progn
    (evil-mode 1)
    (setq evil-want-C-u-scroll t)
    (setq evil-want-C-w-in-emacs-state t)
    (setq evil-search-module 'isearch)
    (setq evil-magic 'very-magic)

    (setq evil-want-fine-undo t)
    (setq evil-want-change-word-to-end t)

    (use-package evil-nerd-commenter
      :ensure evil-nerd-commenter
      :commands (evilnc-comment-or-uncomment-lines))

    (use-package evil-matchit
      :ensure evil-matchit
      :commands evilmi-jump-items
      :init
      (progn
        (setq global-evil-matchit-mode t)
        (define-key evil-normal-state-map "%" 'evilmi-jump-items)))

    (use-package evil-surround
      :ensure evil-surround
      :config
      (progn
        (global-evil-surround-mode 1)))

    ;; ???
    ; (evil-set-initial-state 'flycheck-error-list-mode 'normal)

    (use-package key-chord
      :ensure key-chord
      :config
      (progn
        (key-chord-mode 1)))

    (define-key evil-normal-state-map (kbd "C-w }") 'evil-window-rotate-downwards)
    (define-key evil-normal-state-map (kbd "C-w {") 'evil-window-rotate-upwards)
    (define-key evil-normal-state-map (kbd "C-h")   'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j")   'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k")   'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l")   'evil-window-right)
    (define-key evil-normal-state-map (kbd "C-<tab>") 'evil-next-buffer)
    (define-key evil-normal-state-map (kbd "S-<tab>") 'evil-prev-buffer)
    (define-key evil-normal-state-map "a"           'evil-append)
    (define-key evil-normal-state-map "/"           'evil-search-forward)

    (define-key evil-motion-state-map "h"           'evil-backward-char)
    (define-key evil-motion-state-map "j"           'evil-next-visual-line)
    (define-key evil-motion-state-map "k"           'evil-previous-visual-line)
    (define-key evil-motion-state-map "l"           'evil-forward-char)
    (define-key evil-motion-state-map "$"           'evil-end-of-line)
    (define-key evil-motion-state-map "0"           'evil-beginning-of-line)

    (evil-ex-define-cmd "Q"  'evil-quit)
    (evil-ex-define-cmd "Qa" 'evil-quit-all)
    (evil-ex-define-cmd "QA" 'evil-quit-all)))

(require 'evil-visualstar)
(global-evil-visualstar-mode)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(provide 'my-evil)
