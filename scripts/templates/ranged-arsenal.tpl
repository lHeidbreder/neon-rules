%%PREAMBLE
\def\imagedoesexist{FALSE}
\providecommand{\imageanchor}{LEFT}
\providecommand{\lastgroup}{ } %provide here to be selfcontained

%% Enter next group
\ifthenelse{\NOT \equal{\lastgroup}{@group@}}{
    \needspace{30mm}
    \subsection{@group@}
    \renewcommand{\lastgroup}{@group@}
}{}

\begin{tcolorbox}[
    title=@name@,
]
\index{@name@}
%% Image and flavor text
\def\currentfillerimagepath{../art/\subtitle/ranged/@picture_path@}
%begin of multicols
\IfFileExists{\currentfillerimagepath}{
    \def\imagedoesexist{TRUE}
    \begin{multicols}{2}
}{}
    \ifthenelse{\equal{\imageanchor}{LEFT} \AND \equal{\imagedoesexist}{TRUE}}{
        \includegraphics[width=\columnwidth]{\currentfillerimagepath}
        \columnbreak
    }{}
    
    \begin{flavorblock}
        @flavor_text@
    \end{flavorblock}

    \ifthenelse{\equal{\imageanchor}{RIGHT} \AND \equal{\imagedoesexist}{TRUE}}{
        \columnbreak
        \includegraphics[width=\columnwidth]{\currentfillerimagepath}
    }{}
%end of multicols
\IfFileExists{\currentfillerimagepath}{\end{multicols}}{}

%data here
Type: \textbf{@group@}\ifthenelse{\NOT \isempty{@ammo@}}{, }{}\textbf{@ammo@}
\vspace{1mm}
\hrule

\begin{tabularx}{\columnwidth}{cccccc|ccc}
    Damage & Shots & AP & Range & Mag & Reload & Price & Weight & Availability \\%
    @damage@ & @shots@ & @ap@ & @range@m & @mag@ & @reload@ & cR @price@ & @weight@kg & @availability@ \\%
\end{tabularx}

\ifthenelse{\NOT \isempty{@special_rules@}}{
    \hrule
    \vspace{1mm}
    \begin{itemize}
        @special_rules@
    \end{itemize}
}{}

%end of data
\end{tcolorbox}

%% TOGGLE ANCHOR
\ifthenelse{
    \equal{\imageanchor}{LEFT}
}{
    \renewcommand{\imageanchor}{RIGHT}
}{
    \renewcommand{\imageanchor}{LEFT}
}
