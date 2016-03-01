import Data.Monoid
import System.Exit
import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Layout.PerWorkspace
import XMonad.Config.Azerty
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Prompt
import XMonad.Prompt.Shell
import qualified Data.Map as M
import qualified XMonad.StackSet as W

myTerminal = "urxvtc"
myModMask = mod4Mask

myWorkspaces = with_greek ["Trivia","Web","Mail","Chat"]
    where with_greek li = li ++ take (9 - length li) alphabeta
              where alphabeta =
                        ["α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι"]

myNormalBorderColor  = "#7c7c7c"
myFocusedBorderColor = "#93a1a1"

shconf = defaultXPConfig {
           borderColor = "#333333",
           bgColor     = "#ffffff",
           bgHLight    = "#aaaaaa",
           fgColor     = "#333333"
}

myKeys conf@(XConfig {XMonad.modMask = modm}) =
    M.fromList $ [
          ((modm,               xK_Return   ), spawn $ XMonad.terminal conf),
          ((modm,               xK_p        ), shellPrompt shconf),
          ((modm .|. shiftMask, xK_c        ), kill),
          ((modm,               xK_space    ), sendMessage NextLayout),
          ((modm .|. shiftMask, xK_space    ), setLayout $ XMonad.layoutHook conf),
          ((modm,               xK_n        ), refresh),
          ((modm,               xK_Tab      ), windows W.focusDown),
          ((modm,               xK_j        ), windows W.focusDown),
          ((modm,               xK_k        ), windows W.focusUp),
          ((modm,               xK_m        ), windows W.focusMaster),
          ((modm .|. shiftMask, xK_Return   ), windows W.swapMaster),
          ((modm .|. shiftMask, xK_j        ), windows W.swapDown),
          ((modm .|. shiftMask, xK_k        ), windows W.swapUp),
          ((modm,               xK_h        ), sendMessage Shrink),
          ((modm,               xK_l        ), sendMessage Expand),
          ((modm,               xK_t        ), withFocused $ windows . W.sink),
          ((modm              , xK_comma    ), sendMessage $ IncMasterN 1),
          ((modm              , xK_semicolon), sendMessage $ IncMasterN (-1)),
          ((modm .|. shiftMask, xK_q        ), io (exitWith ExitSuccess)),
          ((modm              , xK_q        ), spawn "xmonad --recompile; xmonad --restart"),
          ((modm              , xK_Right    ), spawn "mpc next"),
          ((modm              , xK_Left     ), spawn "mpc prev"),
          ((modm              , xK_Up       ), spawn "mpc play"),
          ((modm              , xK_Down     ), spawn "mpc pause"),
          ((modm .|. shiftMask, xK_l        ), spawn "slock")
         ]
         ++
         [((m .|. modm, k), windows $ f i) |
          (i, k) <- zip (XMonad.workspaces conf) [0x26,0xe9,0x22,0x27,0x28,0x2d,0xe8,0x5f,0xe7,0xe0],
          (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myMouseBindings (XConfig {XMonad.modMask = modm}) =
    M.fromList $ [
          ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                   >> windows W.shiftMaster)),
          ((modm, button2), (\w -> focus w >> windows W.shiftMaster)),
          ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                   >> windows W.shiftMaster))
         ]

myLayout = onWorkspace "Chat" (Mirror tiled ||| tiled ||| noBorders Full) $
           tiled ||| Mirror tiled ||| noBorders Full
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1 / 2
    delta   = 3 / 100


myManageHook = composeAll $
               [className =? c --> doFloat | c <- myFloats]
               ++
               [
                className =? "Firefox"     --> doF (W.shift "Web"),
                className =? "Thunderbird" --> doF (W.shift "Mail"),
                className =? "Skype"       --> doF (W.shift "Chat")
               ]
    where myFloats = ["Skype", "Gimp"]


main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig

myConfig = azertyConfig {
        terminal           = "urxvtc",
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
        layoutHook         = myLayout,
        manageHook         = myManageHook
           }

myPP = xmobarPP {
--       ppHidden  = xmobarColor "#444444" "",
         ppCurrent = xmobarColor "#93a1a1" "",
         ppTitle   = xmobarColor "#93a1a1" "",
         ppLayout  = xmobarColor "#657b83" ""
       }

toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)
