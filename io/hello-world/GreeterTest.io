GreeterTest := UnitTest clone do(

  greeter := nil

  setUp := method(
    greeter = Greeter clone
  )

  testNoName := method(
    assertEquals(greeter greet, "Hello, world!")
  )

  testNameGiven := method(
    assertEquals(greeter greet("Dave"), "Hello, Dave!")
  )

)

FileCollector run
