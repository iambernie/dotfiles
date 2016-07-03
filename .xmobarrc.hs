Config { font = "xft:Inconsolata:pixelsize=16:antialias=true"
       , bgColor = "black"
       , fgColor = "#808080"
       , position = Top
       , lowerOnStart = False
       , pickBroadest = False
       , persistent = True
       , hideOnStart = False
       , allDesktops = True
       , overrideRedirect = False
       , commands = [ Run Cpu ["-L","0","-H","50","--normal","green"] 10
                    , Run Memory ["-L","0","-H","50","--normal","green", "-t","MEM: <usedratio>%"] 5
                    , Run Network "eth0" ["-L","0","-H","60","--normal","green","--high","red"] 5
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %StdinReader% }{ %cpu%   %memory%  %eth0%   %date% "
       }

