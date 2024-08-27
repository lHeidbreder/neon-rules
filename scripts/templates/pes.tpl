\begin{minipage}{\columnwidth}
\textbf{\ul{@name@}}\\
Armor: @armor@; Threshold: @threshold@\\
\textit{Price:} cR @price@; \textit{Weight:} @weight@ kg
\ifthenelse{\isempty{@special@}}{}{\\} %conditional line break
@special@
\end{minipage}
\par

