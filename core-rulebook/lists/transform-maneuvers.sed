s/\\\\%/ /g
s/\s+/ /g
s/\\maneuver/\n/g
s/\{([^}]+)\}\{([^}]+)\}\{([^}]+)\}/"MVR: \1","\2","\3","Allows the use of the maneuver \emph{\1} at normal penalties."/gm

