% =====================================================================
%  unda-skripsi.cls
%  Kelas LaTeX naskah Skripsi S1 Program Studi Sistem Informasi,
%  Fakultas Ilmu Komputer, Universitas Darwan Ali (UNDA).
%  Penyusun : Dr. Dwi Wahyu Prabowo, S.Si., M.Eng.
%  Versi    : 1.1, 2026-11-26
%
%  Copyright (C) 2026 Dr. Dwi Wahyu Prabowo, S.Si., M.Eng.
%  Lisensi  : LaTeX Project Public License (LPPL) 1.3c atau lebih baru,
%             https://www.latex-project.org/lppl.txt
%  Status   : maintained; maintainer Dr. Dwi Wahyu Prabowo, S.Si., M.Eng.
%
%  Setiap nilai format di berkas ini ditelusuri ke KETENTUAN.md (kolom
%  No. ditulis sebagai [K-nn]). Nilai yang tidak diatur pedoman diberi
%  penanda TODO-KONFIRMASI. Mahasiswa tidak perlu mengubah berkas ini.
% =====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unda-skripsi}[2026/11/26 v1.1 Template Skripsi SI UNDA oleh Dr. Dwi Wahyu Prabowo, S.Si., M.Eng.]

\typeout{========================================================================}
\typeout{[UNDA SKRIPSI] PENGUMUMAN PENTING:}
\typeout{Jika naskah skripsi SUDAH LULUS UJIAN dan MENDAPATKAN PENGESAHAN,}
\typeout{opsi watermark WAJIB dihidupkan pada baris documentclass, contoh:}
\typeout{   \string\documentclass[watermark=isi]{unda-skripsi}}
\typeout{   atau: \string\documentclass[watermark=semua]{unda-skripsi}}
\typeout{========================================================================}

