\vspace{2mm}
	\begin{minipage}{\columnwidth}
		\textbf{\ul{@name@}}\\
		\textit{@flavor_text@}\\
		\textbf{Weight}: @weight@ kg\\
		\textbf{Price}: cr @price@\\
		\textbf{Shots}: @shots@\\
        \textbf{Damage}: @damage@\\
        \textbf{AP}: @ap@\\
		\textbf{Mag}: @mag@\\
        \textbf{Ammo}: @ammo@\\
		\textbf{Reload}: \mbox{@reload@ actions}\\
		\textbf{Range}: @range@m\\
		\ifthenelse{\isempty{@special_rules@}}{}{\textbf{Special Rules}: @special_rules@}
	\end{minipage}
	\par