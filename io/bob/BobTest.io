BobTest := UnitTest clone do(

  # --------------------------------------------------------------------------
  # QUESTIONS

  questions := Map with(
    "Simple",            "Does this cryogenic chamber make me look fat?",
    "ContainingNumber",  "You are, what, like 15?",
    "Gibberish",         "fffbbcbeab?",
    "OnlyNumbers",       "42?",
    "OnlyPunctuation",   ":) ?",
    "MultipleSentences", "Wait! Hang on. Are you going to be OK?",
    "ExtraSpaces",       "Okay if like my  spacebar  quite a bit?   "
  )

  questions foreach(label, question,
    setSlot(
      "testQuestion#{label}" interpolate,
      method(self assertEquals(Bob respondTo(question), "Sure."))
    )
  )

  # --------------------------------------------------------------------------
  # YELLS

  yells := Map with(
    "Basic",            "I HATE YOU",
    "Gibberish",        "FCECDFCAAB",
    "ExclamationPoint", "WATCH OUT!",
    "Numbers",          "1, 2, 3 GO!",
    "Punctuation",      "ZOMG THE %^*@#\$(*^ ZOMBIES ARE COMING!!11!!1!"
  )

  yells foreach(label, yell,
    setSlot(
      "testYell#{label}" interpolate,
      method(self assertEquals(Bob respondTo(yell), "Whoa, chill out!"))
    )
  )

  # --------------------------------------------------------------------------
  # SILENCES

  silences := Map with(
    "Empty",      "",
    "Spaces",     "          ",
    "Tabs",       "\t\t\t\t\t\t\t\t\t\t",
    "Whitespace", "\n\r \t"
  )

  silences foreach(label, silence,
    setSlot(
      "testSilence#{label}" interpolate,
      method(self assertEquals(Bob respondTo(silence), "Fine. Be that way!"))
    )
  )

  # --------------------------------------------------------------------------
  # MISCELLANEOUS

  miscs := list(
    "Tom-ay-to, tom-aaaah-to.",
    "Let's go make out behind the gym!",
    "It's OK if you don't want to go to the DMV.",
    "1, 2, 3",
    "Ending with ? means a question.",
    "\nDoes this cryogenic chamber make me look fat?\nno",
    "         hmmmmmmm...",
    "This is a statement ending with whitespace      "
  )

  miscs foreach(index, misc,
    setSlot(
      "testMisc#{index}" interpolate,
      method(self assertEquals(Bob respondTo(misc), "Whatever."))
    )
  )

)


FileCollector run
