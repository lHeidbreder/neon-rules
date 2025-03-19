\needspace{20mm}
\begin{mdframed}[
	style=objectframe,
	needspace=40mm,
	frametitlefont=\parhead\bfseries,
	frametitle=@name@,
]
	\begin{multicols}{2}
		Cost: cR @cost@ \\
		\ifthenelse{\isempty{@load@}}{}{Load: @load@ \\}
		\ifthenelse{\isempty{@availability@}}{}{\textit{Availability: @availability@}\\}
		\ifthenelse{\equal{immediate}{@duration@}}{
			\textit{Immediate effect}
		}{
			Lasts for \textit{@duration@}
		}
		\columnbreak
		\begin{flavorblock}
			@description@
		\end{flavorblock}
	\end{multicols}
	\par%
	\begin{multicols}{2}
		\paragraph{Effect}
		@effect@
        \ifthenelse{\isempty{@detriment@}}
            {}
            {
                \columnbreak
		        \paragraph{Detriment}
                @detriment@
            }
	\end{multicols}
	\ifthenelse{\isempty{@overdose_effect@}}
	{}
	{
		\vspace{-8mm}
        \paragraph{Overdose}
		@overdose_effect@
	}
\par
\end{mdframed}
\par
