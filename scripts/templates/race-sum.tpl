%\ifthenelse{\NOT \equal{@name@}{\tmplastgroup}}{\hline}{}

\ifthenelse{\NOT \equal{@name@}{\tmplastgroup}}{@name@}{}%
    \ifthenelse{\isempty{@variant@}}{ & @cost@ & \directlua{tex.print("\\pageref{"..makekeyforlabel("race","@name@@variant@").."}")} \\}{}%
    \ifthenelse{\NOT \equal{@name@}{\tmplastgroup} \AND \NOT \isempty{@variant@}}{ & & \\}{}%
\ifthenelse{\NOT \isempty{@variant@}}{- @variant@ & @cost@ & \directlua{tex.print("\\pageref{"..makekeyforlabel("race","@name@@variant@").."}")} \\}{}%

\renewcommand{\tmplastgroup}{@name@}%