% ---------------------------------------------------------------------
% 1. Opsi kelas
% ---------------------------------------------------------------------
\RequirePackage{kvoptions}% opsi kelas berbentuk kunci=nilai
\SetupKeyvalOptions{family=unda,prefix=unda@}
\DeclareStringOption[tidak]{watermark}% tidak|sampul|awal|isi|semua
\DeclareBoolOption[true]{panduan}%      panduan=false menyembunyikan \panduan
\DeclareDefaultOption{\ClassWarning{unda-skripsi}{Opsi `\CurrentOption' diabaikan}}
\ProcessKeyvalOptions*

% Satu sakelar per zona halaman; diisi dari nilai opsi watermark.
\newif\ifunda@wm@sampul
\newif\ifunda@wm@awal
\newif\ifunda@wm@isi
\@namedef{unda@wmset@tidak}{}
\@namedef{unda@wmset@sampul}{\unda@wm@sampultrue}
\@namedef{unda@wmset@awal}{\unda@wm@awaltrue}
\@namedef{unda@wmset@isi}{\unda@wm@isitrue}
\@namedef{unda@wmset@semua}{\unda@wm@awaltrue\unda@wm@isitrue}
\ifcsname unda@wmset@\unda@watermark\endcsname
  \csname unda@wmset@\unda@watermark\endcsname
\else
  \ClassError{unda-skripsi}{Nilai watermark=`\unda@watermark' tidak dikenal}
    {Gunakan salah satu: tidak, sampul, awal, isi, semua.}
\fi

% [K-01] A4 potret, dicetak satu muka. [K-03] Huruf 12 pt.
\LoadClass[12pt,a4paper,oneside]{report}

% ---------------------------------------------------------------------
% 2. Mesin, huruf, dan bahasa
% ---------------------------------------------------------------------
\RequirePackage{iftex}% memastikan dikompilasi dengan XeLaTeX
\RequireXeTeX
\RequirePackage{amsmath}% persamaan bernomor dan lingkungan align
% [K-03] Latin Modern untuk teks, matematika, dan monospace. Huruf teks
% memakai bawaan kernel (Latin Modern, ukuran optik otomatis: LMRoman12
% pada 12 pt); unicode-math hanya menambahkan Latin Modern Math.
\RequirePackage{unicode-math}% huruf matematika OpenType
\setmathfont{latinmodern-math.otf}
% [K-29] Bahasa Indonesia dan pemenggalan suku kata Indonesia.
\RequirePackage[english,indonesian]{babel}% label otomatis Indonesia + pemenggalan "id"; english untuk Abstract
\addto\captionsindonesian{%
  \renewcommand\contentsname{Daftar Isi}%
  \renewcommand\listtablename{Daftar Tabel}%
  \renewcommand\listfigurename{Daftar Gambar}%
  \renewcommand\bibname{Daftar Pustaka}%
  \renewcommand\appendixname{Lampiran}%
  \renewcommand\figurename{Gambar}%
  \renewcommand\tablename{Tabel}%
  \renewcommand\abstractname{Abstrak}}
\RequirePackage{icomma}% [K-22] koma desimal di mode matematika: $0,05$
\RequirePackage{microtype}% protrusi tepi untuk mencegah baris luber
\RequirePackage{pdfpages}% penyisipan lembar scan pengesahan/pernyataan bertanda tangan & e-meterai
\emergencystretch 3em% proteksi margin: mencegah kata/kalimat meluber keluar batas margin kanan
\hyphenpenalty=100
\tolerance=1500
\hbadness=1500
\newcommand\istilah[1]{\textit{#1}}% format istilah asing konsisten miring (judul & isi)
\newcommand\sisipkanhalaman[2][plain]{%
  \cleardoublepage
  \phantomsection
  \includepdf[pages=1,pagecommand={\thispagestyle{#1}}]{#2}%
}

% ---------------------------------------------------------------------
% 3. Tata letak halaman
% ---------------------------------------------------------------------
% [K-02] Margin 4-4-3-3. Nomor halaman diletakkan 1,5 cm di bawah blok
% teks (di dalam margin bawah 3 cm).
% TODO-KONFIRMASI: jarak nomor halaman dari tepi tidak diatur pedoman.
\RequirePackage[a4paper,top=4cm,left=4cm,bottom=3cm,right=3cm,
  footskip=1.5cm]{geometry}% ukuran kertas dan margin
% [K-04] Spasi 1,5 untuk teks isi; spasi tunggal untuk kutipan panjang,
% judul tabel/gambar, dan daftar pustaka.
\RequirePackage{setspace}% \onehalfspacing dan \setstretch{1}
\onehalfspacing
% [K-05] TODO-KONFIRMASI: indentasi paragraf tidak diatur pedoman.
\setlength{\parindent}{1.25cm}
\setlength{\parskip}{0pt}
% Teks kosong/rata kiri pada judul tidak boleh dipenggal paksa.
\clubpenalty=10000
\widowpenalty=10000

% [K-06] Nomor halaman: bawah tengah pada semua halaman bernomor
% (gaya `plain' bawaan report). TODO-KONFIRMASI: posisi tidak diatur.
\pagestyle{plain}

% ---------------------------------------------------------------------
% 4. Penomoran bab, subbab, objek
% ---------------------------------------------------------------------
% [K-08] Bab ditulis BAB I s.d. BAB V; subbab desimal sampai tiga
% tingkat (3.1, 3.1.1). Objek dinomori per bab (Tabel 3.1, Gambar 2.1,
% Persamaan (3.1)). Pada lampiran nomor bab berubah menjadi huruf.
\newcommand*\unda@nomorbab{\arabic{chapter}}
\newcommand*\unda@labelbab{BAB}
\renewcommand\thechapter{\Roman{chapter}}
\renewcommand\thesection{\unda@nomorbab.\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thefigure{\unda@nomorbab.\arabic{figure}}
\renewcommand\thetable{\unda@nomorbab.\arabic{table}}
\renewcommand\theequation{\unda@nomorbab.\arabic{equation}}
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}

% ---------------------------------------------------------------------
% 5. Judul bab dan subbab
% ---------------------------------------------------------------------
% TODO-KONFIRMASI: ukuran, perataan, dan jarak judul tidak diatur
% pedoman. Dipakai: judul bab 14 pt tebal kapital rata tengah; subbab
% 12 pt tebal rata kiri.
\RequirePackage{titlesec}% format judul bab dan subbab
% Baris judul bab dipenggal seimbang (regangan terbatas di kedua sisi).
\newcommand*\unda@seimbang{%
  \leftskip=0pt plus 0.2\textwidth \rightskip=\leftskip
  \parfillskip=0pt \parindent=0pt \hyphenpenalty=10000
  \exhyphenpenalty=10000 \tolerance=10000 \hbadness=10000 }
\titleformat{\chapter}[display]
  {\normalfont\large\bfseries\unda@seimbang\setstretch{1}}
  {\unda@awalbab\unda@labelbab\ \thechapter}
  {0.5\baselineskip}
  {\MakeUppercase}
\titlespacing*{\chapter}{0pt}{0pt}{1.5\baselineskip}
\titleformat{\section}[hang]
  {\normalfont\normalsize\bfseries\setstretch{1}}{\thesection}{0.8em}{}
\titlespacing*{\section}{0pt}{1.2\baselineskip}{0.5\baselineskip}
\titleformat{\subsection}[hang]
  {\normalfont\normalsize\bfseries\setstretch{1}}{\thesubsection}{0.8em}{}
\titlespacing*{\subsection}{0pt}{1\baselineskip}{0.4\baselineskip}
\titleformat{\subsubsection}[hang]
  {\normalfont\normalsize\bfseries\itshape\setstretch{1}}{}{0pt}{}
\titlespacing*{\subsubsection}{0pt}{0.8\baselineskip}{0.3\baselineskip}

% ---------------------------------------------------------------------
% 6. Zona halaman (sampul, awal, isi) untuk penomoran dan watermark
% ---------------------------------------------------------------------
\newcommand*\unda@zona{awal}
\newcommand*\unda@setzona[1]{\gdef\unda@zona{#1}}
% Dipanggil dari label bab bernomor pertama: penomoran Arab dimulai
% pada halaman pertama BAB I [K-07].
\newcommand*\unda@awalbab{%
  \global\let\unda@awalbab\relax
  \pagenumbering{arabic}%
  \unda@setzona{isi}}

% ---------------------------------------------------------------------
% 7. Daftar isi, daftar tabel, daftar gambar, daftar lampiran
% ---------------------------------------------------------------------
% TODO-KONFIRMASI: format entri daftar tidak diatur pedoman.
\RequirePackage{titletoc}% format entri daftar isi/tabel/gambar/lampiran
\renewcommand\@pnumwidth{2.5em}% ruang nomor halaman di TOC/LOT/LOF (cukup untuk angka romawi xvii, dsb)
\renewcommand\@tocrmarg{3.5em}% margin kanan teks judul di TOC agar tidak tabrakan dengan nomor halaman
\newlength\unda@lebarlabelbab
\setlength\unda@lebarlabelbab{1.9cm}
\newcommand*\unda@tocprefix{BAB}
\titlecontents{chapter}[\unda@lebarlabelbab]{\addvspace{4pt}\setstretch{1}}
  {\contentslabel[\unda@tocprefix~\thecontentslabel]{\unda@lebarlabelbab}\MakeUppercase}
  {\hspace*{-\unda@lebarlabelbab}\MakeUppercase}
  {\titlerule*[0.6pc]{.}\contentspage}
\titlecontents{section}[3.2cm]{\setstretch{1}}
  {\contentslabel{1.3cm}}{\hspace*{-1.3cm}}
  {\titlerule*[0.6pc]{.}\contentspage}
\titlecontents{subsection}[4.7cm]{\setstretch{1}}
  {\contentslabel{1.5cm}}{\hspace*{-1.5cm}}
  {\titlerule*[0.6pc]{.}\contentspage}
\titlecontents{figure}[2.7cm]{\addvspace{2pt}\setstretch{1}}
  {\contentslabel[\figurename~\thecontentslabel]{2.7cm}}{\hspace*{-2.7cm}}
  {\titlerule*[0.6pc]{.}\contentspage}
\titlecontents{table}[2.4cm]{\addvspace{2pt}\setstretch{1}}
  {\contentslabel[\tablename~\thecontentslabel]{2.4cm}}{\hspace*{-2.4cm}}
  {\titlerule*[0.6pc]{.}\contentspage}
\titlecontents{lampiran}[3.0cm]{\addvspace{2pt}\setstretch{1}}
  {\contentslabel[\appendixname~\thecontentslabel]{3.0cm}}{\hspace*{-3.0cm}}
  {\titlerule*[0.6pc]{.}\contentspage}
\contentsuse{lampiran}{lam}
% Ditulis ke .toc saat lampiran dimulai: entri bab berikutnya berlabel
% "LAMPIRAN A" dengan kolom label yang lebih lebar.
\newcommand*\unda@toclampiran{%
  \renewcommand*\unda@tocprefix{LAMPIRAN}%
  \setlength\unda@lebarlabelbab{3.3cm}}

% Judul bagian tanpa nomor (bagian awal, daftar pustaka) yang tetap
% tercantum di daftar isi.
\newcommand\unda@judulbagian[1]{%
  \chapter*{#1}%
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}}

\newcommand\daftarisi{\unda@judulbagian{\contentsname}\@starttoc{toc}}
\newcommand\daftartabel{\unda@judulbagian{\listtablename}\@starttoc{lot}}
\newcommand\daftargambar{\unda@judulbagian{\listfigurename}\@starttoc{lof}}
\newcommand\daftarlampiran{\unda@judulbagian{Daftar Lampiran}\@starttoc{lam}}

% ---------------------------------------------------------------------
% 8. Tabel, gambar, sumber, kutipan panjang, daftar butir
% ---------------------------------------------------------------------
% [K-15] Judul tabel di atas, judul gambar di bawah, spasi tunggal.
% TODO-KONFIRMASI: pemisah label ("Tabel 3.1 Judul") dan ukuran huruf
% judul tidak diatur pedoman.
\RequirePackage{caption}% format dan posisi judul tabel/gambar
\captionsetup{font={stretch=1},labelsep=space,justification=centering,
  skip=6pt}
\captionsetup[table]{position=top}
\RequirePackage{booktabs}% garis tabel \toprule, \midrule, \bottomrule
\RequirePackage{tabularx}% kolom lebar otomatis agar tabel tidak melewati margin [K-16]
\RequirePackage{pdflscape}% halaman landscape untuk tabel lebar di lampiran
% TODO-KONFIRMASI: spasi isi tabel tidak diatur; dipakai spasi tunggal.
\AddToHook{env/table/begin}{\setstretch{1}}
\AddToHook{env/figure/begin}{\setstretch{1}}
% [K-17] Sumber data/gambar di bawah objek.
\newcommand\sumber[1]{\par\vspace{3pt}{\small Sumber: #1\par}}
% [K-04] Kutipan langsung >= 40 kata: blok, spasi tunggal, tanpa tanda kutip.
\newenvironment{kutipan}
  {\list{}{\leftmargin=\parindent\rightmargin=0pt}\item\relax\setstretch{1}}
  {\endlist}
% TODO-KONFIRMASI: format daftar butir tidak diatur pedoman.
\RequirePackage{enumitem}% jarak daftar bernomor/berbutir
\setlist{nosep}
\setlist[enumerate,1]{label=\arabic*.}

% ---------------------------------------------------------------------
% 9. Kode program dan algoritma
% ---------------------------------------------------------------------
% [K-20] Kode program hanya di lampiran; judulnya "Kode".
\RequirePackage{listings}% kode program dengan judul "Kode"
\renewcommand\lstlistingname{Kode}
\lstset{basicstyle=\ttfamily\small\setstretch{1},columns=fullflexible,
  keepspaces=true,breaklines=true,frame=tb,numbers=left,
  numberstyle=\scriptsize,numbersep=8pt,xleftmargin=1.2em,
  captionpos=t,showstringspaces=false,tabsize=4}
\AtBeginDocument{%
  \renewcommand\thelstlisting{\unda@nomorbab.\arabic{lstlisting}}}
% [K-21] Algoritma berlangkah bernomor (pseudocode) bernomor per bab.
\RequirePackage[chapter]{algorithm}% lingkungan mengambang "Algoritma"
\RequirePackage{algpseudocode}% sintaks pseudocode
\floatname{algorithm}{Algoritma}
\renewcommand\thealgorithm{\unda@nomorbab.\arabic{algorithm}}
\algrenewcommand\algorithmicrequire{\textbf{Masukan:}}
\algrenewcommand\algorithmicensure{\textbf{Keluaran:}}
\algrenewcommand\algorithmicfor{\textbf{untuk}}
\algrenewcommand\algorithmicforall{\textbf{untuk setiap}}
\algrenewcommand\algorithmicdo{\textbf{lakukan}}
\algrenewcommand\algorithmicwhile{\textbf{selama}}
\algrenewcommand\algorithmicif{\textbf{jika}}
\algrenewcommand\algorithmicthen{\textbf{maka}}
\algrenewcommand\algorithmicelse{\textbf{jika tidak}}
\algrenewcommand\algorithmicend{\textbf{akhir}}
\algrenewcommand\algorithmicreturn{\textbf{kembalikan}}
\algrenewcommand\algorithmicfunction{\textbf{fungsi}}
\algrenewcommand\algorithmicprocedure{\textbf{prosedur}}

% ---------------------------------------------------------------------
% 10. Daftar pustaka (IEEE, biblatex + biber)
% ---------------------------------------------------------------------
% [K-24] Konflik: pedoman mengatur APA 7th; prompt penyusun mewajibkan
% IEEE bernomor (prompt menang atas pedoman).
\RequirePackage[autostyle=false,style=english]{csquotes}% tanda kutip judul artikel “...”
\RequirePackage[backend=biber,style=ieee,citestyle=ieee-comp,dashed=false]{biblatex}% sitasi IEEE [1], [2]--[4]
\addbibresource{references.bib}
% biblatex tidak memiliki indonesian.lbx; bahasa Indonesia dipetakan ke
% berkas english.lbx lalu seluruh string yang tampil ditimpa di sini.
\DeclareLanguageMapping{indonesian}{english}
\DefineBibliographyStrings{indonesian}{%
  bibliography = Daftar Pustaka,
  references  = Daftar Pustaka,
  artno       = Art\adddot\addspace no\adddot,
  jourvol     = vol\adddot,
  volume      = vol\adddot,
  number      = no\adddot,
  andothers   = dkk\adddot,
  and         = dan,
  in          = dalam,
  editor      = Ed\adddot,
  editors     = Ed\adddot,
  page        = hlm\adddot,
  pages       = hlm\adddot,
  chapter     = bab,
  edition     = ed\adddot,
  url         = [Daring]\adddot\addspace Tersedia,
  urlseen     = Diakses\addcolon,
  phdthesis   = Disertasi doktor,
  mathesis    = Tesis magister,
  techreport  = Lap\adddot\addspace tek\adddot,
  presentedat = dipresentasikan pada\addspace,
  january     = Jan\adddot,
  february    = Feb\adddot,
  march       = Mar\adddot,
  april       = Apr\adddot,
  may         = Mei,
  june        = Jun\adddot,
  july        = Jul\adddot,
  august      = Agu\adddot,
  september   = Sep\adddot,
  october     = Okt\adddot,
  november    = Nov\adddot,
  december    = Des\adddot}
% Nama bulan disingkat seperti gaya IEEE. Urutan tanggal Indonesia:
% hari bulan tahun (mis. 26 Nov. 2026).
\DefineBibliographyExtras{indonesian}{%
  \protected\def\mkbibdatelong#1#2#3{%
    \iffieldundef{#3}{}{\stripzeros{\thefield{#3}}\nobreakspace}%
    \iffieldundef{#2}{}{\mkbibmonth{\thefield{#2}}\iffieldundef{#1}{}{\space}}%
    \iffieldbibstring{#1}{\bibstring{\thefield{#1}}}{\stripzeros{\thefield{#1}}}}%
  \protected\def\mkbibdateshort#1#2#3{\mkbibdatelong{#1}{#2}{#3}}%
  \protected\def\mkbibordinal#1{#1}}
% Gaya ieee tidak punya driver @standard: judul miring, nomor standar,
% penerbit, tempat, tahun, lalu tautan (pola IEEE untuk standar).
\DeclareFieldFormat[standard]{title}{\mkbibemph{#1}}
\DeclareFieldFormat[standard]{number}{#1}
\DeclareBibliographyDriver{standard}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \printfield{title}%
  \newunit\printfield{number}%
  \newunit\printlist{organization}%
  \newunit\printlist{location}%
  \newunit\usebibmacro{date}%
  \setunit{\adddot\addspace}\newblock
  \usebibmacro{url+urldate}%
  \usebibmacro{finentry}}
\DeclareBibliographyAlias{legislation}{standard}% undang-undang / regulasi mengikuti format standar resmi
\AtBeginBibliography{\setstretch{1}% rata kanan-kiri (justified) sesuai instruksi prodi
  \emergencystretch 3em% toleransi spasi agar baris rata kanan-kiri tidak meluber
  \setcounter{biburllcpenalty}{7000}% izinkan pemenggalan URL pada huruf kecil
  \setcounter{biburlucpenalty}{8000}% izinkan pemenggalan URL pada huruf kapital
  \setcounter{biburlnumpenalty}{9000}% izinkan pemenggalan URL pada angka
}
\setlength\bibitemsep{0.5\baselineskip}
\defbibheading{unda}[\bibname]{\unda@judulbagian{#1}}
\newcommand\daftarpustaka{\printbibliography[heading=unda]}

% ---------------------------------------------------------------------
% 11. Identitas skripsi (diisi di config/identitas.tex)
% ---------------------------------------------------------------------
\newcommand*\unda@isian[1]{\textit{[#1 belum diisi]}}
\def\unda@buatisian#1{%
  \expandafter\def\csname unda@#1\endcsname{\unda@isian{#1}}%
  \expandafter\def\csname #1\endcsname##1{\expandafter\def\csname unda@#1\endcsname{##1}}}
\@for\unda@x:=judul,judulinggris,nama,npm,programstudi,fakultas,universitas,%
  kota,tahun,gelar,tanggalujian,tanggalpengesahan,tanggalpersetujuan,%
  pembimbing,nuptkpembimbing,pembimbingutama,nuptkpembimbingutama,pembimbingpendamping,%
  nuptkpembimbingpendamping,ketuapenguji,nuptkketuapenguji,%
  anggotapenguji,nuptkanggotapenguji,pengujisatu,nuptkpengujisatu,pengujidua,nuptkpengujidua,%
  dekan,nuptkdekan,kaprodi,nuptkkaprodi,ketuaprogramstudi,nuptkketuaprogramstudi,%
  labelnomorinduk,aitools,tautangithub,tautanmendeley\do{\expandafter\unda@buatisian\expandafter{\unda@x}}
% Nilai bawaan yang tetap untuk prodi ini.
\programstudi{Sistem Informasi}
\fakultas{Ilmu Komputer}
\universitas{Universitas Darwan Ali}
\kota{Sampit}
\gelar{Sarjana Komputer}
\labelnomorinduk{NPM}
\pembimbingpendamping{}
\def\pembimbing#1{\def\unda@pembimbing{#1}\def\unda@pembimbingutama{#1}}
\def\nuptkpembimbing#1{\def\unda@nuptkpembimbing{#1}\def\unda@nuptkpembimbingutama{#1}}
\def\pengujisatu#1{\def\unda@pengujisatu{#1}\def\unda@ketuapenguji{#1}}
\def\nuptkpengujisatu#1{\def\unda@nuptkpengujisatu{#1}\def\unda@nuptkketuapenguji{#1}}
\def\anggotapenguji#1{\def\unda@anggotapenguji{#1}\def\unda@pengujidua{#1}}
\def\nuptkanggotapenguji#1{\def\unda@nuptkanggotapenguji{#1}\def\unda@nuptkpengujidua{#1}}
\def\pengujidua#1{\def\unda@pengujidua{#1}\def\unda@anggotapenguji{#1}}
\def\nuptkpengujidua#1{\def\unda@nuptkpengujidua{#1}\def\unda@nuptkanggotapenguji{#1}}
\def\kaprodi#1{\def\unda@kaprodi{#1}\def\unda@ketuaprogramstudi{#1}}
\def\nuptkkaprodi#1{\def\unda@nuptkkaprodi{#1}\def\unda@nuptkketuaprogramstudi{#1}}
\def\ketuaprogramstudi#1{\def\unda@ketuaprogramstudi{#1}\def\unda@kaprodi{#1}}
\def\nuptkketuaprogramstudi#1{\def\unda@nuptkketuaprogramstudi{#1}\def\unda@nuptkkaprodi{#1}}
\aitools{ChatGPT, Claude, Grammarly, GitHub Copilot}
\tautangithub{https://github.com/mahasiswa/skripsi-sisfo-unda}
\tautanmendeley{https://data.mendeley.com/datasets/sample-dataset/1}
% Makro publik untuk akses metadata di luar berkas kelas (mis. kata pengantar)
\newcommand\judulskripsi{\unda@judul}
\newcommand\namamahasiswa{\unda@nama}
\newcommand\npmmahasiswa{\unda@npm}
\newcommand\dosendpembimbing{\unda@pembimbingutama}
\newcommand\tautanrepogithub{\unda@tautangithub}
\newcommand\tautanrepomendeley{\unda@tautanmendeley}
\newcommand*\unda@adapendamping{%
  \expandafter\ifx\expandafter\relax\detokenize\expandafter{\unda@pembimbingpendamping}\relax
    \expandafter\@secondoftwo\else\expandafter\@firstoftwo\fi}

% ---------------------------------------------------------------------
% 12. Sampul luar dan halaman judul
% ---------------------------------------------------------------------
% [K-10] Tata letak sampul memakai tinggi zona tetap; panjang judul
% tidak menggeser elemen lain. Urutan elemen mengikuti instruksi
% penyusun. TODO-KONFIRMASI: tata letak, ukuran logo, dan warna sampul
% tidak diatur pedoman.
\RequirePackage{graphicx}% logo sampul dan gambar
\newcommand*\unda@logo{figures/logounda.png}
\newlength\unda@zjudul    \setlength\unda@zjudul{6.0cm}
\newlength\unda@zskripsi  \setlength\unda@zskripsi{1.6cm}
\newlength\unda@zmaksud   \setlength\unda@zmaksud{2.2cm}
\newlength\unda@zlogo     \setlength\unda@zlogo{5.2cm}
\newlength\unda@zpenulis  \setlength\unda@zpenulis{3.0cm}
\newlength\unda@lebarlogo \setlength\unda@lebarlogo{4.0cm}
\newlength\unda@zinstitusi% sisa tinggi blok teks, dihitung saat sampul dibuat
\newcommand\unda@kotak[3][c]{%
  \nointerlineskip
  \hbox to\textwidth{\parbox[c][#2][#1]{\textwidth}{\centering #3\par\kern0pt}}}
% Judul: kapital, tebal, pemenggalan baris seimbang tanpa tanda hubung.
% Bila judul melebihi tinggi zona, ukuran huruf turun dari 14 ke 12 pt.
\newsavebox\unda@kotakjudul
\newcommand\unda@isijudul[1]{%
  \parbox{\textwidth}{#1\bfseries\unda@seimbang
    \MakeUppercase{\unda@judul}\par}}
\newcommand\unda@cetakjudul{%
  \sbox\unda@kotakjudul{\unda@isijudul{\large}}%
  \ifdim\dimexpr\ht\unda@kotakjudul+\dp\unda@kotakjudul\relax>\dimexpr\unda@zjudul-4mm\relax
    \sbox\unda@kotakjudul{\unda@isijudul{\normalsize}}%
  \fi
  \usebox\unda@kotakjudul}
\newcommand\unda@isisampul{%
  \begingroup\setstretch{1}
  \setlength\unda@zinstitusi{\dimexpr\textheight-\unda@zjudul-\unda@zskripsi
    -\unda@zmaksud-\unda@zlogo-\unda@zpenulis\relax}%
  \noindent
  \vbox to\textheight{%
    \unda@kotak{\unda@zjudul}{\unda@cetakjudul}%
    \unda@kotak{\unda@zskripsi}{\large\bfseries SKRIPSI}%
    \unda@kotak{\unda@zmaksud}{Diajukan untuk memenuhi salah satu syarat
      memperoleh gelar\\ \unda@gelar}%
    \unda@kotak{\unda@zlogo}{\includegraphics[width=\unda@lebarlogo]{\unda@logo}}%
    \unda@kotak{\unda@zpenulis}{Disusun oleh:\\[4pt]
      \textbf{\MakeUppercase{\unda@nama}}\\ \unda@labelnomorinduk\ \unda@npm}%
    \unda@kotak[b]{\unda@zinstitusi}{%
      \large\bfseries PROGRAM STUDI \MakeUppercase{\unda@programstudi}\\
      FAKULTAS \MakeUppercase{\unda@fakultas}\\
      \MakeUppercase{\unda@universitas}\\
      \MakeUppercase{\unda@kota}\\
      \unda@tahun}%
    \kern0pt}%
  \endgroup}
% Sampul luar: tanpa nomor halaman dan tidak ikut dihitung [K-09].
\newcommand\buatsampul{%
  \clearpage
  \pagenumbering{alph}%
  \unda@setzona{sampul}%
  \thispagestyle{empty}%
  \unda@isisampul
  \clearpage}
% Halaman judul dalam: halaman i, nomornya tidak dicetak.
% TODO-KONFIRMASI: pencetakan nomor pada halaman judul tidak diatur.
\newcommand\buathalamanjudul{%
  \clearpage
  \pagenumbering{roman}%
  \unda@setzona{awal}%
  \thispagestyle{empty}%
  \unda@isisampul
  \clearpage}

% ---------------------------------------------------------------------
% 13. Lembar persetujuan, pengesahan, pernyataan keaslian
% ---------------------------------------------------------------------
% Blok tanda tangan: jabatan, ruang tanda tangan 2,2 cm, nama, NUPTK
% (format blangko BAP-07 Buku Panduan Dosen).
% Nama dosen dan gelar dijamin TIDAK terpenggal menjadi dua baris dengan \mbox.
\newlength\unda@ruangttd
\setlength\unda@ruangttd{2.2cm}% ruang tanda tangan
\newcommand\unda@ttd[4][0.48\textwidth]{%
  \parbox[t]{#1}{\centering\setstretch{1} #2\par
    \vspace{\unda@ruangttd}\mbox{\textbf{#3}}\par NUPTK #4\par}}
% Identitas naskah (Judul, Nama, nomor induk: BAP-07); argumen opsional
% menambah baris lain.
\newcommand\unda@identitas[1][]{%
  \begin{tabular}{@{}p{3.2cm}@{\,:\ }>{\raggedright\arraybackslash}p{\dimexpr\textwidth-3.2cm-1em\relax}@{}}
    Judul & \unda@judul\\
    Nama & \unda@nama\\
    \unda@labelnomorinduk & \unda@npm\\
    #1%
  \end{tabular}}
\newcommand\unda@blokpembimbing{%
  \unda@adapendamping
    {\noindent\unda@ttd{Dosen Pembimbing Utama,}{\unda@pembimbingutama}{\unda@nuptkpembimbingutama}%
     \hfill
     \unda@ttd{Dosen Pembimbing Pendamping,}{\unda@pembimbingpendamping}{\unda@nuptkpembimbingpendamping}\par}
    {\begin{center}\unda@ttd[\textwidth]{Dosen Pembimbing,}{\unda@pembimbingutama}{\unda@nuptkpembimbingutama}\end{center}}}

% [K-11] Lembar persetujuan pembimbing (Pedoman Subbab 13.2.2).
\newcommand\lembarpersetujuan{%
  \unda@judulbagian{Lembar Persetujuan}%
  \begingroup\setstretch{1}
  \noindent Naskah skripsi dengan identitas berikut telah dibaca penuh oleh
  dosen pembimbing, dinilai layak untuk diuji pada Sidang Akhir
  Skripsi, dan seluruh catatan bimbingan pada logbook telah diverifikasi.
  \par\vspace{1\baselineskip}
  \noindent\unda@identitas[Program Studi & \unda@programstudi\\]\par
  \vspace{1.5\baselineskip}
  \begin{center}\unda@kota, \unda@tanggalpersetujuan\end{center}
  \vspace{0.5\baselineskip}
  \unda@blokpembimbing
  \endgroup}

% [K-12] Lembar pengesahan
\newcommand\lembarpengesahan{%
  \unda@judulbagian{Lembar Pengesahan}%
  \begingroup\setstretch{1}\setlength\unda@ruangttd{1.8cm}%
  \noindent Naskah skripsi dengan identitas di bawah ini telah dipertahankan
  di hadapan Dewan Penguji pada Sidang Akhir Skripsi tanggal
  \unda@tanggalujian\ dan disahkan sebagai salah satu syarat kelulusan
  mencapai derajat \unda@gelar.\par
  \vspace{0.6\baselineskip}
  \noindent\unda@identitas\par
  \vspace{0.6\baselineskip}
  \noindent\textbf{Dewan Penguji}\par\vspace{2pt}
  \noindent\begin{tabularx}{\textwidth}{@{}c >{\raggedright\arraybackslash}p{7.0cm} >{\raggedright\arraybackslash}p{3.1cm} >{\centering\arraybackslash}X@{}}
    \toprule
    No. & Nama & Jabatan & Tanda Tangan\\
    \midrule
    1. & \mbox{\textbf{\unda@ketuapenguji}} & Ketua Penguji\newline(Penguji I) & \rule[-0.35cm]{0pt}{1.0cm}\\
    2. & \mbox{\textbf{\unda@anggotapenguji}} & Anggota Penguji\newline(Penguji II) & \rule[-0.35cm]{0pt}{1.0cm}\\
    \bottomrule
  \end{tabularx}\par
  \vspace{0.6\baselineskip}
  \noindent Disetujui oleh:\par\vspace{2pt}
  \unda@blokpembimbing
  \par\vspace{0.6\baselineskip}
  {\centering
    \unda@ttd[\textwidth]{Mengetahui dan Mengesahkan,\\ Ketua Program Studi \unda@programstudi\\
      Fakultas \unda@fakultas\ \unda@universitas}{\unda@kaprodi}{\unda@nuptkkaprodi}\par}
  \endgroup}

% [K-13] Pernyataan keaslian (Pedoman Bab 2: kepengarangan tunggal,
% Turnitin, pengungkapan GenAI). TODO-KONFIRMASI: redaksi dan meterai
% tidak diatur pedoman.
\newcommand\pernyataankeaslian[1][]{%
  \unda@judulbagian{Pernyataan Keaslian}%
  \noindent Saya yang bertanda tangan di bawah ini:\par
  \begingroup\setstretch{1}\vspace{0.5\baselineskip}
  \noindent\begin{tabular}{@{}p{3.2cm}@{\,:\ }>{\raggedright\arraybackslash}p{\dimexpr\textwidth-3.2cm-1em\relax}@{}}
    Nama & \unda@nama\\
    \unda@labelnomorinduk & \unda@npm\\
    Program Studi & \unda@programstudi\\
  \end{tabular}\par\vspace{0.5\baselineskip}\endgroup
  \noindent menyatakan bahwa skripsi berjudul \enquote{\unda@judul} adalah
  karya saya sendiri. Seluruh sumber yang saya kutip atau rujuk telah saya
  nyatakan dengan benar dan tercantum pada Daftar Pustaka. Penggunaan
  alat bantu kecerdasan buatan generatif telah saya ungkapkan secara
  lengkap#1. Apabila di kemudian hari terbukti terdapat pelanggaran
  integritas akademik dalam skripsi ini, saya bersedia menerima sanksi
  sesuai ketentuan yang berlaku di \unda@universitas.\par
  \vspace{1.0\baselineskip}
  \hfill
  \begin{tabular}{@{}c@{\hspace{0.6cm}}c@{}}
    & \unda@kota, \unda@tanggalpengesahan\\
    & Yang menyatakan,\\[0.3cm]
    \fbox{\parbox[c][2.0cm][c]{1.8cm}{\centering\scriptsize\color{gray}\textbf{e-Meterai}\\Rp 10.000}} &
    \parbox[c][2.0cm][c]{6.0cm}{\centering\vspace{1.8cm}} \\
    & \mbox{\textbf{\unda@nama}}\\
    & \unda@labelnomorinduk\ \unda@npm
  \end{tabular}\par}

% [K-13b] Pernyataan penggunaan alat bantu kecerdasan buatan (AI Tools)
\newcommand\pernyataanai{%\cleardoublepage
  \unda@judulbagian{Pernyataan Penggunaan Tools AI}%
  \begingroup\setstretch{1}
  \noindent Saya yang bertanda tangan di bawah ini:\par
  \vspace{0.3\baselineskip}
  \noindent\begin{tabular}{@{}p{3.2cm}@{\,:\ }>{\raggedright\arraybackslash}p{\dimexpr\textwidth-3.2cm-1em\relax}@{}}
    Nama & \unda@nama\\
    \unda@labelnomorinduk & \unda@npm\\
    Program Studi & \unda@programstudi\\
    Judul Skripsi & \unda@judul\\
  \end{tabular}\par\vspace{0.4\baselineskip}
  \noindent menyatakan secara sadar, jujur, dan transparan bahwa dalam penyusunan naskah skripsi ini, saya memanfaatkan alat bantu berbasis kecerdasan buatan (\textit{Artificial Intelligence} / AI) dengan rincian sebagai berikut:
  \begin{enumerate}[noitemsep,topsep=2pt,leftmargin=1.5em]
    \item \textbf{Alat Bantu AI yang Digunakan}: \unda@aitools.
    \item \textbf{Tujuan dan Ruang Lingkup Pemanfaatan}: Alat bantu tersebut digunakan secara etis sebatas sarana pembantu penyuntingan tata bahasa (\textit{proofreading}), penelusuran sinonim kalimat, pengecekan ejaan, dan bantuan penelusuran kesalahan sintaks program (\textit{debugging}).
    \item \textbf{Orisinalitas dan Kepemilikan Gagasan}: Seluruh gagasan utama, rumusan masalah, metodologi riset, analisis data, sintesis, pembahasan, dan kesimpulan akhir adalah murni hasil pemikiran dan karya intelektual saya sendiri, bukan hasil generatif otomatis kecerdasan buatan (\textit{not AI-generated content}).
    \item \textbf{Tanggung Jawab Ilmiah}: Saya bertanggung jawab penuh atas kebenaran, validitas sitasi ilmiah, dan integritas seluruh isi naskah skripsi ini, serta menjamin tidak ada rekayasa atau fabrikasi data.
  \end{enumerate}
  \noindent Demikian pernyataan ini saya buat dengan sebenarnya dalam keadaan sadar dan penuh rasa tanggung jawab akademik.
  \par\vspace{0.6\baselineskip}
  \hfill
  \begin{tabular}{@{}c@{\hspace{0.6cm}}c@{}}
    & \unda@kota, \unda@tanggalpengesahan\\
    & Yang menyatakan,\\[0.3cm]
    \fbox{\parbox[c][2.0cm][c]{1.8cm}{\centering\scriptsize\color{gray}\textbf{e-Meterai}\\Rp 10.000}} &
    \parbox[c][2.0cm][c]{6.0cm}{\centering\vspace{1.8cm}} \\
    & \mbox{\textbf{\unda@nama}}\\
    & \unda@labelnomorinduk\ \unda@npm
  \end{tabular}\par
  \endgroup}

% ---------------------------------------------------------------------
% 14. Abstrak, kata pengantar, daftar lambang
% ---------------------------------------------------------------------
% [K-25] Abstrak satu paragraf, tanpa sitasi. [K-26] Kata kunci.
% TODO-KONFIRMASI: jumlah kata abstrak skripsi dan jumlah kata kunci
% tidak diatur pedoman (150-250 kata hanya diatur untuk artikel).
\newenvironment{abstrak}{\unda@judulbagian{Abstrak}}{\par}
\renewenvironment{abstract}{\unda@judulbagian{Abstract}%
  \begin{otherlanguage}{english}}{\par\end{otherlanguage}}
\newcommand\katakunci[1]{\par\vspace{\baselineskip}\noindent\textbf{Kata kunci:} #1\par}
\newcommand\keywords[1]{\par\vspace{\baselineskip}\noindent\textbf{Keywords:} #1\par}
\newenvironment{katapengantar}{\unda@judulbagian{Kata Pengantar}}{%
  \par\vspace{1.5\baselineskip}
  \hfill\parbox[t]{0.46\textwidth}{\centering\setstretch{1}
    \unda@kota, \unda@tanggalpengesahan\par\vspace{1.5cm}\unda@nama\par}\par}
% [K-14] Daftar lambang (wajib bila lebih dari sepuluh simbol).
% TODO-KONFIRMASI: penggabungan dengan daftar singkatan tidak diatur.
\newenvironment{daftarlambang}[1][Daftar Lambang dan Singkatan]
  {\unda@judulbagian{#1}\setstretch{1}
   \list{}{\setlength\labelwidth{2.5cm}\setlength\leftmargin{3.0cm}%
     \setlength\labelsep{0.5cm}\setlength\itemsep{4pt}%
     \renewcommand\makelabel[1]{##1\hfil}}}
  {\endlist}
\newcommand\lambang[2]{\item[#1] #2}
\newcommand\subjudullambang[1]{\item[]\hspace*{-\leftmargin}\textbf{#1}}

% ---------------------------------------------------------------------
% 15. Lampiran
% ---------------------------------------------------------------------
% [K-19] Lampiran berlabel huruf: LAMPIRAN A, Tabel A.1, Kode C.1.
% TODO-KONFIRMASI: pola penomoran lampiran tidak diatur pedoman.
\newcommand\unda@mulailampiran{%
  \global\let\unda@mulailampiran\relax
  \clearpage
  \addtocontents{toc}{\protect\unda@toclampiran}%
  \setcounter{chapter}{0}%
  \gdef\unda@labelbab{LAMPIRAN}%
  \gdef\thechapter{\Alph{chapter}}%
  \gdef\unda@nomorbab{\Alph{chapter}}%
  \gdef\theHchapter{lampiran.\Alph{chapter}}}
\newcommand\lampiran[2][]{%
  \unda@mulailampiran
  \chapter{#2}%
  \addcontentsline{lam}{lampiran}{\protect\numberline{\thechapter}#2}%
  \if\relax\detokenize{#1}\relax\else\label{#1}\fi}

% ---------------------------------------------------------------------
% 16. Watermark logo (eso-pic + TikZ)
% ---------------------------------------------------------------------
% eso-pic memberi kait latar per halaman saat halaman dikirim ke PDF,
% sehingga zona halaman dapat diperiksa tanpa mengubah tata letak;
% TikZ menyediakan transparansi. Paket background tidak dipakai karena
% pemilihan halaman per zona tetap harus dibuat sendiri.
\RequirePackage{xcolor}% warna abu-abu teks panduan
\RequirePackage{tikz}% transparansi watermark dan contoh diagram
\RequirePackage{eso-pic}% kait latar belakang setiap halaman
\newcommand*\unda@wm@opacity{0.06}
\newcommand*\unda@wm@scale{0.5}
\newcommand*\unda@wm@posisi{tengah}
\pgfkeys{/unda/wm/.cd,
  opacity/.store in=\unda@wm@opacity,
  scale/.store in=\unda@wm@scale,
  posisi/.is choice,
  posisi/tengah/.code={\def\unda@wm@posisi{tengah}},
  posisi/kanan-bawah/.code={\def\unda@wm@posisi{kanan-bawah}},
  posisi/kiri-atas/.code={\def\unda@wm@posisi{kiri-atas}}}
\newcommand\setwatermark[1]{%
  \pgfkeys{/unda/wm/.cd,#1}%
  \ifdim\unda@wm@opacity pt>0.08pt
    \ClassWarning{unda-skripsi}{opacity watermark > 0,08 dapat mengganggu keterbacaan}%
  \fi}
\newcommand\unda@wm@logo{%
  \tikz\node[inner sep=0pt,opacity=\unda@wm@opacity,text opacity=\unda@wm@opacity]
    {\includegraphics[width=\unda@wm@scale\textwidth]{\unda@logo}};}
\newcommand\unda@wm@tempat{%
  \def\unda@tmp{tengah}%
  \ifx\unda@wm@posisi\unda@tmp
    \AtPageCenter{\makebox(0,0){\unda@wm@logo}}%
  \else\def\unda@tmp{kanan-bawah}%
    \ifx\unda@wm@posisi\unda@tmp
      \AtPageLowerLeft{\put(\LenToUnit{\dimexpr\paperwidth-3cm\relax},\LenToUnit{3cm}){%
        \makebox(0,0)[rb]{\unda@wm@logo}}}%
    \else
      \AtPageUpperLeft{\put(\LenToUnit{4cm},\LenToUnit{-4cm}){%
        \makebox(0,0)[lt]{\unda@wm@logo}}}%
    \fi
  \fi}
% Driver PGF untuk xdvipdfmx baru mendaftarkan resource transparansi
% setelah halaman pertama yang memakainya disiapkan, sehingga halaman itu
% kehilangan resource ExtGState. Penanda diaktifkan sejak awal dokumen.
\AtBeginDocument{%
  \ifunda@wm@sampul\unda@wm@extgs\fi
  \ifunda@wm@awal\unda@wm@extgs\fi
  \ifunda@wm@isi\unda@wm@extgs\fi}
\newcommand*\unda@wm@extgs{%
  \ifcsname ifpgf@sys@pdf@extgs@exists\endcsname
    \global\csname pgf@sys@pdf@extgs@existstrue\endcsname
  \fi}
\newcommand*\unda@str@sampul{sampul}
\newcommand*\unda@str@awal{awal}
\newcommand*\unda@str@isi{isi}
\AddToShipoutPictureBG{%
  \ifx\unda@zona\unda@str@sampul\ifunda@wm@sampul\unda@wm@tempat\fi\fi
  \ifx\unda@zona\unda@str@awal\ifunda@wm@awal\unda@wm@tempat\fi\fi
  \ifx\unda@zona\unda@str@isi\ifunda@wm@isi\unda@wm@tempat\fi\fi}

% ---------------------------------------------------------------------
% 17. Teks panduan penulisan
% ---------------------------------------------------------------------
% Teks panduan diturunkan dari pedoman; hilang seluruhnya dengan
% opsi kelas panduan=false.
\ifunda@panduan
  \newcommand\panduan[1]{%
    \par\begingroup\small\setstretch{1}\color{black!60}%
    \list{}{\leftmargin=0pt\rightmargin=0pt\topsep=4pt}\item\relax
    \textbf{Panduan:} \itshape #1\endlist\endgroup}
\else
  \newcommand\panduan[1]{}
\fi

% ---------------------------------------------------------------------
% 18. Tautan dan metadata PDF (hyperref dimuat terakhir)
% ---------------------------------------------------------------------
\RequirePackage[hidelinks,bookmarksnumbered]{hyperref}% tautan daftar isi, rujukan silang, metadata
\pdfstringdefDisableCommands{%
  \def\istilah#1{#1}%
  \def\textit#1{#1}%
  \def\textbf#1{#1}%
  \def\enquote#1{"#1"}%
}
\AtBeginDocument{%
  \hypersetup{pdftitle={\unda@judul},pdfauthor={\unda@nama},
    pdfsubject={Skripsi \unda@programstudi, \unda@universitas},
    pdflang={id-ID}}}
\endinput
