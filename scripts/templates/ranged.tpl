\vspace{2mm}
	\begin{minipage}{\columnwidth}
		\textbf{\ul{@name@}}\\
		\textit{@flavor_text@}\\
		\ifthenelse{\isempty{@weight@}}{}{\textbf{Weight}: @weight@ kg\\}
		\ifthenelse{
			\isempty{@price@} \OR \equal{\directlua{tex.print(6-tierfromcost("@price@"))}}{0}
			}
			{}
			{\textbf{Availability}: \directlua{tex.print(6-tierfromcost("@price@"))}\\}
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
