import strutils

proc helloworld*(name: string = "World"): string =
    "Hello, $1!" % [name]
