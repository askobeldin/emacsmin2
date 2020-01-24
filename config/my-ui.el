;; my-ui.el
;; user interface

;; Disable GUI components
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(tooltip-mode      -1)
; (menu-bar-mode     -1)

(blink-cursor-mode t)
(setq use-dialog-box     nil)
(setq redisplay-dont-pause t)

; Keyboard: input method
; toggle:  C-\
(setq default-input-method 'russian-computer)

; global Highlight current textline
; (global-hl-line-mode t)

;; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Window size. Set font
;; (add-to-list 'default-frame-alist '(width . 110))
(if (my-system-is-windows)
  ;; my windows machine
  (add-to-list 'default-frame-alist '(height . 75))
  ;; linux
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

(setq initial-frame-alist '((left . 0) (top . 0)))
(when (member "DejaVu Sans Mono" (font-family-list))
    (set-frame-font "DejaVu Sans Mono-10:antialias=natural" nil t))

;; maximize main window when emacs starts
;(add-to-list 'default-frame-alist
             ;'(fullscreen . maximized))

(defun my-update-emacs-title ()
  "Update the Emacs title based on the current buffer.

If the current buffer is associated with a filename, that filename will be
used to tile the window. Otherwise, the window will be titled based upon the
name of the buffer."
  (if (buffer-file-name (current-buffer))
      (setq frame-title-format "Emacs - %f")
      (setq frame-title-format "Emacs - %b")))

(cl-dolist (hook '(buffer-list-update-hook
                   change-major-mode-hook
                   find-file-hook))
  (add-hook hook 'my-update-emacs-title))

; Reconfigure highlight line's color
; (set-face-background 'hl-line "#dcdcdc")
(set-face-foreground 'highlight nil)

;; Hide startup messages
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; Ediff with horizontal splits.
(setq ediff-split-window-function 'split-window-horizontally)

;; Scrolling
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t
      scroll-step 1
      scroll-margin 2)

;; Let me write `y` or `n` even for important stuff that would normally require
;; me to fully type `yes` or `no`.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Flash the frame to represent a bell.
(setq visible-bell t)

;; nevermind that's annoying
(setq ring-bell-function 'ignore)

;; Это настраивает подсветку парных скобок
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)

;; Electric-mode
(electric-pair-mode   -1)
(electric-indent-mode -1)

;; break long lines at word boundaries
(visual-line-mode 1)

;; number columns in the status bar
(column-number-mode)

;; Fringe 
(set-fringe-style '(8 . 0))
; (setq-default indicate-empty-lines t)
; (setq-default indicate-buffer-boundaries 'left)

;; don't put intitial text in scratch buffer
(setq initial-scratch-message nil)

;; Global clipboard
(setq x-select-enable-clipboard t)
(if (my-system-is-windows)
    (set-clipboard-coding-system 'utf-16le-dos))

;; Highlight search results
(setq search-highlight t
      query-replace-highlight t)

;; Cursor for evil mode (faff theme)
(setq evil-default-cursor  '("#cd0000" box))
(setq evil-normal-state-cursor  '("#00008b" box))
(setq evil-insert-state-cursor  '("#00008b" (hbar . 3)))
(setq evil-replace-state-cursor '("#008b8b" box))
(setq evil-motion-state-cursor '("#ffff00" box))
(setq evil-emacs-state-cursor   '("#cd0000" hollow))


;; Theme
(load-theme 'faff t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'custom-theme-load-path
              ;(concat user-emacs-directory "themes"))

;; load my favorite theme
;(load-theme 'classic t t)
;(enable-theme 'classic)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Calendar
;(setq display-time-24hr-format t)
;(setq display-time-day-and-date t)
;;;;; (display-time)
;(setq calendar-date-display-form 
      ;(quote ((format "%04s-%02d-%02d" year 
                      ;(string-to-int month) 
                      ;(string-to-int day)))))
;(setq calendar-time-display-form 
      ;(quote (24-hours ":" minutes 
              ;(if time-zone " (") time-zone 
              ;(if time-zone ")"))))
;(setq calendar-week-start-day 1)
;(setq european-calendar-style t)

;; Evil mode
(require 'evil)
(evil-mode t)

(provide 'my-ui)
