Greeter := Object clone do(

  greet := method(name,
    name ifNil(name = "world")
    "Hello, #{name}!" interpolate
  )

)
