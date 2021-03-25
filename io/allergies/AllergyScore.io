AllergyScore := Object clone do(

  value ::= 0

  allergenValues := Map with(
    "eggs",         1,
    "peanuts",      2,
    "shellfish",    4,
    "strawberries", 8,
    "tomatoes",     16,
    "chocolate",    32,
    "pollen",       64,
    "cats",         128
  )

  with := method(value,
    score := AllergyScore clone
    score setValue(value)
    score
  )

  allergicTo := method(allergen,
    allergenValue := allergenValues at(allergen)
    value bitwiseAnd(allergenValue) != 0
  )

  allAllergens := method(
    allergenValues select(allergen, self allergicTo(allergen)) keys
  )

)
