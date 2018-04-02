;; my-leader-keys.el
;; <leader> keybindings for evil-leader
;;


;; create a function for jumping between buffers from files
;; name of function: `ace-jump-thefiles-buffers'
;(make-ace-jump-buffer-function "thefiles"
  ;(with-current-buffer buffer
    ;(not (buffer-file-name buffer))))

(defun my-hop-around-buffers ()
  "Swap the current buffer with the previous one."
  (interactive)
  (switch-to-buffer (other-buffer "*Ibuffer*")))


(evil-leader/set-key
        "w"          'save-buffer
        "qq"         'kill-this-buffer
        "qw"         'evil-window-delete
        "Q"          'kill-buffer-and-window

        ">"          'find-file-at-point

        "\\"         'split-window-horizontally
        "-"          'split-window-vertically
        ","          'other-window

        "#"          'linum-mode

        ;; evil-nerd-commenter config
        "cc"         'evilnc-comment-or-uncomment-lines

        ;; Dired
        "d"          'dired

        ;; buffers and switching
        "TAB"        'my-hop-around-buffers
        "b"          'ibuffer
        "B"          'switch-to-buffer

)

(provide 'my-leader-keys)
