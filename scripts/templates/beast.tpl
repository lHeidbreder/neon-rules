\subsubsection*{@name@}
\textit{@flavor_text@}\par
\begin{tabular}{|l|l|l|l|l|l|l|l|r|r|}
    \hline
    Cr & Int & Ins & Ch & Dex & Ag & Con & Str & Melee & Range \\ \hline
    @cr@ & @int@ & @ins@ & @ch@ & @dex@ & @ag@ & @con@ & @str@ & @melee@ & @ranged@ \\ \hline
\end{tabular}\par
\textbf{Anatomy}: @size@ @hit_locations@ \\
\textbf{HP scale}: @hp@ \\
\ifthenelse{\isempty{@itemize:skills@}}{}{ \textbf{Skills:}
    \begin{itemize}
    \setlength\itemsep{-8mm} \vspace{-8mm}
    @itemize:skills@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:traits@}}{}{ \textbf{Traits:}
    \begin{itemize}
    \setlength\itemsep{-8mm} \vspace{-8mm}
    @itemize:traits@
    \end{itemize} } 
\ifthenelse{\isempty{@armor@@weapons@@other_equipment@}}{}{\textbf{Equipment} \begin{itemize} \setlength\itemsep{-9mm} \vspace{-9mm}}%
\ifthenelse{\isempty{@armor@}}{}{\item\textbf{Armor}: @armor@}
\ifthenelse{\isempty{@weapons@}}{}{\item\textbf{Weapons}: @weapons@}
\ifthenelse{\isempty{@other_equipment@}}{}{\item\textbf{Other}: @other_equipment@}
\ifthenelse{\isempty{@armor@@weapons@@other_equipment@}}{}{\end{itemize}}
\par\hrulefill
