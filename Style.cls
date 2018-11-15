%% Data: 2013/10/08    Time: 19:43:11 - version 1.0.0
%%% نام  قالب را در این‌جا تعیین می‌کنیم. 
\ProvidesClass{Style}
%%% تمام پارامترهای ورودی برای تنظیم متن را به کلاس زیر ارسال می‌کنیم. در این‌جا ما سعی می‌کنیم استایل memoir را توسعه دهیم.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
%%% پارامترهای زیر تعیین کننده یکسری option برای قالب است. اولا تعیین می‌کنیم که قطع صفحات A4 است، یک رو می‌خواهیم چاپ شود و پایه فونت ۱۰ پوینت باشد. 
\LoadClass{report}

%%% OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
% FONT
%%%\usepackage[T1]{fontenc}
%%%\usepackage{accanthis}
%\usepackage[T1]{fontenc}
%\usepackage[default]{mintspirit}

%\usepackage{tgtermes}
%\usepackage[T1]{fontenc}

%\usepackage{multirow}
\usepackage{color, colortbl}
\usepackage{array}
\usepackage{hyperref}

\usepackage[a4paper]{geometry} 
\geometry{a4paper,tmargin=3.5cm, bmargin=2.5cm, lmargin=2cm, rmargin=2.5cm, headheight=3em, headsep=1.5cm, footskip=1cm}

\usepackage[utf8]{inputenc}
\usepackage[english]{babel}
%\usepackage{chngcntr}
\usepackage{amsthm,xparse} %for proof
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{listings}

\usepackage[table]{xcolor}
\usepackage{makecell}%To keep spacing of text in tables
\setcellgapes{4pt}%parameter for the spacing

\usepackage{tikz,ifthen}
\usetikzlibrary{arrows,shapes,trees,backgrounds,calc,through,decorations.pathreplacing,decorations.text}

\hypersetup{
	pdfmenubar=false, pdfstartview=FitH, 
	colorlinks=true,
	linkcolor={blue!50!black}, anchorcolor=green, citecolor=magenta, urlcolor=cyan, filecolor=magenta, pdftoolbar=true,bookmarkstype=toc
}
\theoremstyle{plain}
\newtheorem{noteaux}[subsection]{{\large Note}}
\let\oldnoteaux\noteaux
\renewcommand{\noteaux}{\oldnoteaux\normalfont}
\NewDocumentEnvironment{note}{o}
{\IfNoValueTF{#1}
	{\noteaux\addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection}}}
	{\noteaux{#1}\addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection} #1}}%
	\ignorespaces}
{\endnoteaux}


\newtheorem{remark}{Remark}[section]

\definecolor{darkgray}{RGB}{50,50,50}

%%%%%%%defineing table style%%%%%%%%
\newcolumntype{M}[1]{>{\arraybackslash}m{#1}}
\newcolumntype{N}{@{}m{0pt}@{}}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

\newcommand{\rowheight}{8pt}
\newcommand{\rowstyle}[1]{\gdef\currentrowstyle{#1}%
	#1\ignorespaces
}




\lstset{language=C++,
	basicstyle=\ttfamily,
	keywordstyle=\color{blue}\ttfamily,
	stringstyle=\color{green!50!black}\ttfamily,
	commentstyle=\color{red!50!black}\ttfamily,
	morecomment=[l][\color{magenta}]{\#}
}

\lstdefinelanguage{Golang}%
{morekeywords=[1]{package,import,func,type,struct,return,defer,panic,%
		recover,select,var,const,iota,},%
	morekeywords=[2]{string,uint,uint8,uint16,uint32,uint64,int,int8,int16,%
		int32,int64,bool,float32,float64,complex64,complex128,byte,rune,uintptr,%
		error,interface},%
	morekeywords=[3]{map,slice,make,new,nil,len,cap,copy,close,true,false,%
		delete,append,real,imag,complex,chan,},%
	morekeywords=[4]{for,break,continue,range,goto,switch,case,fallthrough,if,%
		else,default,go,},%
	morekeywords=[5]{Println,Printf,Error,},%
	sensitive=true,%
	morecomment=[l]{//},%
	morecomment=[s]{/*}{*/},%
	morestring=[b]',%
	morestring=[b]",%
	morestring=[s]{`}{`},%
}