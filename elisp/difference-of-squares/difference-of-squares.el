;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:
(defun square (n)
  "Returns the square of number N."
  (expt n 2))

(defun square-of-sums (limit)
  "Returns the square of the sums from 1 to LIMIT."
  (square (apply '+ (number-sequence 1 limit))))

(defun sum-of-squares (limit)
  "Returns the sum of the squares of numbers from 1 to LIMIT."
  (apply '+ (mapcar 'square (number-sequence 1 limit))))

(defun difference (limit)
  "Returns the difference between square-of-sums and
sum-of-squares from 1 to LIMIT."
  (- (square-of-sums limit)
     (sum-of-squares limit)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
