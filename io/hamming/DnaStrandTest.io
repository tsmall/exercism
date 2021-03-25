DnaStrandTest := UnitTest clone do(

  testEmptyStrands := method(
    assertHammingDistanceEquals("", "", 0)
  )

  testShortIdenticalStrands := method(
    assertHammingDistanceEquals("A", "A", 0)
  )

  testLongIdenticalStrands := method(
    assertHammingDistanceEquals("GGACTGA", "GGACTGA", 0)
  )

  testDifferentSingleNucleotideStrands := method(
    assertHammingDistanceEquals("A", "G", 1)
  )

  testCompletelyDifferentSmallStrands := method(
    assertHammingDistanceEquals("AG", "CT", 2)
  )

  testSmallDistanceInSmallStrands := method(
    assertHammingDistanceEquals("AT", "CT", 1)
  )

  testSmallDistanceInMediumStrands := method(
    assertHammingDistanceEquals("GGACG", "GGTCG", 1)
  )

  testSmallDistanceInLargeStrands := method(
    assertHammingDistanceEquals("ACCAGGG", "ACTATGG", 2)
  )

  testNonUniqueCharactersInFirstStrand := method(
    assertHammingDistanceEquals("AAA", "AAG", 1)
  )

  testSameNucleotidesInDifferentPositions := method(
    assertHammingDistanceEquals("TAG", "GAT", 2)
  )

  testLargeDistance := method(
    assertHammingDistanceEquals("GATACA", "GCATAA", 4)
  )

  testLargeDistanceInOffByOneStrand := method(
    assertHammingDistanceEquals("GGACGGATTCTG", "AGGACGGATTCT", 9)
  )

  testFirstStrandLonger := method(
    original := DnaStrand with("AATG")
    mutated  := DnaStrand with("AAA")

    assertRaisesException(
      original hammingDistanceFrom(mutated)
    )
  )

  testSecondStrandLonger := method(
    original := DnaStrand with("ATA")
    mutated  := DnaStrand with("AGTG")

    assertRaisesException(
      original hammingDistanceFrom(mutated)
    )
  )

  assertHammingDistanceEquals := method(strandA, strandB, distance,
    original := DnaStrand with(strandA)
    mutated  := DnaStrand with(strandB)

    assertEquals(original hammingDistanceFrom(mutated), distance)
  )

)


FileCollector run
