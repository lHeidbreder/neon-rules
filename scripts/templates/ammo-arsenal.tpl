\providecommand{\lastcaliber}{ }%
\ifthenelse{\NOT \equal{\lastcaliber}{@caliber@}}{%
    \ifintable%
        \end{longtable}%
    \fi%
    \subsection{@caliber@}%
    \index{@caliber@}%
    \rowcolors{2}{gray!40}{gray!25}
    \begin{longtable}{>{\raggedright\arraybackslash}p{72pt}>{\raggedright\arraybackslash}p{200pt}|R{34pt}R{22pt}R{22pt}}%
        Type & Effect & Price & Wgt & Box Size \\%
        \hline%
    \global\intabletrue%
}{}%
@type@ & \begin{itemize}\vspace{-5mm}@effect@\end{itemize} & cR @price@ & @weight@ & @unitofsale@ \\%
\renewcommand{\lastcaliber}{@caliber@}%
