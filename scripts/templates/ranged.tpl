\vspace{2mm}
	\begin{minipage}{\columnwidth}
		\textbf{\ul{@name@}}\\
		\textit{@flavor_text@}\\
		\ifthenelse{\isempty{@weight@}}{}{\textbf{Weight}: @weight@ kg\\}
		\ifthenelse{\isempty{@price@}}{}{\textbf{Price}: cR @price@\\}
		\ifthenelse{\isempty{@shots@}}{}{\textbf{Shots}: @shots@\\}
        \textbf{Damage}: \ifthenelse{\isempty{@damage@}}{0}{@damage@}\\
        \textbf{AP}: \ifthenelse{\isempty{@ap@}}{0}{@ap@}\\
		\ifthenelse{\isempty{@mag@}}{}{\textbf{Mag}: @mag@\\}
        \ifthenelse{\isempty{@ammo@}}{}{\textbf{Ammo}: @ammo@\\}
		\ifthenelse{\isempty{@reload@}}{}{\textbf{Reload}: \mbox{@reload@ actions}\\}
		\ifthenelse{\isempty{@range@}}{}{\textbf{Range}: @range@m\\}
		\ifthenelse{\isempty{@special_rules@}}{}{\textbf{Special Rules}: @special_rules@}
	\end{minipage}
	\par
