primitive ASCII
  fun is_lowercase(char: U8): Bool =>
    (char >= 'a') and (char <= 'z')

  fun is_uppercase(char: U8): Bool =>
    (char >= 'A') and (char <= 'Z')
