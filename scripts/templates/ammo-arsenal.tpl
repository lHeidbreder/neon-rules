\providecommand{\lastcaliber}{ }

\ifthenelse{\NOT \equal{\lastcaliber}{@caliber@}}{
    \subsection{@caliber@}
    \index{@caliber@}
    %TODO: description?
    \begin{tabularx}{\textwidth}{lXrrr}
        Type & Effect & Price & Weight & Box Size \\
        \hline
    \end{tabularx} %FIXME: end on condition
}{}

\begin{tabularx}{\textwidth}{lXrrr}
    @type@ & @effect@ & cR @price@ & @weight@ & @unitofsale@ \\
\end{tabularx}

\renewcommand{\lastcaliber}{@caliber@}
