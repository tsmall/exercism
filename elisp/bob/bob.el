;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:
(require 'subr-x)

(defun string-capitalized-p (str)
  "Returns t if STR consists of only uppercase letters."
  (let ((case-fold-search nil))
    (let ((has-letter (string-match-p "[[:upper:]]" str))
          (all-upper (string-match-p "\\`[[:upper:][:punct:][:digit:][:space:]]+\\'" str)))
      (and has-letter all-upper))))

(defun string-empty-or-blank-p (str)
  "Returns t if STR is empty or contains only whitespace."
  (or (string-empty-p str)
      (string-match-p "\\`[[:space:]]+\\'" str)))

(defun response-for (message)
  "Determines and returns Bob's response to MESSAGE."
  (cond ((string-capitalized-p message) "Whoa, chill out!")
        ((string-empty-or-blank-p message) "Fine. Be that way!")
        ((string-suffix-p "?" message) "Sure.")
        (t "Whatever.")))

(provide 'bob)
;;; bob.el ends here
