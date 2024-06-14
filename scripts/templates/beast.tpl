\subsubsection*{@name@}
\ifthenelse{\isempty{@difficulty_social@ @difficulty_combat@}}{}{\textbf{Difficulty}: }
\ifthenelse{\isempty{@difficulty_social@}}{}{Social @difficulty_social@ / }
\ifthenelse{\isempty{@difficulty_combat@}}{}{Combat @difficulty_combat@}
\par
\textit{@flavor_text@}
\par
\begin{tabular}{|l|l|l|l|l|l|l|l|r|r|}
    \hline
    Cr & Int & Ins & Ch & Dex & Ag & Con & Str & Melee & Range \\ \hline
    @cr@ & @int@ & @ins@ & @ch@ & @dex@ & @ag@ & @con@ & @str@ & @melee@ & @range@ \\ \hline
\end{tabular}\par
\textbf{Anatomy}: @size@ @hit_locations@ \\
\textbf{HP scale}: @hp@ \\
\begin{multicols}{2}
\ifthenelse{\isempty{@itemize:skills@}}{}{ \textbf{Skills:}
    \begin{sitemize}[8]
    @itemize:skills@
    \end{sitemize} 
    \columnbreak
    }
\ifthenelse{\isempty{@itemize:traits@}}{}{ \textbf{Tags:}
    \begin{sitemize}[8]
    @itemize:traits@
    \end{sitemize}
    } 
\ifthenelse{\isempty{@itemize:skills@}}{\columnbreak}{} %heuristically break the column after traits if there were no skills
\ifthenelse{\isempty{@armor@@itemize:weapons@@itemize:other_equipment@}}{}{\textbf{Equipment} \begin{itemize} \setlength\itemsep{-9mm} \vspace{-9mm}}%
\ifthenelse{\isempty{@armor@}}{}{\item\textbf{Armor}: @armor@}
\ifthenelse{\isempty{@itemize:weapons@}}{}{\item\textbf{Weapons}: \begin{itemize}\vspace{-10mm}\setlength\itemsep{-10mm} @itemize:weapons@ \end{itemize}}
\ifthenelse{\isempty{@itemize:other_equipment@}}{}{\item\textbf{Other}: @itemize:other_equipment@}
\ifthenelse{\isempty{@armor@@itemize:weapons@@itemize:other_equipment@}}{}{\end{itemize}}
\end{multicols}
\def\currentfillerimagepath{../art/\subtitle/@picture_path@}
\IfFileExists
    {\currentfillerimagepath}
    {\begin{center}\filltopageendgraphics{\currentfillerimagepath}\end{center}\pagebreak} %fill the rest of the page with the image
    {} %if there was no filler image, do nothing
\pagebreak
