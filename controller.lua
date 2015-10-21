num = nil

function newGame()
   num = tostring(math.random(10000))
   writeLn("New game started!")
end

function loop(arg)
   if not(arg == "") then
      if arg == "n" then
         newGame()

      elseif arg == "h" or arg == "?" then
         -- TODO: show help!

      elseif string.match(arg, "^%d%d%d%d$") then
         input = tonumber(arg)
         -- TODO: complete the gameplay cycle

      else
         writeLn([[
Bad input! Enter 'n', 'h', '?', or 4-digit numbers, please.]])
      end
   end
   setInput("")
   scrollToEnd()
end

writeLn([[Hello, this is "Bull & Cows" Game!]])
newGame()
