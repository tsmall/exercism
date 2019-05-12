;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:

(defun two-fer (&optional name)
  (let ((name (or name "you")))
    (concat "One for " name ", one for me.")))

(provide 'two-fer)
;;; two-fer.el ends here
