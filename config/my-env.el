;; my-env.el
;; Environment settings.

;; User name and e-mail
(setq user-full-name   "askobeldin")
(setq user-mail-adress "askobeldin@gmail.com")

;; Coding-system
(set-language-environment 'UTF-8)

(if (or (my-system-is-linux) (my-system-is-mac))
    (progn
        (setq default-buffer-file-coding-system 'utf-8)
        (setq-default coding-system-for-read    'utf-8)
        (setq file-name-coding-system           'utf-8)
        (set-selection-coding-system            'utf-8)
        (set-keyboard-coding-system        'utf-8-unix)
        (set-terminal-coding-system             'utf-8)
        (prefer-coding-system                   'utf-8))
    (progn
        ; (setq default-buffer-file-coding-system 'windows-1251)
        (setq default-buffer-file-coding-system 'utf-8)
        ; (setq-default coding-system-for-read    'windows-1251)
        (setq file-name-coding-system           'windows-1251)
        (set-selection-coding-system            'windows-1251)
        (set-keyboard-coding-system        'windows-1251-unix)
        (set-terminal-coding-system             'windows-1251)
        (prefer-coding-system                   'utf-8)))

;; eww browser
(setq browse-url-browser-function 'eww-browse-url)

;; Если не отменить make-backup-files, Emacs будет засорять
;; файловую систему бэкапами.
(setq-default make-backup-files nil)

;; lockfiles are evil.
(setq create-lockfiles nil)

;; Это включает автосохранение - пока вы работаете с файлом,
;; Emacs время от времени автоматически создает копию, и удаляет её
;; как только вы сохрание файл с которым работаете.
(setq-default auto-save-defaults t)
(setq auto-save-interval 500
      auto-save-timeout 0)

;; Директория для автосохранения файлов
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;; Это отключает табы
(setq-default indent-tabs-mode nil)

;; require a trailing newline
(setq require-final-newline nil)

;'Woman' > 'man'.
(defalias 'man 'woman)

(provide 'my-env)
