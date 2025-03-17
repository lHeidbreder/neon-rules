\ifthenelse{
	\NOT \equal{\lastcategory}{@type@}
}{
	\end{multicols}
	\subsection{@type@}
	\vspace{5mm}
	\begin{multicols}{2}
}{}
	\refstepcounter{tmpcntr}
	\makelabelfromkey[implant]{@name@}
	\needspace{20mm}
	\begin{flavorblock}[@name@]
        @flavor_text@
    \end{flavorblock}
	\vspace{-5mm}
	\textit{Effect}: @effect@\\
	\textit{Price:} cR @cost@; \textit{Load:} @load@\ifthenelse{\isequivalentto{-}{@slot@}}{}{; \textit{Slot:} @slot@}\\
	\textit{Available Mods:} @mods@
\renewcommand{\lastcategory}{@type@}
\par
