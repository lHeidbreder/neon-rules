\begin{minipage}{0.9\columnwidth}
	\ifthenelse{\equal{\lastcategory}{@category@}}{}{
		\subsection*{@category@}%
	}%
	\item @question@\\
	\textit{@example@}
\end{minipage}
\par
\renewcommand{\lastcategory}{@category@}%
