\begin{minipage}{\columnwidth}
\subsection*{@series@ \ifthenelse{\isempty{@variant@}}{}{- @variant@}}
\textit{@flavor_text@}\par
\vspace{2mm}
\begin{tabular}{|l|l|l|l|}
    \hline
    Head & Body & Arms & Legs\\
    \hline
    @head_armor@ & @body_armor@ & @arm_armor@ & @leg_armor@\\
    \hline
\end{tabular}
\par
\vspace{2mm}
\ifthenelse{\equal{0}{@movement_speed@}}
    {}
    {Movement Speed Bonus: @movement_speed@\\}
Strength / Agility: @stat_bonus@\\
Mods: @mod_slots@\\
Weight: @weight@kg\\
%cannot cascade ifthenelse
\ifthenelse{\isempty{@variant@}}
    {\def\seriesmodpreamble{}}
    {\def\seriesmodpreamble{\item \emph{@series@-series modifiers}}}
\ifthenelse{\isempty{@itemize:further_modifiers@}}
{}
{Further Modifiers:
\begin{itemize}
    \seriesmodpreamble
    @itemize:further_modifiers@
\end{itemize}}
\end{minipage}
\par
\columnbreak
