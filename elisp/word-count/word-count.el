;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:

(defvar *word-count-separator*
  "[[:space:][:punct:]]"
  "Regex to use to split strings provided to WORD-COUNT")

(defun item-counts (xs)
  "Return an alist of (item . count) for items in L."
  (let ((counts '()))
    (dolist (x xs counts)
      (let ((c (assoc x counts)))
        (if c
            (incf (cdr c))
          (setq counts (cons (cons x 1) counts)))))))

(defun word-count (str)
  "Return an alist of (item . count) for words in STR."
  (let* ((omit-nulls t)
         (normalized (downcase str))
         (words (split-string normalized *word-count-separator* omit-nulls)))
    (item-counts words)))

(provide 'word-count)
;;; word-count.el ends here
