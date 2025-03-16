\begin{samepage}
\subsection*{@name@ \ifthenelse{\isempty{@variant@}}{}{/ @variant@} (@cost@ GP)}
\stepcounter{tmpcntr}
\phantomsection
\makelabelfromkey[race]{@name@@variant@}
\par%
\def\currentfillerimagepath{../art/\subtitle/races/@picture_path@}
\IfFileExists
    {\currentfillerimagepath}
    {
        \vspace{5mm}
        \begin{multicols}{2}
            \includegraphics[width=\columnwidth]{\currentfillerimagepath}
            \columnbreak
            \begin{flavorblock}
                @flavor_text@
            \end{flavorblock}
        \end{multicols}
    }{
        \begin{flavorblock}
            @flavor_text@
        \end{flavorblock}
    }
\end{samepage}
\par
\begin{tabular}{|l|l|l|l|l|l|l|l|}
    \hline
    Cr & Int & Ins & Ch & Dex & Ag & Con & Str \\ \hline
    @cr@ & @int@ & @ins@ & @ch@ & @dex@ & @ag@ & @con@ & @str@ \\ \hline
\end{tabular}\par
\ifthenelse{\isempty{@itemize:other_modifiers@}}{}{\vspace{-8mm} \noindent\textbf{Other modifiers:}
    \begin{itemize}
    \setlength\itemsep{-10mm} \vspace{-8mm}
    @itemize:other_modifiers@
    \end{itemize} }
\ifthenelse{\isempty{@itemize:skills@@itemize:abilities@@itemize:boons@@itemize:banes@@itemize:traits@@itemize:usual_backgrounds@@itemize:disallowed_backgrounds@}}{}{}
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
\ifthenelse{\isempty{@itemize:usual_backgrounds@@itemize:disallowed_backgrounds@}}{\columnbreak}{}
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
\ifthenelse{\isempty{@itemize:usual_backgrounds@@itemize:disallowed_backgrounds@}}{}{\columnbreak}
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
\par
\conditionalhrule
