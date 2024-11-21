\section*{@name@}
\ifthenelse{\isempty{@logo_path@}}
    {\def\tmplogopath{../art/supplements/logos/@name@}}
    {\def\tmplogopath{@logo_path@}}
\IfFileExists{\tmplogopath}{
    \begin{multicols}{2}    
    @description@
    \columnbreak
    \includegraphics[width=\columnwidth]{\tmplogopath}
    \end{multicols}
}{
    @description@
}
\paragraph{Activities}
@activities@
\paragraph{Goals}
@goals@
\paragraph{Structure}
@structure@
\paragraph{Influence Tactics}
@tactics@

