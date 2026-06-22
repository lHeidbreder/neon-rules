\providecommand{\lastcaliber}{ }%
\ifthenelse{\NOT \equal{\lastcaliber}{@caliber@}}{%
    \ifintable%
        \end{tabular}%
    \fi%
    \subsection{@caliber@}%
    \index{@caliber@}%
    \begin{tabular}{@{}p{72pt}p{200pt}|R{38.5pt}R{34pt}R{22pt}}%
        Type & Effect & Price & Weight & Box Size \\%
        \hline%
    \global\intabletrue%
}{}%
@type@ & @effect@ & cR @price@ & @weight@ & @unitofsale@ \\%
\renewcommand{\lastcaliber}{@caliber@}%
