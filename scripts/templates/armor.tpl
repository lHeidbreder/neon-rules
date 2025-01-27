\begin{minipage}{\columnwidth}
	\textbf{\ul{@name@}} (covers: @covers@)\\
	\begin{tabular}{|r|r|r|r|}
		\hline
		Head & Chest & Arms & Legs\\
		\hline
		@head@ & @chest@ & @arms@ & @legs@\\
		\hline
	\end{tabular}\par
	\vspace{2mm}
	\textit{Price:} cR @price@; \textit{Weight:} @weight@ kg\\
    \textit{@mods@ mod slot\ifthenelse{\equal{@mods@}{1}}{}{s}}\\%
	@effect@
\end{minipage}
\par
