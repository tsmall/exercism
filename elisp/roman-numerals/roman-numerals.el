;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

(defvar roman/rules
  '((1000 . "M")
    (900 . "CM")
    (500 . "D")
    (400 . "CD")
    (100 . "C")
    (90 . "XC")
    (50 . "L")
    (40 . "XL")
    (10 . "X")
    (9 . "IX")
    (5 . "V")
    (4 . "IV")
    (1 . "I")))

(defun roman/first-matching-rule (n)
  (catch 'found
    (dolist (rule roman/rules)
      (if (<= (car rule) n)
          (throw 'found rule)))))

(defun to-roman (n)
  "Convert the number `N' to its Roman numeral equivalent."
  (let ((remaining n)
        (roman ""))
    (while (> remaining 0)
      (let* ((rule (roman/first-matching-rule remaining))
             (size (car rule))
             (char (cdr rule)))
        (setq remaining (- remaining size))
        (setq roman (concat roman char))))
    roman))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
