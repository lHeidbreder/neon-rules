\ifthenelse{
	\NOT \equal{\lastcategory}{@type@}
	\AND \NOT \isempty{@type@}
}{
	\end{multicols}
	\needspace{50mm}
	\subsection{@type@}
	\label{implants-@type@}
	\vspace{5mm}
	\begin{multicols}{2}
}{}
	\refstepcounter{tmpcntr}
	\makelabelfromkey[implant]{@name@}
	\needspace{20mm}
	\begin{flavorblock}[@name@]
        @flavor_text@
    \end{flavorblock}
	\textit{Effect}: @effect@\\
	\textit{Price:} cR @cost@;
	\ifthenelse{\NOT \isempty{@load@}}{\textit{Load:} @load@}{}
	\ifthenelse{\NOT \isempty{@slot@}}{; \textit{Slot:} @slot@}{}
	\\%
	\ifthenelse{\NOT \isempty{@mods@}}{\textit{Available Mods:} @mods@}{}
\renewcommand{\lastcategory}{@type@}
\par
