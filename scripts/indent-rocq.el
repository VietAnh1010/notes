;; Runs Emacs `indent-region' over each .v file passed on the command line,
;; using Proof General's coq-mode and the indentation settings from ~/.emacs.
;;
;; Usage (from the repo root):
;; emacs --batch -l scripts/indent-rocq.el $(find <repo> -name '*.v')

(load (expand-file-name "~/.emacs"))

(let ((base default-directory))
  (dolist (file command-line-args-left)
    (message "Indenting %s" file)
    (find-file (expand-file-name file base))
    (coq-mode)
    (indent-region (point-min) (point-max))
    (save-buffer)))
