;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:

(defun divisible-by-p (number divisor)
  "Returns `t' if NUMBER is evenly divisible by DIVISOR."
  (= 0 (mod number divisor)))

(defun leap-year-p (year)
  "Returns `t' if YEAR is a leap year, `nil' otherwise."
  (and (divisible-by-p year 4)
       (or (not (divisible-by-p year 100))
           (and (divisible-by-p year 100)
                (divisible-by-p year 400)))))

(provide 'leap)
;;; leap.el ends here
