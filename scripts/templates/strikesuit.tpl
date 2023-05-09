\subsection{@series@ \ifthenelse{\isempty{@variant@}}{}{- @variant@}}
\textit{@flavor_text@}\par
\begin{tabular}{|l|l|l|l|}
    \hline
    Head & Body & Arms & Legs\\
    \hline
    @head_armor@ & @body_armor@ & @arm_armor@ & @leg_armor@\\
    \hline
\end{tabular}
\par
Movement Speed: @movement_speed@\\
Strength / Agility: @stat_bonus@\\
Mods: @mod_slots@\\
Weight: @weight@kg\\
Further Modifiers:
\vspace{-8mm}
\begin{itemize}
    \setlength\itemsep{-8mm}
    @itemize:further_modifiers@
\end{itemize}
\par