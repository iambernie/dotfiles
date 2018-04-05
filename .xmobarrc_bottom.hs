Config { font = "xft:Inconsolata:pixelsize=14:antialias=true"
       , bgColor = "black"
       , fgColor = "#29acff"
       , position = Bottom
       , lowerOnStart = False
       , pickBroadest = False
       , persistent = True
       , hideOnStart = False
       , allDesktops = True
       , overrideRedirect = False
       , commands = [ Run MarqueePipeReader "No IRQ activity:/home/bernie/pipes/mpipereader" (40, 5, "+") "mpipe"
                    , Run PipeReader "pipereader:/home/bernie/pipes/pipereader" "pipe"
                    , Run Com "/home/bernie/menuscripts/wireless.sh" [] "wifi" 20
                    , Run Com "/home/bernie/menuscripts/volume.py" [] "volume" 10
                    , Run Com "/home/bernie/menuscripts/battery.sh" [] "bat" 20

                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %pipe% }{ %bat%  %volume%  %wifi%   IRC: %mpipe% "
       }

