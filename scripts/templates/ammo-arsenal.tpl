\providecommand{\lastcaliber}{ }%
\ifthenelse{\NOT \equal{\lastcaliber}{@caliber@}}{%
    \ifintable%
        \end{tabular}%
    \fi%
    \subsection{@caliber@}%
    \index{@caliber@}%
    \begin{tabular}{@{}>{\raggedright\arraybackslash}p{72pt}>{\raggedright\arraybackslash}p{200pt}|R{34pt}R{22pt}R{22pt}}%
        Type & Effect & Price & Wgt & Box Size \\%
        \hline%
    \global\intabletrue%
}{}%
@type@ & @effect@ & cR @price@ & @weight@ & @unitofsale@ \\%
\renewcommand{\lastcaliber}{@caliber@}%
