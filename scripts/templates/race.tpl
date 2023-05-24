\paragraph*{@name@ \ifthenelse{\isempty{@variant@}}{}{/ @variant@} (@cost@ GP)}
\textit{@flavor_text@}\par
\begin{tabular}{|l|l|l|l|l|l|l|l|}
    \hline
    Cr & Int & Ins & Ch & Dex & Ag & Con & Str \\ \hline
    @cr@ & @int@ & @ins@ & @ch@ & @dex@ & @ag@ & @con@ & @str@ \\ \hline
\end{tabular}\par
\ifthenelse{\isempty{@itemize:other_modifiers@}}{}{ \noindent\textbf{Other modifiers:}
    \begin{itemize}
    \setlength\itemsep{-8mm} \vspace{-8mm}
    @itemize:other_modifiers@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:skills@}}{}{ \textbf{Skills:}
    \begin{itemize}
    \setlength\itemsep{-8mm} \vspace{-8mm}
    @itemize:skills@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:abilities@}}{}{ \textbf{Abilities:}
    \begin{itemize}
    \setlength\itemsep{-8mm} \vspace{-8mm}
    @itemize:abilities@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:boons@}}{}{ \textbf{Boons:}
    \begin{itemize}
    \setlength\itemsep{-8mm} \vspace{-8mm}
    @itemize:boons@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:banes@}}{}{ \textbf{Banes:}
    \begin{itemize}
    \setlength\itemsep{-8mm} \vspace{-8mm}
    @itemize:banes@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:traits@}}{}{ \textbf{Traits:}
    \begin{itemize}
    \setlength\itemsep{-8mm} \vspace{-8mm}
    @itemize:traits@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:usual_backgrounds@}}{}{ \textbf{Usual Backgrounds:}
    \begin{itemize}
    \setlength\itemsep{-8mm} \vspace{-8mm}
    @itemize:usual_backgrounds@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:disallowed_backgrounds@}}{}{ \textbf{Disallowed Backgrounds:}
    \begin{itemize}
    \setlength\itemsep{-8mm} \vspace{-8mm}
    @itemize:disallowed_backgrounds@
    \end{itemize} }
\hrulefill
