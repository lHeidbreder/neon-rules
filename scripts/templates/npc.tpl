\subsection{@name@}
\label{char:@label@}
\paragraph{Role:}
@role@%
\vspace{-5mm}
\paragraph{Appearance:}
@appearance@%
\ifthenelse{\isempty{@description@}}{}{\par \vspace{-6mm}}
@description@
\ifthenelse{\isempty{@stats@}}{}{
    \vspace{0mm} %somehow this actually does something?
    \hrule
    \vspace{-6mm}
    @stats@
}
