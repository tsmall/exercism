Pair := Object clone do(

  left  := nil
  right := nil

  with := method(left, right,
    pair := Pair clone
    pair left = left
    pair right = right
    pair
  )

  isMismatch := method(
    left != right
  )

)


Sequence pairedWith := method(aSequence,
  (self size == aSequence size) ifFalse(
    Exception raise("Sequences must be same length")
  )

  pairs := List clone
  self foreach(index, value,
    pairs append(Pair with(value, aSequence at(index)))
  )
  pairs
)
