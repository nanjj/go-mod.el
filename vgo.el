;;; vgo-mode.el --- Major mode for go module file  -*- lexical-binding: t; -*-

;; Copyright (C) 2019 JUN JIE NAN

;; Author: JUN JIE NAN <nanjunjie@gmail.com>
;; Keywords: go, mod, module, version

;;; Commentary:

;; A very basic version of major mode for go.mod file
;; Current features:
;;
;;  - keyword highlight
;;
;;; Code:

(defun go-mod-tidy()
  "Run go mod tidy"
  (interactive)
  (shell-command "go mod tidy -v"))

(defun go-mod-graph()
  "Run go mod graph"
  (interactive)
  (shell-command "go mod graph"))

(defun go-mod-init()
  "Run go mod init"
  (interactive)
  (shell-command "go mod init"))

(defun go-mod-verify()
  "Run go mod verify"
  (interactive)
  (shell-command "go mod verify"))

(defconst vgo-mode-syntax-table
  (-let [table
         (copy-syntax-table prog-mode-syntax-table)]
    (modify-syntax-entry ?\/ ". 12b" table)
    (modify-syntax-entry ?\n "> b" table)
    table)
  "vgo mode syntax table.")

(setq vgo-mode-highlights
      '(("^\\(module\\) " . font-lock-type-face)
        ("^\\(require\\)" . font-lock-function-name-face)
        ("^[\t ]+\\(replace\\)\\|^[\t ]+\\(exclude\\)" . font-lock-builtin-face)
        ("[ ]\\(v[-_A-Za-z0-9./+:]+\\)[ \n]" . font-lock-keyword-face)
        ("\\(h1:[-_A-Za-z0-9./+:]+=\\)[\n]" . font-lock-variable-name-face)))

;;;###autoload
(define-derived-mode vgo-mode prog-mode
  "Go Mod"
  "Major mode for go module file."
  (setq comment-start "//")
  (setq font-lock-defaults '(vgo-mode-highlights)))

;;;###autoload
(add-to-list 'auto-mode-alist '("go\\.mod\\'" . vgo-mode))
(add-to-list 'auto-mode-alist '("go\\.sum\\'" . vgo-mode))

;; add the mode to the `features' list
(provide 'vgo-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; vgo.el ends here
