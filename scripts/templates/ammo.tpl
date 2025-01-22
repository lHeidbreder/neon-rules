\ifthenelse{\equal{\lastcaliber}{@caliber@}}{}{
    \end{multicols}
    \par
}
\ifthenelse{\equal{\lastcaliber}{@caliber@}}{}{
    \subsubsection{@caliber@}
    \vspace{8mm}
    \begin{multicols}{2}
}
\begin{minipage}{\columnwidth}
    \textbf{\ul{@type@:}} @effect@\\
    \textbf{Price}: cR @price@; \textbf{Unit of sale}: @unitofsale@\\
    \textbf{Weight/Bulk}: @weight@
    \ifthenelse{\isempty{@per@}}{each}{per @per@}
\end{minipage}
\par
\renewcommand{\lastcaliber}{@caliber@}
