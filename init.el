;; ~/.emacs.d/init.el
;; This file serves as the entry point to a new universe. Strings here vibrate
;; as parentheses. Fields and particles take strange shapes like "M-x" and
;; "C-x". The syntax of algebra itself is prefixed.

;; Reduce the frequency of garbage collections to help facilitate a faster startup
(setq gc-cons-threshold (* 50 1000 1000))

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

;; Increase the frequency of garbage collections once everything is loaded
(setq gc-cons-threshold (* 2 1000 1000))
