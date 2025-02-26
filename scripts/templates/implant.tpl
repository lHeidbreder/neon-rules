	\refstepcounter{tmpcntr}
	\makelabelfromkey[implant]{@name@}
	\textbf{@name@}
	\begin{flavorblock}
        @flavor_text@
    \end{flavorblock}
	\textit{Effect}: @effect@\\
	\textit{Price:} cR @cost@; \textit{Load:} @load@\ifthenelse{\isequivalentto{-}{@slot@}}{}{; \textit{Slot:} @slot@}\\
	\textit{Available Mods:} @mods@
\par
