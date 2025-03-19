\begin{mdframed}[
	style=objectframe,
	frametitle=@name@,
	innertopmargin=2mm,
]
	%\textbf{\ul{@name@}} 
	(covers: @covers@)\\
	\begin{tabular}{|r|r|r|r|}
		\hline
		Head & Chest & Arms & Legs\\
		\hline
		@head@ & @chest@ & @arms@ & @legs@\\
		\hline
	\end{tabular}
	\\%
	\begin{tabular}{ll}
		\textit{Price:} & cR @price@ \\
		\textit{Weight:} & @weight@ kg \\
		\textit{Mod Slots:} & @mods@ \\
	\end{tabular}
	\ifthenelse{
		\NOT \isempty{@itemize:effect@}
	}{
		\begin{sitemize}
			@itemize:effect@
		\end{sitemize}
	}{}
\end{mdframed}
