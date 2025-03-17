\needspace{20mm}
\begin{mdframed}[
	style=objectframe,
	frametitle=@name@,
]
	\begin{multicols}{2}
		Cost: cR @cost@ \\
		\ifthenelse{\equal{-}{@load@}}{}{Load: @load@ \\}
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
        \ifthenelse{\equal{-}{@detriment@}}
            {}
            {
                \columnbreak
		        \paragraph{Detriment}
                @detriment@
            }
	\end{multicols}
	\ifthenelse{\equal{-}{@overdose_effect@}}
	{}
	{
		\vspace{-8mm}
        \paragraph{Overdose}
		@overdose_effect@
	}
\par
\end{mdframed}
\par
