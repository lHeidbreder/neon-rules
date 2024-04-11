\begin{minipage}{\columnwidth}
\subsubsection*{
    \ifthenelse{@number@ > 0}
        {\uppercase\expandafter{\romannumeral@number@\relax}}
        {0}
    - @arcanum@
    }
\begin{multicols}{2}
\IfFileExists
    {../art/\subtitle/arcana/@arcanum@.jpg}
    {\includegraphics[totalheight=4\baselineskip]{../art/\subtitle/arcana/@arcanum@.jpg}}
    {Upright}
\\
\textbf{@upright_meaning@}
\par
@upright@
\par
\columnbreak
\IfFileExists
    {../art/\subtitle/arcana/@arcanum@.jpg}
    {\includegraphics[totalheight=4\baselineskip, angle=180, origin=c]{../art/\subtitle/arcana/@arcanum@.jpg}}
    {Reversed}
\\
\textbf{@reversed_meaning@}
\par
@reversed@
\end{multicols}
\end{minipage}
\par
