\vspace{2mm}
	\begin{minipage}{\columnwidth}
		\textbf{\ul{@name@}}\\
		\begin{flavorblock}
			@flavor_text@
		\end{flavorblock}
		\ifthenelse{\isempty{@weight@}}{}{\textbf{Weight}: @weight@ kg\\}
		\ifthenelse{\isempty{@availability@}}
			{\directlua{tex.print("\\edef\\availval{"..6-tierfromcost("@price@").."}")}}
			{\def\availval{@availability@}}
		\ifthenelse{
			\isempty{\availval} \OR \equal{\availval}{0}
			}
			{}
			{\textbf{Availability}: \availval \\}
		\ifthenelse{\isempty{@price@}}{}{\textbf{Price}: cR @price@\\}
		\ifthenelse{\isempty{@shots@}}{}{\textbf{Shots}: @shots@\\}
        \textbf{Damage}: \ifthenelse{\isempty{@damage@}}{0}{@damage@}\\
        \ifthenelse{\isempty{@ap@} \OR \equal{@ap@}{0}}{}{\textbf{AP}: @ap@\\}
		\ifthenelse{\isempty{@mag@}}{}{\textbf{Mag}: @mag@\\}
        \ifthenelse{\isempty{@ammo@}}{}{\textbf{Ammo}: @ammo@\\}
    \ifthenelse{\equal{@reload@}{1}}{\def\acident{action}}{\def\acident{actions}}
		\ifthenelse{\isempty{@reload@}}{}{\textbf{Reload}: \mbox{@reload@ \acident}\\}
		\ifthenelse{\isempty{@range@}}{}{\textbf{Range}: @range@m\\}
		\ifthenelse{\isempty{@special_rules@}}{}{\textbf{Special Rules}: @special_rules@}
	\end{minipage}
	\par
