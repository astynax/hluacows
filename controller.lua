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
         writeLn([[
The "Bulls & Cows" Game.
To win a game you should guess a four-digit number.
On each of your tries program tell how many cows and bulls this try has.
"Bull" means what you have a one correct digit at the correct place.
"Cow" means what you have a one correct digit that placed incorrectly.

Available commands:
- 'n' - start new game,
- 'h' or '?' - show this help,
]])

      elseif string.match(arg, "^%d%d%d%d$") then
         input = tonumber(arg)
         -- TODO: complete the gameplay cycle

      else
         writeLn([[
Bad input! Enter 'n', 'h', '?', or 4-digit number, please.]])
      end
   end
   setInput("")
   scrollToEnd()
end

writeLn([[Hello, this is "Bull & Cows" Game!]])
newGame()
