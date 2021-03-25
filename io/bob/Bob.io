Bob := Object clone do(

  respondTo := method(prompt,
    prompt = Prompt from(prompt)

    prompt isQuestion ifTrue(return("Sure."))
    prompt isSilence  ifTrue(return("Fine. Be that way!"))
    prompt isYell     ifTrue(return("Whoa, chill out!"))
    return("Whatever.")
  )

)


Prompt := Object clone do(

  string ::= nil

  from := method(anObject,
    anObject isKindOf(Prompt) ifTrue(return(anObject))
    Prompt clone setString(anObject)
  )

  isQuestion := method(
    string asMutable strip endsWithSeq("?")
  )

  isSilence := method(
    string foreach(char, char isSpace ifFalse(return(false)))
    true
  )

  isYell := method(
    string isUppercase
  )

)
