;;; etl.el --- etl Exercise (exercism)

;;; Commentary:

;;; Code:

(defun etl (old-format)
  "Converts Scrabble scores from `OLD-FORMAT' to the new format."
  (let ((new-format (make-hash-table)))
    (maphash
     (lambda (k v)
       (when (< k 0) (error "Scores cannot be negative"))
       (dolist (char v)
         (when (not (stringp char)) (error "Letters must be strings"))
         (puthash (downcase char) k new-format)))
     old-format)
    new-format))

(provide 'etl)
;;; etl.el ends here
