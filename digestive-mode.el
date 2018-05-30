(require 'f)

(defvar digestive-pipe-path "/home/wax/workbench/compiler-experiment/build/in")


(defun digestive-reload ()
  "Reload file"
  (interactive)
  (f-append-text (concat "reload " (buffer-file-name) "\n") 'utf-8 digestive-pipe-path)
  (message "Reloading file..."))


(defun digestive-setup-current-buffer ()
  (interactive)
  (when (and
	 (= (buffer-size (current-buffer)) 0) ;; Buffer is empty
	 (string= (file-name-extension buffer-file-name) ".dgr")) ;; and has dgr extension.
    (insert "# Test header: \n")
    (insert "#@ name: \n")
    (insert "#@ description: \n")
    (insert "\n\n\n")
    (insert "# Expected output: \n")
    (insert "#$")
    (end-of-line -2)))


(defvar digestive-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-l") 'digestive-reload)
    map)
  "Keymap for 'digestive-mode'"
  )


(define-derived-mode digestive-mode javascript-mode "Digestive"
  "digestive-mode is a major mode for editing Digestive source files"

  (setq tab-width 4)

  (font-lock-add-keywords nil
			  '(
			    ("fun" . font-lock-keyword-face)
			    ("var"  . font-lock-keyword-face)

			    ("dumpasm" . font-lock-keyword-face)
			    ("dumpir" . font-lock-keyword-face)
			    
			    ("i16" . font-lock-type-face)
			    ("i32" . font-lock-type-face)
			    ("i64" . font-lock-type-face)

			    ("byte" . font-lock-type-face)
			    ("n8" . font-lock-type-face)
			    ("n16" . font-lock-type-face)
			    ("n32" . font-lock-type-face)
			    ("n64" . font-lock-type-face)

			    ("#\\.\\*" . font-lock-comment-face) 
			    
			    ("pln"  . font-lock-builtin-face)
			    ("trap" . font-lock-builtin-face)
			    )
			  )
  

  (setq comment-start "#")
  (setq comment-end "")
  
  (modify-syntax-entry ?# "< b" digestive-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" digestive-mode-syntax-table))


(provide 'digestive-mode)
