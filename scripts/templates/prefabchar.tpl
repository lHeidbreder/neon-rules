\def\currentfillerimagepath{../art/prefabs/\pfcname.png}
\IfFileExists
    {\currentfillerimagepath}
    {\begin{center}\filltopageendgraphics{\currentfillerimagepath}\end{center}} %fill the rest of the page with the image
    {} %if there was no filler image, do nothing
\pagebreak
\begin{center}
\begin{tabular}{|l|l|l|l|l|l|l|l|}
    \hline
    Cr & Int & Ins & Ch & Dex & Ag & Con & Str \\ \hline
    @cr@ & @int@ & @ins@ & @ch@ & @dex@ & @ag@ & @con@ & @str@ \\ \hline
\end{tabular}
\\
\begin{tabular}{ll}
\textbf{Race} & @race@ \\
\textbf{Background} & @background@
\end{tabular}
\end{center}
\hrulefill
\par
\begin{multicols}{2}
\ifthenelse{\isempty{@itemize:boons@}}{}{ \textbf{Boons:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:boons@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:banes@}}{}{ \textbf{Banes:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:banes@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:skills@}}{}{ \textbf{Skills:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:skills@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:abilities@}}{}{ \textbf{Abilities:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:abilities@
    \end{itemize} }
%\ifthenelse{\isempty{@itemize:usual_backgrounds@@itemize:disallowed_backgrounds@}}{}{\columnbreak}
\ifthenelse{\isempty{@itemize:traits@}}{}{ \textbf{Traits:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:traits@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:equipment@}}{}{ \textbf{Equipment:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:equipment@
    \end{itemize} }
\end{multicols}
