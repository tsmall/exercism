# Import `Pair` objects so `Sequence`s know how to pair themselves.
Pair


DnaStrand := Object clone do(

  notation := ""

  with := method(nucleicAcidNotation,
    strand := DnaStrand clone
    strand notation = nucleicAcidNotation
    strand
  )

  hammingDistanceFrom := method(aDnaStrand,
    pairs := notation pairedWith(aDnaStrand notation)
    mismatches := pairs select(isMismatch)
    mismatches size
  )

)
