\providecommand{\lastcaliber}{ }%
\ifthenelse{\NOT \equal{\lastcaliber}{@caliber@}}{%
    \ifintable%
        \end{tabular}%
    \fi%
    \subsection{@caliber@}%
    \index{@caliber@}%
    \begin{tabular}{@{}lp{0.5\textwidth}rrr}%
        Type & Effect & Price & Weight & Box Size \\%
        \hline%
    \global\intabletrue%
}{}%
@type@ & @effect@ & cR @price@ & @weight@ & @unitofsale@ \\%
\renewcommand{\lastcaliber}{@caliber@}%
