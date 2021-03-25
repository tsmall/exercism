use "ponytest"

actor Main is TestList
  new create(env: Env) => PonyTest(env, this)
  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_TestNoName)
    test(_TestName)


class iso _TestNoName is UnitTest
  fun name(): String => "Greeting without a name provided"

  fun apply(h: TestHelper) =>
    h.assert_eq[String]("Hello, world!", Greeter.greet())


class iso _TestName is UnitTest
  fun name(): String => "Greeting with a name provided"

  fun apply(h: TestHelper) =>
    h.assert_eq[String]("Hello, Gary!", Greeter.greet("Gary"))
