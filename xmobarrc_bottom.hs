Config { font = "xft:Inconsolata:pixelsize=16:antialias=true"
       , bgColor = "black"
       , fgColor = "#29acff"
       , position = Bottom
       , lowerOnStart = False
       , pickBroadest = False
       , persistent = True
       , hideOnStart = False
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run Cpu ["-L","0","-H","50","--normal","green"] 10
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run MarqueePipeReader "No IRC activity:/home/bernie/pijp" (40, 5, "+") "mpipe"
                    , Run PipeReader "pipereader:/home/bernie/pipereader" "pipe"
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %pipe% }{ IRC: %mpipe% "
       }

