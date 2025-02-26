\subsection*{@name@}
\refstepcounter{mutations}
\label{mut:@name@}
\IfFileExists{../art/\subtitle/mutations/@imgpath@}
    {\tryincludewithfade[width=\columnwidth]{../art/\subtitle/mutations/@imgpath@}}
    {}
\ifthenelse{\NOT \isempty{@flavor_text@}}{
    \begin{flavorblock}
        @flavor_text@
    \end{flavorblock}
}{}
@description@
\par
