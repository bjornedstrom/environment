import XMonad
import XMonad.Config.Gnome
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName

main = xmonad $ gnomeConfig
       { modMask = mod4Mask
       , startupHook = setWMName "LG3D"
       , terminal = "gnome-terminal"
       , workspaces = myWorkspaces
       } `additionalKeysP` myKeys

myWorkspaces = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
                "ten", "eleven", "thirteen"]

myKeys =
    [
    -- other additional keys
    ]
    ++ -- important since ff. is a list itself, can't just put inside above list
    [ (otherModMasks ++ "M-" ++ [key], action tag)
         | (tag, key)  <- zip myWorkspaces "123456789"
         , (otherModMasks, action) <- [ ("", windows . W.view) -- was W.greedyView
                                      , ("S-", windows . W.shift)]
    ]
