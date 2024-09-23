\begin{minipage}{\columnwidth}
    \subsection*{@name@}
    \textit{@description@}
    \\%
    Cost: cR @cost@
        \ifthenelse{\equal{-}{@load@}}{}{; Load: @load@}
	\\%
	Lasts for \textit{@duration@}
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
		\par%
		\vspace{5mm}
		\hrule
		\vspace{5mm}%
        \paragraph{Overdose}
		@overdose_effect@
	}
\end{minipage}
\par

