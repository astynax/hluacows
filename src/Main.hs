module Main where

import           Control.Monad         (when, void)
import qualified Data.ByteString.Char8 as BSS
import           Data.IORef            (newIORef, modifyIORef'
                                       ,writeIORef, readIORef)
import qualified Scripting.Lua         as Lua
import           UI.Dialogui
import           UI.Dialogui.HTk


main :: IO ()
main = setup >>= uncurry (runGUI "Bulls & Cows")


setup :: IO (Result (), Controller IO ())
setup = do
  lua <- Lua.newstate
  Lua.openlibs lua

  buffer <- newIORef ([] :: Result ())

  let controller =
        Controller { initialize  = return ()
                   , finalize    = const $ Lua.close lua
                   , communicate =
                     \_ msg -> do
                       writeIORef buffer []
                       void $ Lua.callproc lua "loop" (BSS.pack msg)
                       readIORef buffer
                   }

      update x = modifyIORef' buffer (<> x)

      registerVoid2Void name action =
        Lua.registerhsfunction lua name $ update action

      registerStr2Void name action =
        Lua.registerhsfunction lua name $ \x -> update (action $ BSS.unpack x)

  registerStr2Void  "writeLn"       writeLn
  registerStr2Void  "setInput"      setInput
  registerVoid2Void "clear"         clear
  registerVoid2Void "scrollToBegin" scrollToBegin
  registerVoid2Void "scrollToEnd"   scrollToEnd

  res <- Lua.loadfile lua "controller.lua"
  when (res /= 0) $ error "Can't load controller.lua!"
  Lua.call lua 0 0

  actions <- readIORef buffer

  return (actions, controller)
