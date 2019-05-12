;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun factorp (number test)
  "Returns non-nil if `TEST' is a factor of `NUMBER'."
  (zerop (% number test)))

(defun factors (number)
  "Returns list of all factors of `NUMBER'."
  (cl-loop for n from 1 below number
           if (factorp number n)
           collect n))

(defun aliquot-sum (number)
  "Returns the aliquot sum of `NUMBER'."
  (apply '+ (factors number)))

(defun nicomachus-classification (number)
  "Returns Nicomachus's classification for `NUMBER'."
  (let ((asum (aliquot-sum number)))
    (cond ((= asum number) 'perfect)
          ((> asum number) 'abundant)
          ((< asum number) 'deficient))))

(defun perfectp (number)
  "Returns non-nil if `NUMBER' is perfect."
  (eq 'perfect (nicomachus-classification number)))

(defun perfect-numbers (max)
  "Returns a list of all perfect numbers from 1 to `MAX'."
  (cl-loop for n from 1 to max
           if (perfectp n)
           collect n))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
