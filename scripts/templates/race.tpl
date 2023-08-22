\paragraph*{@name@ \ifthenelse{\isempty{@variant@}}{}{/ @variant@} (@cost@ GP)}
\textit{@flavor_text@}\par
%\ifthenelse{\isempty{@cr@@int@@ins@@ch@@dex@@ag@@con@@str@}}{}{
\begin{tabular}{|l|l|l|l|l|l|l|l|}
    \hline
    Cr & Int & Ins & Ch & Dex & Ag & Con & Str \\ \hline
    @cr@ & @int@ & @ins@ & @ch@ & @dex@ & @ag@ & @con@ & @str@ \\ \hline
\end{tabular}\par
%}
\ifthenelse{\isempty{@itemize:other_modifiers@}}{}{\vspace{-8mm} \noindent\textbf{Other modifiers:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:other_modifiers@
    \end{itemize} }
\vspace{4mm}
\begin{multicols}{2}
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
\ifthenelse{\isempty{@itemize:traits@}}{}{ \textbf{Traits:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:traits@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:usual_backgrounds@}}{}{ \textbf{Usual Backgrounds:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:usual_backgrounds@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:disallowed_backgrounds@}}{}{ \textbf{Disallowed Backgrounds:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:disallowed_backgrounds@
    \end{itemize} }
\end{multicols}
%TODO: a picture has to go here, if it exists
\IfFileExists
    {@picture_path@}
    {\filltopageendgraphics{@picture_path@}} %fill the rest of the page with the image
    {\pagebreak} %break page if there was no filler image
%\pagebreak
