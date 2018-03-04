;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'subr-x)


(defvar tested-allergens
  '(("eggs" 1)
    ("peanuts" 2)
    ("shellfish" 4)
    ("strawberries" 8)
    ("tomatoes" 16)
    ("chocolate" 32)
    ("pollen" 64)
    ("cats" 128))
  "All of the tested allergens with their associated scores.")


(defun allergic-to-p (score allergen)
  "Returns `t' if ALLERGEN is encoded in SCORE, `nil' otherwise."
  (when-let ((allergen-score (cadr (assoc allergen tested-allergens))))
    (not (zerop (logand score allergen-score)))))


(defun allergen-list (score)
  "Returns all allergens encoded in SCORE."
  (cl-loop for allergen in (mapcar 'car tested-allergens)
           if (allergic-to-p score allergen)
           collect allergen))


(provide 'allergies)
;;; allergies.el ends here
