\subsection*{@name@}
\label{location:@key@}
\ifthenelse
    {\isempty{@short_desc@}}
    {}
    {
    \paragraph{@short_desc@\\}
    }
\ifthenelse
    {\isempty{@long_desc@}}
    {}
    {
    @long_desc@
    }
\IfFileExists
    {../art/\subtitle/@key@.png}
    {
    \begin{figure*}
	\centering
	\includegraphics{../art/\subtitle/@key@.png}
	\caption{@name@}
	\label{fig:@key@}
    \end{figure*}
    }
    {}
