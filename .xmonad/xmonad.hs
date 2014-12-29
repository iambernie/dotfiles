import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders(smartBorders)
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Grid

import qualified XMonad.StackSet as W

import System.IO
--
----------------------- Colors ----------------------
magenta = "#FF14E5"
blue1   = "#29acff"
green1  = "#60ff45"
white1  = "#FFFFFF"
gray1   = "#3D3D3D"
gray2   = "#808080"
gray3   = "#CCCCCC"
yellow1 = "#FFF500"
yellow2 = "#ffff66"


myManageHook :: ManageHook
myManageHook = composeAll [ (role =? "gimp-toolbox" <||> role =? "gimp-image-window") -->(unfloat)
                           , className =? "MPlayer" --> (unfloat) ]
                   where unfloat = ask >>= doF . W.sink
                         role = stringProperty "WM_WINDOW_ROLE"

myLayoutHook = smartSpacing 5 $ avoidStruts  $ layoutHook defaultConfig

myKeys = [
           ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
         , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
         , ((0, xK_Print), spawn "scrot")
         ]

myLogHook h = dynamicLogWithPP xmobarPP {   ppOutput = hPutStrLn h
                                            , ppTitle = xmobarColor blue1 "" . shorten 70
                                            , ppCurrent = xmobarColor blue1 ""
                                            , ppVisible = xmobarColor white1 ""
                                          --  , ppHiddenNoWindows = xmobarColor magenta ""
                                            , ppLayout = xmobarColor gray2 ""
                                          }

myStartupHook :: X ()
myStartupHook = do
    spawn xmobarBottom

bin_xmobar = "/home/bernie/.cabal/bin/xmobar"
rc_xmobarTop = "/home/bernie/.xmobarrc.hs"
rc_xmobarBottom = "/home/bernie/xmobarrc_bottom.hs"

xmobarTop = bin_xmobar ++ " " ++ rc_xmobarTop
xmobarBottom = bin_xmobar ++ " " ++ rc_xmobarBottom


main = do
    xmproc <- spawnPipe xmobarTop
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook = myLayoutHook
        , logHook = myLogHook xmproc
        , startupHook = myStartupHook
        , modMask = mod4Mask
        , terminal = "urxvt"
        , borderWidth = 1
        , normalBorderColor = gray1
        , focusedBorderColor = blue1
        , workspaces = ["sh1","sh2","sh3","gimp4","pdf5","com6","mpc7","web8","web9"]
        } `additionalKeys` myKeys


