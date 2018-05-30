(define-derived-mode digestive-bnf-mode prog-mode "Digestive-syntax"
  "digestive-bnf-mode is a major mode for editing Digestive syntax source files"

  (setq tab-width 8)

  (font-lock-add-keywords nil
			  '(
			    ("<.+>" . font-lock-type-face)
			    ("#.*"  . font-lock-comment-face)
			    ("^[[:upper:]][[:alnum:]]*" . font-lock-function-name-face)
			    ("@[[:ascii:]][[:alnum:]]*" . font-lock-preprocessor-face)
			    ("[[:upper:]][[:alnum:]]*" . font-lock-variable-name-face)))
  

  (setq comment-start "#")
  (setq comment-end "")
  
  (modify-syntax-entry ?# "< b" digestive-bnf-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" digestive-bnf-mode-syntax-table))


(provide 'digestive-bnf-mode)
