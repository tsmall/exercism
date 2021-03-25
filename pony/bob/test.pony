use "ponytest"

actor Main is TestList
  new create(env: Env) => PonyTest(env, this)
  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_TestQuestions)
    test(_TestSilences)
    test(_TestYells)
    test(_TestMiscellaneous)


primitive Assert
  fun response(h: TestHelper, prompts: Array[String], expected_response: String) =>
    var r: String = ""
    for prompt in prompts.values() do
      r = Bob.respond_to(prompt)
      h.assert_eq[String](expected_response, r, "\"" + prompt + "\"")
    end


class iso _TestQuestions is UnitTest
  fun name(): String => "questions"

  fun apply(h: TestHelper) =>
    let questions =
      [
        "Does this cryogenic chamber make me look fat?"
        "You are, what, like 15?"
        "fffbbcbeab?"
        "42?"
        ":) ?"
        "Wait! Hang on. Are you going to be OK?"
        "Okay if like my  spacebar  quite a bit?   "
      ]

    Assert.response(h
      where
        prompts = questions,
        expected_response = "Sure.")


class iso _TestSilences is UnitTest
  fun name(): String => "silences"

  fun apply(h: TestHelper) =>
    let silences =
      [
        ""
        "          "
        "\t\t\t\t\t\t\t\t\t\t"
        "\n\r \t"
      ]

    Assert.response(h
      where
        prompts = silences,
        expected_response = "Fine. Be that way!")

class iso _TestYells is UnitTest
  fun name(): String => "yells"

  fun apply(h: TestHelper) =>
    let yells =
      [
        "I HATE YOU"
        "FCECDFCAAB"
        "WATCH OUT!"
        "1, 2, 3 GO!"
        "ZOMG THE %^*@#\\$(*^ ZOMBIES ARE COMING!!11!!1!"
      ]

    Assert.response(h
      where
        prompts = yells,
        expected_response = "Whoa, chill out!")


class iso _TestMiscellaneous is UnitTest
  fun name(): String => "miscellaneous"

  fun apply(h: TestHelper) =>
    let misc =
      [
        "Tom-ay-to, tom-aaaah-to."
        "Let's go make out behind the gym!"
        "It's OK if you don't want to go to the DMV."
        "1, 2, 3"
        "Ending with ? means a question."
        "\nDoes this cryogenic chamber make me look fat?\nno"
        "         hmmmmmmm..."
        "This is a statement ending with whitespace      "
      ]

    Assert.response(h
      where
        prompts = misc,
        expected_response = "Whatever.")
