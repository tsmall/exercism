AllergyScoreTest := UnitTest clone do(

  // -------------------------------------------------------------------------
  // Tests for determining if a score includes an allergen

  testZeroIsNotAllergicToAnything := method(
    score := AllergyScore with(0)
    assertFalse(score allergicTo("peanuts"))
    assertFalse(score allergicTo("cats"))
    assertFalse(score allergicTo("strawberries"))
  )

  testAllergicToOnlyEggs := method(
    score := AllergyScore with(1)
    assertTrue(score allergicTo("eggs"))
  )

  testAllergicToEggsAndOthers := method(
    score := AllergyScore with(5)
    assertTrue(score allergicTo("eggs"))
  )

  // -------------------------------------------------------------------------
  // Tests for finding all allergens in a score

  testNoAllergens := method(
    score := AllergyScore with(0)
    assertEquals(score allAllergens, list())
  )

  testOnlyEggs := method(
    score := AllergyScore with(1)
    assertEquals(score allAllergens, list("eggs"))
  )

  testOnlyPeanuts := method(
    score := AllergyScore with(2)
    assertEquals(score allAllergens, list("peanuts"))
  )

  testOnlyStrawberries := method(
    score := AllergyScore with(8)
    assertEquals(score allAllergens, list("strawberries"))
  )

  testEggsAndPeanuts := method(
    score := AllergyScore with(3)
    assertEqualsIgnoringOrder(score allAllergens, list("eggs", "peanuts"))
  )

  testEggsAndShellfish := method(
    score := AllergyScore with(5)
    assertEqualsIgnoringOrder(score allAllergens, list("eggs", "shellfish"))
  )

  testFiveAllergens := method(
    score := AllergyScore with(248)
    assertEqualsIgnoringOrder(
      score allAllergens,
      list("strawberries", "tomatoes", "chocolate", "pollen", "cats")
    )
  )

  testAllAllergens := method(
    score := AllergyScore with(255)
    assertEqualsIgnoringOrder(
      score allAllergens,
      list(
        "eggs", "peanuts", "shellfish", "strawberries",
        "tomatoes", "chocolate", "pollen", "cats"
      )
    )
  )

  testIgnoresNonAllergenScoreParts := method(
    score := AllergyScore with(509)
    assertEqualsIgnoringOrder(
      score allAllergens,
      list(
        "eggs", "shellfish", "strawberries", "tomatoes",
        "chocolate", "pollen", "cats"
      )
    )
  )

  assertEqualsIgnoringOrder := method(a, b,
    assertEquals(a sort, b sort)
  )

)


FileCollector run
