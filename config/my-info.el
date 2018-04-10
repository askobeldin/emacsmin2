;; my-info.el
;;
;; Make info-more convenient to work with inside of Evil.

; (defvar Info-mode-map
  ; (let ((map (make-keymap)))
    ; (suppress-keymap map)
    ; (define-key map "." 'beginning-of-buffer)
    ; (define-key map " " 'Info-scroll-up)
    ; (define-key map [?\S-\ ] 'Info-scroll-down)
    ; (define-key map "\C-m" 'Info-follow-nearest-node)
    ; (define-key map "\t" 'Info-next-reference)
    ; (define-key map "\e\t" 'Info-prev-reference)
    ; (define-key map [backtab] 'Info-prev-reference)
    ; (define-key map "1" 'Info-nth-menu-item)
    ; (define-key map "2" 'Info-nth-menu-item)
    ; (define-key map "3" 'Info-nth-menu-item)
    ; (define-key map "4" 'Info-nth-menu-item)
    ; (define-key map "5" 'Info-nth-menu-item)
    ; (define-key map "6" 'Info-nth-menu-item)
    ; (define-key map "7" 'Info-nth-menu-item)
    ; (define-key map "8" 'Info-nth-menu-item)
    ; (define-key map "9" 'Info-nth-menu-item)
    ; (define-key map "0" 'undefined)
    ; (define-key map "?" 'Info-summary)

    ; (define-key map "]" 'Info-forward-node)
    ; (define-key map "[" 'Info-backward-node)

    ; (define-key map "<" 'Info-top-node)
    ; (define-key map ">" 'Info-final-node)
    ; (define-key map "b" 'beginning-of-buffer)
    ; (put 'beginning-of-buffer :advertised-binding "b")
    ; (define-key map "d" 'Info-directory)
    ; (define-key map "e" 'end-of-buffer)
    ; (define-key map "f" 'Info-follow-reference)
    ; (define-key map "g" 'Info-goto-node)
    ; (define-key map "h" 'Info-help)
    ; ;; This is for compatibility with standalone info (>~ version 5.2).
    ; ;; Though for some time, standalone info had H and h reversed.
    ; ;; See <http://debbugs.gnu.org/16455>.
    ; (define-key map "H" 'describe-mode)

    ; (define-key map "i" 'Info-index)
    ; (define-key map "I" 'Info-virtual-index)

    ; (define-key map "l" 'Info-history-back)
    ; (define-key map "L" 'Info-history)
    ; (define-key map "m" 'Info-menu)
    ; (define-key map "n" 'Info-next)
    ; (define-key map "p" 'Info-prev)
    ; (define-key map "q" 'Info-exit)

    ; (define-key map "r" 'Info-history-forward)
    ; (define-key map "s" 'Info-search)
    ; (define-key map "S" 'Info-search-case-sensitively)
    ; (define-key map "\M-n" 'clone-buffer)
    ; (define-key map "t" 'Info-top-node)
    ; (define-key map "T" 'Info-toc)
    ; (define-key map "u" 'Info-up)
    ; ;; `w' for consistency with `dired-copy-filename-as-kill'.
    ; (define-key map "w" 'Info-copy-current-node-name)
    ; (define-key map "c" 'Info-copy-current-node-name)
    ; ;; `^' for consistency with `dired-up-directory'.
    ; (define-key map "^" 'Info-up)
    ; (define-key map "," 'Info-index-next)
    ; (define-key map "\177" 'Info-scroll-down)
    ; (define-key map [mouse-2] 'Info-mouse-follow-nearest-node)
    ; (define-key map [follow-link] 'mouse-face)
    ; (define-key map [XF86Back] 'Info-history-back)
    ; (define-key map [XF86Forward] 'Info-history-forward)
    ; map)
  ; "Keymap containing Info commands.")

(after 'evil
  (evil-set-initial-state 'Info-mode-map 'motion)
  (evil-define-key 'motion Info-mode-map
		(kbd "j") 'evil-next-line
		(kbd "k") 'evil-previous-line
		(kbd "h") 'evil-backward-char
		(kbd "l") 'evil-forward-char
		(kbd "Q") 'Info-exit

		(kbd "TAB") 'Info-next-reference
		(kbd "<backspace>") 'Info-prev-reference

		(kbd "1") 'Info-nth-menu-item
		(kbd "2") 'Info-nth-menu-item
		(kbd "3") 'Info-nth-menu-item
		(kbd "4") 'Info-nth-menu-item
		(kbd "5") 'Info-nth-menu-item
		(kbd "6") 'Info-nth-menu-item
		(kbd "7") 'Info-nth-menu-item
		(kbd "8") 'Info-nth-menu-item
		(kbd "9") 'Info-nth-menu-item
		(kbd "0") 'undefined

		(kbd "?") 'Info-summary
		(kbd "D") 'Info-directory
		(kbd "m") 'Info-menu

		(kbd "H") 'Info-help

		(kbd "]") 'Info-forward-node
		(kbd "[") 'Info-backward-node

		(kbd "t") 'Info-top-node
		(kbd "T") 'Info-toc
		(kbd "u") 'Info-up

		(kbd "i") 'Info-index
		(kbd "I") 'Info-virtual-index
		(kbd ";") 'Info-index-next

		(kbd "f") 'Info-follow-reference
        ; (kbd "g") 'Info-goto-node

		(kbd "s") 'Info-search

		(kbd "r") 'Info-history-forward
		(kbd "b") 'Info-history-back

		;; next/prev?
		(kbd "n") 'Info-next
		(kbd "p") 'Info-prev

		
		))

(provide 'my-info)

