;; my-neotree.el
;;

;;;;;;; info from original neotree-mode-map
;; (define-key map (kbd "TAB")     (neotree-make-executor
;;                                  :dir-fn  'neo-open-dir))
;; (define-key map (kbd "RET")     (neotree-make-executor
;;                                  :file-fn 'neo-open-file
;;                                  :dir-fn  'neo-open-dir))
;; (define-key map (kbd "|")       (neotree-make-executor
;;                                  :file-fn 'neo-open-file-vertical-split))
;; (define-key map (kbd "-")       (neotree-make-executor
;;                                  :file-fn 'neo-open-file-horizontal-split))
;; (define-key map (kbd "a")       (neotree-make-executor
;;                                  :file-fn 'neo-open-file-ace-window))
;; (define-key map (kbd "d")       (neotree-make-executor
;;                                  :dir-fn 'neo-open-dired))
;; (define-key map (kbd "SPC")     'neotree-quick-look)
;; (define-key map (kbd "g")       'neotree-refresh)
;; (define-key map (kbd "q")       'neotree-hide)
;; (define-key map (kbd "p")       'neotree-previous-line)
;; (define-key map (kbd "C-p")     'neotree-previous-line)
;; (define-key map (kbd "n")       'neotree-next-line)
;; (define-key map (kbd "C-n")     'neotree-next-line)
;; (define-key map (kbd "A")       'neotree-stretch-toggle)
;; (define-key map (kbd "U")       'neotree-select-up-node)
;; (define-key map (kbd "D")       'neotree-select-down-node)
;; (define-key map (kbd "H")       'neotree-hidden-file-toggle)
;; (define-key map (kbd "S")       'neotree-select-previous-sibling-node)
;; (define-key map (kbd "s")       'neotree-select-next-sibling-node)
;; (define-key map (kbd "C-x C-f") 'find-file-other-window)
;; (define-key map (kbd "C-x 1")   'neotree-empty-fn)
;; (define-key map (kbd "C-x 2")   'neotree-empty-fn)
;; (define-key map (kbd "C-x 3")   'neotree-empty-fn)
;; (define-key map (kbd "C-c C-f") 'find-file-other-window)
;; (define-key map (kbd "C-c C-c") 'neotree-change-root)
;; (define-key map (kbd "C-c c")   'neotree-dir)
;; (cond
;;  ((eq neo-keymap-style 'default)
;;   (define-key map (kbd "C-c C-n") 'neotree-create-node)
;;   (define-key map (kbd "C-c C-d") 'neotree-delete-node)
;;   (define-key map (kbd "C-c C-r") 'neotree-rename-node)
;;   (define-key map (kbd "C-c C-p") 'neotree-copy-node))
;;  ((eq neo-keymap-style 'concise)
;;   (define-key map (kbd "C") 'neotree-change-root)
;;   (define-key map (kbd "c") 'neotree-create-node)
;;   (define-key map (kbd "+") 'neotree-create-node)
;;   (define-key map (kbd "d") 'neotree-delete-node)
;;   (define-key map (kbd "r") 'neotree-rename-node)
;;   (define-key map (kbd "p") 'neotree-create-node)
;;   (define-key map (kbd "e") 'neotree-enter)))

(use-package neotree
  :init
  (after 'evil
    (evil-set-initial-state 'neotree-mode 'normal))
  :config
  (progn
    ;; global key for neotree toggle
    (global-set-key [f9] 'neotree-toggle)

    (evil-define-key 'normal neotree-mode-map (kbd "TAB") (neotree-make-executor 
                                                           :dir-fn 'neo-open-dir))
    (evil-define-key 'normal neotree-mode-map (kbd "RET") (neotree-make-executor 
                                                           :file-fn 'neo-open-file
                                                           :dir-fn 'neo-open-dir))
    (evil-define-key 'normal neotree-mode-map (kbd "|") (neotree-make-executor 
                                                         :file-fn 'neo-open-file-vertical-split))
    (evil-define-key 'normal neotree-mode-map (kbd "-") (neotree-make-executor 
                                                         :file-fn 'neo-open-file-horizontal-split))
    (evil-define-key 'normal neotree-mode-map (kbd "a") (neotree-make-executor 
                                                         :file-fn 'neo-open-file-ace-window))
    (evil-define-key 'normal neotree-mode-map (kbd "d") (neotree-make-executor 
                                                         :dir-fn 'neo-open-dired))


    (evil-define-key 'normal neotree-mode-map (kbd "H")   'neotree-hidden-file-toggle)
    (evil-define-key 'normal neotree-mode-map (kbd "g")   'neotree-refresh)
    (evil-define-key 'normal neotree-mode-map (kbd "j")   'neotree-next-line)
    (evil-define-key 'normal neotree-mode-map (kbd "k")   'neotree-previous-line)
    (evil-define-key 'normal neotree-mode-map (kbd "A")   'neotree-stretch-toggle)
    (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
    (evil-define-key 'normal neotree-mode-map (kbd "q")   'neotree-hide)
    (evil-define-key 'normal neotree-mode-map (kbd "U")   'neotree-select-up-node)
    (evil-define-key 'normal neotree-mode-map (kbd "D")   'neotree-select-down-node)
    (evil-define-key 'normal neotree-mode-map (kbd "S")   'neotree-select-previous-sibling-node)
    (evil-define-key 'normal neotree-mode-map (kbd "s")   'neotree-select-next-sibling-node)

    (evil-define-key 'normal neotree-mode-map (kbd "c r") 'neotree-change-root)
    (evil-define-key 'normal neotree-mode-map (kbd "c d") 'neotree-dir)

    ))

(provide 'my-neotree)
