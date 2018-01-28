;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun hamming-distance (strand-a strand-b)
  "Calculate the Hamming distance between two DNA strands."
  (unless (= (length strand-a) (length strand-b))
    (error "Strands must be the same length"))
  (cl-loop for a across strand-a
           for b across strand-b
           count (not (char-equal a b))))

(provide 'hamming)
;;; hamming.el ends here
