\renewcommand{\loadeddoc}{false}
\IfFileExists{../_rulepackage/@package_path@/@book@.aux}{
	\externaldocument[@prefix@-]{../_rulepackage/@package_path@/@book@}
	\wlog{Loading <../\_rulepackage/@package_path@/@book@>}
	\renewcommand{\loadeddoc}{true}
}{}
\ifthenelse{
	\equal{\loadeddoc}{false}
}{
	\IfFileExists{../@path@/@book@.aux}{
		\externaldocument[@prefix@-]{../@path@/@book@}
		\wlog{Loading <../@path@/@book@>}
	}{}
}{}
