num = 0

function loop(arg)
  num = num + 1
  writeLn(num .. ") " .. arg .. "!")
  setInput("")
  scrollToEnd()
end

writeLn("Hello, it's Lua!")
