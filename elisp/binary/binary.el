;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun string-to-numbers (string)
  "Convert every character in STRING to a number."
  (mapcar 'string-to-number
          (split-string string "" t)))

(defun base-2-to-base-10 (numbers)
  "Convert base-2 values in NUMBERS to their base-10 equavalents."
  (loop for digit in numbers
        for place from (1- (length numbers)) downto 0
        collect (* digit (expt 2 place))))

(defun to-decimal (binary)
  "Returns a decimal representation of the BINARY string."
  (let* ((base-2-digits (string-to-numbers binary))
         (base-10-digits (base-2-to-base-10 base-2-digits)))
    (apply '+ base-10-digits)))

(provide 'binary)
;;; binary.el ends here
