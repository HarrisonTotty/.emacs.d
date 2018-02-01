;; ~/.emacs.d/init.el
;; This file serves as the entry point to a new universe. Strings here vibrate
;; as parentheses. Fields and particles take strange shapes like "M-x" and
;; "C-y". The syntax of algebra itself is prefixed.

;; Bootstrap my package manager
(let ((bootstrap-file (concat user-emacs-directory "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 3))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install/verify org mode
(straight-use-package 'org)

;; "Run" my configuraiton file 
(org-babel-load-file "~/.emacs.d/config.org")
