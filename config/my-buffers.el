;; my-buffers.el

;; better buffer names for duplicates
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-ignore-buffers-re "^\\*" ; leave special buffers alone
      uniquify-after-kill-buffer-p t)

;; expert mode
(setq ibuffer-expert t)

;; my filter groups
(setq ibuffer-saved-filter-groups
          (quote (("default"
                   ("Dired" (mode . dired-mode))
                   ("Code" (or 
                             (mode . python-mode)
                             (mode . emacs-lisp-mode)
                             (mode . lisp-mode)))
                   ("Planner" (or
                             (name . "^\\*Calendar\\*$")
                             (name . "^diary$")
                             (mode . org-mode)))
                   ("emacs" (or
                              (name . "^\\*scratch\\*$")
                              (name . "^\\*Messages\\*$")))
                   ("Web" (or (mode . html-mode)
                                  (mode . json-mode)
                                  (mode . css-mode)))
                   ("Help" (or
                             (name . "\*Help\*")
                             (name . "\*Apropos\*")
                             (name . "\*info\*")))
                   ("emacs created" (or
                                      (name . "^\\*")))))))

;; apply 
(add-hook 'ibuffer-mode-hook
    '(lambda ()
       (hl-line-mode t)
       (ibuffer-switch-to-saved-filter-groups "default")))

;; don't show empty filter groups
(setq ibuffer-show-empty-filter-groups nil)

;; keybindings
(eval-after-load 'ibuffer
                 '(progn
                    (evil-set-initial-state 'ibuffer-mode 'normal)
                    (evil-define-key 'normal ibuffer-mode-map

                        [backtab] 'ibuffer-toggle-filter-group
                        [tab] 'ibuffer-toggle-filter-group

                        (kbd "0") 'digit-argument
                        (kbd "1") 'digit-argument
                        (kbd "2") 'digit-argument
                        (kbd "3") 'digit-argument
                        (kbd "4") 'digit-argument
                        (kbd "5") 'digit-argument
                        (kbd "6") 'digit-argument
                        (kbd "7") 'digit-argument
                        (kbd "8") 'digit-argument
                        (kbd "9") 'digit-argument

                        (kbd "m") 'ibuffer-mark-forward
                        (kbd "v") 'ibuffer-toggle-marks
                        (kbd "u") 'ibuffer-unmark-forward

                        (kbd "j") 'evil-next-line
                        (kbd "k") 'evil-previous-line
                        (kbd "DEL") 'ibuffer-unmark-backward
                        (kbd "* *") 'ibuffer-unmark-all

                        (kbd "d") 'ibuffer-mark-for-delete
                        (kbd "x") 'ibuffer-do-kill-on-deletion-marks

                        ;; immediate operations
                        (kbd "n") 'ibuffer-forward-filter-group
                        (kbd "SPC") 'forward-line
                        (kbd "g") 'ibuffer-update

                        "-" 'ibuffer-add-to-tmp-hide
                        "+" 'ibuffer-add-to-tmp-show

                        (kbd "s i") 'ibuffer-invert-sorting
                        (kbd "s a") 'ibuffer-do-sort-by-alphabetic
                        (kbd "s v") 'ibuffer-do-sort-by-recency
                        (kbd "s s") 'ibuffer-do-sort-by-size
                        (kbd "s f") 'ibuffer-do-sort-by-filename/process
                        (kbd "s m") 'ibuffer-do-sort-by-major-mode

                        ;; marked operation
                        (kbd "A") 'ibuffer-do-view
                        (kbd "D") 'ibuffer-do-delete
                        (kbd "E") 'ibuffer-do-eval
                        (kbd "F") 'ibuffer-do-shell-command-file
                        (kbd "I") 'ibuffer-do-query-replace-regexp
                        (kbd "H") 'ibuffer-do-view-other-frame
                        (kbd "P") 'ibuffer-do-shell-command-pipe-replace
                        (kbd "M") 'ibuffer-do-toggle-modified
                        (kbd "O") 'ibuffer-do-occur
                        ;; (kbd "P") 'ibuffer-do-print
                        (kbd "Q") 'ibuffer-do-query-replace
                        (kbd "R") 'ibuffer-do-rename-uniquely
                        (kbd "S") 'ibuffer-do-save
                        (kbd "T") 'ibuffer-do-toggle-read-only
                        (kbd "U") 'ibuffer-do-replace-regexp
                        (kbd "V") 'ibuffer-do-revert
                        (kbd "W") 'ibuffer-do-view-and-eval
                        (kbd "X") 'ibuffer-do-shell-command-pipe
                        )))

