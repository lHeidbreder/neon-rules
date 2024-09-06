\begin{minipage}{\columnwidth}
\textbf{\ul{@name@}}\\
Armor: @armor@
\\%
\textit{Price:} cR @price@; \textit{Weight:} @weight@ kg
\ifthenelse{\isempty{@special@}}{}{\\} %conditional line break
@special@
\end{minipage}
\par

