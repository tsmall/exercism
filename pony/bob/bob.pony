class _Prompt
  let _string: String val

  new create(string: String box) =>
    let s = string.string()
    s.strip()
    _string = consume s

  fun is_question(): Bool =>
    let last_char = try _string( _string.size() - 1 )? else '\0' end
    last_char == '?'

  fun is_silence(): Bool =>
    _string.size() == 0

  fun is_yell(): Bool =>
    var saw_uppercase_char = false
    var never_saw_lowercase_char = true
    for char in _string.values() do
      if ASCII.is_lowercase(char) then
        never_saw_lowercase_char = false
      end
      if ASCII.is_uppercase(char) then
        saw_uppercase_char = true
      end
    end
    saw_uppercase_char and never_saw_lowercase_char


primitive Bob
  fun respond_to(prompt: String box): String =>
    let p = _Prompt(prompt)
    if p.is_question() then
      "Sure."
    elseif p.is_silence() then
      "Fine. Be that way!"
    elseif p.is_yell() then
      "Whoa, chill out!"
    else
      "Whatever."
    end