(provide 'my-buffers)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; additional info from https://www.emacswiki.org/emacs/IbufferMode

;; Gnus-style grouping

;; Ibuffer has an excellent implementation of Gnus-style grouping. Try this:

;;     (setq ibuffer-saved-filter-groups
;;           (quote (("default"
;;                    ("dired" (mode . dired-mode))
;;                    ("perl" (mode . cperl-mode))
;;                    ("erc" (mode . erc-mode))
;;                    ("planner" (or
;;                                (name . "^\\*Calendar\\*$")
;;                                (name . "^diary$")
;;                                (mode . muse-mode)))
;;                    ("emacs" (or
;;                              (name . "^\\*scratch\\*$")
;;                              (name . "^\\*Messages\\*$")))
;;                    ("gnus" (or
;;                             (mode . message-mode)
;;                             (mode . bbdb-mode)
;;                             (mode . mail-mode)
;;                             (mode . gnus-group-mode)
;;                             (mode . gnus-summary-mode)
;;                             (mode . gnus-article-mode)
;;                             (name . "^\\.bbdb$")
;;                             (name . "^\\.newsrc-dribble")))))))
;;     (add-hook 'ibuffer-mode-hook
;;               (lambda ()
;;                 (ibuffer-switch-to-saved-filter-groups "default")))

;; Then M-x dired then M-x ibuffer and you should see your dired buffer
;; in a group. Open more of them and they all endup in there. This means
;; that when browsing buffers you can skip over the items you are used to
;; seeing. Anything not grouped goes at the bottom of the ibuffer
;; buffer. – PhilJackson

;; It looks as though the default filterings are as follows:

;;     predicate
;;     content
;;     size-lt
;;     size-gt
;;     filename
;;     name
;;     used-mode
;;     mode

;; Since filename can work for any part of the path, if you filter on a
;; partial (or complete) directory, anything you have open from the
;; directory is now grouped:

;;     ("journal" (filename . "/personal/journal/"))

;; I’m not familiar with gnus, and have been unsuccessful tracking
;; written docs on filtering – I extracted the above from a reading of
;; ibuf-ext.el and then onto the contents of ibuffer-filtering-alist. If
;; there is anything out there, somebody please add it in, and edit this
;; note.

;; Use Human readable Size column

;; I don’t like default “Size” column, so I write a human readable column
;; instead of original one. – coldnew

;; ;; Use human readable Size column instead of original one
;; (define-ibuffer-column size-h
;;   (:name "Size" :inline t)
;;   (cond
;;    ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
;;    ((> (buffer-size) 100000) (format "%7.0fk" (/ (buffer-size) 1000.0)))
;;    ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
;;    (t (format "%8d" (buffer-size)))))

;; ;; Modify the default ibuffer-formats
;;   (setq ibuffer-formats
;;  '((mark modified read-only " "
;;      (name 18 18 :left :elide)
;;      " "
;;      (size-h 9 -1 :right)
;;      " "
;;      (mode 16 16 :left :elide)
;;      " "
;;      filename-and-process)))


;; Have some buffer groups collapsed by default

;; I have some buffer groups that i prefer do be collapsed by
;; default. Since i found no way to have this working i adviced ibuffer
;; like this:

;; (setq mp/ibuffer-collapsed-groups (list "Helm" "*Internal*"))
;; (defadvice ibuffer (after collapse-helm)
;;   (dolist (group mp/ibuffer-collapsed-groups)
;;    (progn
;;      (goto-char 1)
;;      (when (search-forward (concat "[ " group " ]") (point-max) t)
;;        (progn
;;      (move-beginning-of-line nil)
;;      (ibuffer-toggle-filter-group)
;;      )
;;        )
;;      )
;;    )
;;     (goto-char 1)
;;     (search-forward "[ " (point-max) t)
;;   )
;; (ad-activate 'ibuffer)
