# Matriks Ketentuan Template Skripsi S1 Sistem Informasi UNDA

Dokumen ini adalah hasil FASE 1: ketentuan format dan struktur yang diekstraksi
dari dua sumber rujukan, beserta status penerapannya di template.

**Sumber dan cara merujuk**

- **[P]** Buku Pedoman & Standar Riset Skripsi Sistem Informasi (Buku_Pedoman_LaTeX/main.pdf,
  256 halaman PDF). Halaman ditulis sebagai *hlm. buku (PDF n)*; hlm. buku = PDF − 24.
- **[D]** Buku Panduan Dosen Pembimbing dan Dewan Penguji Skripsi OBE
  (Buku_Panduan_Dosen_LaTeX/main_panduan.pdf, 32 halaman PDF); hlm. buku = PDF − 6.
- **[I]** Instruksi eksplisit di `prompt_latex.md` (prioritas tertinggi).

Prioritas: [I] > [P] > [D]. Kolom No. dirujuk dari komentar `[K-nn]` di
`unda-skripsi.cls`. Nilai yang tidak diatur sumber diberi tanda
`% TODO-KONFIRMASI:` di kode.

**Status:** Terpenuhi · TODO-KONFIRMASI · Konflik (dijelaskan) · Penyimpangan disengaja

## A. Format fisik naskah

| No | Ketentuan | Nilai/aturan | Sumber (buku, halaman, bagian) | Status di template |
|---|---|---|---|---|
| K-01 | Ukuran dan orientasi kertas | A4 (21 × 29,7 cm), potret, dicetak satu muka | [P] hlm. 160 (PDF 184), Subbab 10.2, Tabel 46 | Terpenuhi: `a4paper`, `oneside` |
| K-02 | Margin | Atas 4 cm, kiri 4 cm, bawah 3 cm, kanan 3 cm (pola 4-4-3-3) | [P] hlm. 160, Tabel 46; checklist hlm. 170 (PDF 194) | Terpenuhi: `geometry` (diukur pada render, lihat LAPORAN_AKHIR.md) |
| K-03 | Jenis dan ukuran huruf | "Times New Roman 12 pt atau huruf serif setara untuk teks isi" | [P] hlm. 160, Tabel 46; [I] wajib Latin Modern | Terpenuhi: Latin Modern 12 pt (LMRoman12) memakai opsi "huruf serif setara"; matematika Latin Modern Math, monospace LMMono. Tidak ada penyimpangan karena pedoman tidak mewajibkan Times New Roman secara mutlak |
| K-04 | Spasi | 1,5 untuk teks isi; tunggal untuk kutipan panjang, judul tabel, judul gambar, daftar pustaka | [P] hlm. 160, Tabel 46 | Terpenuhi: `\onehalfspacing`; spasi tunggal pada caption, lingkungan `kutipan`, daftar pustaka |
| K-04a | Kutipan langsung | < 40 kata dalam tanda kutip + nomor halaman; ≥ 40 kata sebagai blok tanpa tanda kutip | [P] hlm. 180 (PDF 204), Subbab 11.5.1 | Terpenuhi: lingkungan `kutipan` (blok, spasi tunggal, menjorok) |
| K-05 | Indentasi paragraf | Tidak diatur pedoman | — | TODO-KONFIRMASI: dipakai 1,25 cm |
| K-06 | Posisi nomor halaman | Tidak diatur pedoman | — | TODO-KONFIRMASI: bawah tengah semua halaman bernomor, 1,5 cm di bawah blok teks |
| K-07 | Penomoran halaman | Romawi kecil (i, ii, iii) pada bagian awal; Arab mulai halaman pertama BAB I sampai lampiran | [P] hlm. 160, Tabel 46; hlm. 176 (PDF 200), Subbab 11.2.4 | Terpenuhi: otomatis, Arab dimulai oleh `\chapter` bernomor pertama |
| K-08 | Penomoran bab dan subbab | BAB I–BAB V (Romawi); subbab desimal bertingkat sampai tiga tingkat (3.1, 3.1.1) | [P] hlm. 160, Tabel 46; hlm. 173 (PDF 197) konvensi Romawi | Terpenuhi: `secnumdepth=2` |
| K-08a | Format judul bab/subbab (ukuran, perataan, kapitalisasi) | Tidak diatur pedoman | — | TODO-KONFIRMASI: judul bab 14 pt tebal kapital rata tengah dengan pemenggalan seimbang; subbab 12 pt tebal rata kiri |
| K-08b | Penomoran tabel dan gambar | Per bab: Tabel 3.1, Gambar 2.1 | [P] hlm. 160, Tabel 46 | Terpenuhi |
| K-08c | Jumlah halaman proposal | 20–40 halaman BAB I–III di luar lampiran | [P] hlm. 160, Tabel 46 | Terpenuhi (bukan aturan tata letak; dicantumkan di README sebagai panduan isi) |

## B. Urutan dan isi bagian awal

| No | Ketentuan | Nilai/aturan | Sumber | Status di template |
|---|---|---|---|---|
| K-27 | Urutan bagian awal | Halaman judul, lembar pengesahan, pernyataan keaslian, abstrak (Indonesia dan Inggris), kata pengantar, daftar isi, daftar tabel, daftar gambar, daftar lambang | [P] hlm. 174 (PDF 198), Subbab 11.2; [I] menambah sampul luar, persetujuan, daftar lampiran | Terpenuhi: sampul → halaman judul → pengesahan → persetujuan → pernyataan keaslian → abstrak → abstract → kata pengantar → daftar isi → daftar tabel → daftar gambar → daftar lampiran → daftar lambang dan singkatan. Posisi persetujuan: TODO-KONFIRMASI |
| K-09 | Sampul luar | Tanpa nomor halaman | [I] | Terpenuhi: `\pagenumbering{alph}` tersembunyi, tidak ikut hitungan Romawi |
| K-09a | Halaman judul dalam | Termasuk bagian awal bernomor Romawi | [P] hlm. 160 (sampul dinomori Romawi) | TODO-KONFIRMASI: dihitung sebagai halaman i, nomor tidak dicetak |
| K-10 | Tata letak sampul (elemen, urutan, ukuran logo, kapitalisasi, warna) | Tidak diatur pedoman. Elemen dan urutan dari [I]: judul, "SKRIPSI", keterangan maksud, logo, nama, NPM, prodi, fakultas, universitas, kota, tahun | [I]; [D] hlm. 26 (PDF 32), BAP-07: "derajat Sarjana Komputer (S.Kom.)" | TODO-KONFIRMASI: zona tinggi tetap (judul 6,0 cm; SKRIPSI 1,6 cm; maksud 2,2 cm; logo 5,2 cm dengan lebar logo 4,0 cm; penulis 3,0 cm; sisa untuk institusi), judul kapital tebal 14 pt (turun ke 12 pt bila melebihi zona), tanpa warna/ornamen |
| K-10a | Keterangan maksud | "Diajukan untuk memenuhi salah satu syarat memperoleh gelar Sarjana Komputer" | [I]; [D] BAP-07 | Terpenuhi |
| K-11 | Lembar persetujuan pembimbing | Pembimbing menyatakan naskah telah dibaca penuh, layak diuji pada Sidang Akhir Skripsi, logbook diverifikasi | [P] hlm. 201; [I] | Terpenuhi (redaksi Sidang Akhir) |
| K-12 | Lembar pengesahan | Naskah disahkan oleh Dewan Penguji (2 orang: Ketua Penguji / Penguji I dan Anggota Penguji / Penguji II), disetujui 1 orang Dosen Pembimbing, dan disahkan oleh Ketua Program Studi | [I] Standar Prodi SI UNDA | Terpenuhi: tabel Dewan Penguji memuat 2 orang penguji, 1 pembimbing tunggal, dan Ketua Program Studi |
| K-12a | Pembimbing | Satu orang pembimbing tunggal untuk Prodi Sistem Informasi UNDA | [I] Standar Prodi SI UNDA | Terpenuhi: `\pembimbing` tunggal |
| K-13 | Pernyataan keaslian | Kepengarangan tunggal, uji kemiripan ≤ 20%, pengungkapan GenAI, wajib e-meterai Rp 10.000 | [P] hlm. 17–18; [I] | Terpenuhi: kotak alokasi e-meterai Rp 10.000 berdampingan dengan tanda tangan |
| K-25 | Abstrak | Satu paragraf: latar masalah, metode, hasil kuantitatif utama, simpulan; tanpa sitasi dan singkatan tak terdefinisi; Indonesia dan Inggris | [P] hlm. 174 dan 176 (PDF 198, 200), Subbab 11.2 dan 11.2.4 | Terpenuhi (struktur dan panduan) |
| K-25a | Batas kata abstrak | Dibatasi 200–250 kata untuk naskah skripsi versi Bahasa Indonesia dan Bahasa Inggris | [I] Ketetapan Prodi SI UNDA | Terpenuhi: contoh abstrak memuat 224 kata (ID) dan 229 kata (EN) |
| K-26 | Kata kunci | Wajib minimal 5 kata atau frasa | [I] Ketetapan Prodi SI UNDA | Terpenuhi: makro `\katakunci{}` dan `\keywords{}` dengan contoh 5 kata kunci |
| K-27a | Kata pengantar | Tidak diatur pedoman | — | TODO-KONFIRMASI: judul, isi bebas, tempat/tanggal dan nama mahasiswa |
| K-14 | Daftar lambang | Wajib bila naskah memakai lebih dari sepuluh simbol | [P] hlm. 179 (PDF 203), Subbab 11.4.1 | Terpenuhi; penggabungan dengan daftar singkatan: TODO-KONFIRMASI |
| K-27b | Daftar isi, tabel, gambar, lampiran | Daftar isi/tabel/gambar wajib; daftar lampiran dari [I]; format entri tidak diatur | [P] hlm. 174; [I] | Terpenuhi (otomatis); format entri: TODO-KONFIRMASI |

## C. Struktur dan isi wajib tiap bab

| No | Ketentuan | Nilai/aturan | Sumber | Status di template |
|---|---|---|---|---|
| K-28 | Sistematika lima BAB | BAB I Pendahuluan, II Tinjauan Pustaka, III Metode Penelitian, IV Hasil dan Pembahasan, V Penutup | [P] hlm. 174–175 (PDF 198–199), Tabel 52 | Terpenuhi: `chapters/bab1.tex`–`bab5.tex` |
| K-28a | Sub-bab BAB I | 1.1 Latar belakang, 1.2 Rumusan masalah, 1.3 Tujuan, 1.4 Batasan masalah, 1.5 Manfaat, 1.6 Sistematika penulisan; standar mutu 7 butir | [P] Tabel 52; hlm. 161–162 (PDF 185–186), Subbab 10.3 | Terpenuhi (sub-bab + `\panduan`) |
| K-28b | Sub-bab BAB II | 2.1 Landasan teori, 2.2 Penelitian terdahulu dan matriks sintesis, 2.3 Kerangka pemikiran, 2.4 Hipotesis (bila ada); minimal 15 makalah | [P] Tabel 52; hlm. 162–163 (PDF 186–187), Subbab 10.4 | Terpenuhi |
| K-28c | Sub-bab BAB III | 3.1 Desain, 3.2 Data/populasi/sampel, 3.3 Instrumen dan perangkat, 3.4 Tahapan, 3.5 Metrik dan uji statistik, 3.6 Etika dan keamanan data; diferensiasi PL1/PL2/PL3 | [P] Tabel 52; hlm. 163–165 (PDF 187–189), Subbab 10.5, Tabel 47 | Terpenuhi |
| K-28d | Sub-bab BAB IV | 4.1 Deskripsi data, 4.2 Hasil per tujuan, 4.3 Pembahasan, 4.4 Ancaman validitas; pola Assertion-Evidence | [P] Tabel 52; hlm. 174, 176, Subbab 11.2.2 | Terpenuhi |
| K-28e | Sub-bab BAB V | 5.1 Kesimpulan, 5.2 Saran; tanpa data/sitasi baru | [P] Tabel 52; hlm. 176, Subbab 11.2.3 | Terpenuhi |
| K-28f | Gantt Chart riset 16 minggu | Penutup BAB III pada naskah proposal | [P] hlm. 165 (PDF 189), Subbab 10.5.4 | Terpenuhi sebagai panduan di BAB III (template ditujukan untuk naskah skripsi akhir) |
| K-30 | Elemen OBE yang dinilai | CPMK1–CPMK5 (bobot 14/14/15/17/40); rubrik Sub-CPMK; temuan kritis | [P] hlm. ix–x, Tabel 1; hlm. 204–205 (PDF 228–229), Tabel 61; [D] hlm. 5–11 (PDF 11–17) | Terpenuhi: teks `\panduan` merujuk Sub-CPMK yang menilai bab terkait; tidak ada halaman OBE khusus di naskah karena pedoman tidak mewajibkannya |

## D. Objek dalam naskah

| No | Ketentuan | Nilai/aturan | Sumber | Status di template |
|---|---|---|---|---|
| K-15 | Judul tabel dan gambar | Judul tabel di atas, judul gambar di bawah, spasi tunggal, nomor otomatis, dirujuk di teks sebelum objek muncul | [P] hlm. 160 Tabel 46; hlm. 184 (PDF 208), Subbab 11.8 butir 1–2 | Terpenuhi; pemisah label dan ukuran huruf caption: TODO-KONFIRMASI |
| K-16 | Lebar tabel/gambar | Tidak melebihi lebar area teks; tabel lebar diringkas, dipecah, atau dipindah ke lampiran | [P] hlm. 184, Subbab 11.8 butir 4 | Terpenuhi: `tabularx`; contoh tabel landscape di Lampiran B |
| K-17 | Sumber tabel/gambar | Ditulis di bawah objek ("Sumber: olahan penulis") | [P] hlm. 184, Subbab 11.8 butir 3 | Terpenuhi: makro `\sumber{}` |
| K-17a | Keterbacaan gambar | Huruf gambar tidak lebih kecil dari huruf catatan kaki; vektor diutamakan; pembeda tidak bergantung warna | [P] hlm. 184–185, Subbab 11.8 butir 5–6 | Terpenuhi pada contoh (gambar vektor, huruf 11 pt, hitam putih) |
| K-18 | Persamaan | Dirujuk dengan nomor per bab, nomor rata kanan, persamaan rata tengah, hanya yang dirujuk diberi nomor | [P] hlm. 179 (PDF 203), Subbab 11.4.3 | Terpenuhi: (3.1), `\eqref` |
| K-22 | Bilangan desimal | Koma desimal (0,05), titik pemisah ribuan | [P] hlm. 160–161, Subbab 10.2; hlm. 179, Standar Mutu butir 4 | Terpenuhi: `icomma` untuk mode matematika |
| K-20 | Kode program | Dilarang di narasi BAB I–V; hanya di lampiran atau repositori | [P] hlm. 177–178 (PDF 201–202), Subbab 11.3; hlm. 185–186, Subbab 11.9 butir 2 | Terpenuhi: `listings` berjudul "Kode", contoh hanya di Lampiran C |
| K-21 | Algoritma/pseudocode | Prosedur panjang ditulis sebagai algoritma berlangkah bernomor dengan simbol | [P] hlm. 178, Subbab 11.3.3 butir 1; hlm. 195 (PDF 219) | Terpenuhi: lingkungan `algorithm` berjudul "Algoritma", kata kunci berbahasa Indonesia |
| K-23 | Rujukan silang | Wajib otomatis (`\label`/`\ref`) untuk Tabel, Gambar, Persamaan, BAB, lampiran; nol rujukan tak terdefinisi | [P] hlm. 183–184 (PDF 207–208), Subbab 11.7 | Terpenuhi: seluruh contoh memakai `\ref`/`\eqref`; log tanpa rujukan tak terdefinisi |
| K-19 | Lampiran | Memuat instrumen, surat izin teranonimkan, tabel hasil lengkap, kode sumber utama, log pencarian pustaka; Pernyataan Transparansi Penggunaan AI wajib | [P] hlm. 176, Subbab 11.2.4; hlm. 162, Subbab 10.4.1; hlm. 26–27 (PDF 50–51), Subbab 2.4.4 dan Tabel 6 | Terpenuhi (Lampiran A–C); pola penomoran huruf (LAMPIRAN A, Tabel A.1): TODO-KONFIRMASI |
| K-31 | Istilah asing | Dicetak miring pada kemunculan pertama dan diberi padanan | [P] hlm. 161, Subbab 10.2; hlm. 183, Subbab 11.6.2 | Terpenuhi sebagai panduan (ketentuan isi, bukan tata letak) |
| K-32 | Gaya bahasa anti-slop | Tanpa tanda pisah panjang, titik koma naratif berlebihan, kalimat generik, buzzword | [P] hlm. 182–183 (PDF 206–207), Subbab 11.6 | Terpenuhi pada teks contoh dan panduan |

## E. Sitasi dan daftar pustaka

| No | Ketentuan | Nilai/aturan | Sumber | Status di template |
|---|---|---|---|---|
| K-24 | Gaya sitasi | Pedoman: APA 7th Edition (nama-tahun, alfabetis). Instruksi: IEEE bernomor [1], [2]–[4] dengan biblatex `style=ieee` | [P] hlm. 180–182 (PDF 204–206), Subbab 11.5; [I] | Konflik (dijelaskan): IEEE diterapkan karena [I] berprioritas lebih tinggi. Pedoman Subbab 12.7.2 sendiri mengakui gaya IEEE untuk artikel jurnal |
| K-24a | Kecocokan dua arah | Setiap sitasi ada di daftar pustaka dan sebaliknya | [P] hlm. 180, Subbab 11.5; hlm. 176, Subbab 11.2.4 | Terpenuhi: biblatex hanya mencetak entri yang dikutip |
| K-24b | String bahasa Indonesia | "dkk.", "[Daring]", "Diakses", "dan", "hlm." | [I] | Terpenuhi: string didefinisikan sendiri di kelas (biblatex tidak punya `indonesian.lbx`) dan diverifikasi di PDF |
| K-24c | DOI | Ditulis sebagai tautan/identitas lengkap | [P] hlm. 180, Subbab 11.5.2 | Terpenuhi: field `doi` dicetak "doi: 10.xxxx/…" (bentuk IEEE) |
| K-24d | Spasi daftar pustaka | Tunggal | [P] hlm. 160, Tabel 46 | Terpenuhi |

## F. Bahasa, mesin, dan elemen lain dari instruksi

| No | Ketentuan | Nilai/aturan | Sumber | Status di template |
|---|---|---|---|---|
| K-29 | Bahasa | Indonesia, pemenggalan suku kata Indonesia; label otomatis berbahasa Indonesia | [I]; [P] hlm. 173, Subbab 11.1.1 (PUEBI) | Terpenuhi: `babel` indonesian (pola `hyph-id`) |
| K-33 | Mesin kompilasi | XeLaTeX | [I] | Terpenuhi: kelas menghentikan kompilasi bila bukan XeLaTeX |
| K-34 | Watermark logo | Opsi `tidak`, `sampul`, `awal`, `isi`, `semua`; opacity ≤ 0,08; posisi `tengah`, `kanan-bawah`, `kiri-atas` | [I] | Terpenuhi (eso-pic + TikZ); kebijakan pemakaian mengikuti prodi |
| K-35 | Teks panduan | Dapat dimatikan dengan satu opsi kelas | [I] | Terpenuhi: `panduan=false` |
| K-36 | Atribusi penyusun | Hanya di komentar kelas, `\ProvidesClass`, komentar `main.tex`, README; tidak di PDF | [I] | Terpenuhi (diverifikasi dengan pencarian teks PDF) |
| K-37 | Label nomor induk | [I] memakai "NPM"; blangko [D] BAP-01 s.d. BAP-07 memakai "NIM" | [I]; [D] hlm. 21–26 | Konflik (dijelaskan): bawaan "NPM" sesuai [I]; dapat diganti satu baris `\labelnomorinduk{NIM}` |
| K-38 | Gelar | "Sarjana Komputer (S.Kom.)" | [D] BAP-07; [P] hlm. 31 (PDF 55) menulis "Sarjana Sistem Informasi (S.Kom.)" | Konflik (dijelaskan): dipakai "Sarjana Komputer" sesuai [I] dan BAP-07 |
| K-39 | Nama Dekan pada lembar pengesahan | BAP-07 mencetak nama Dekan yang juga penyusun template | [D] BAP-07; [I] larangan nama penyusun di PDF | Konflik (dijelaskan): nama Dekan diisi mahasiswa di `config/identitas.tex`; template hanya memuat isian contoh |
| K-40 | Jumlah Dosen Pembimbing | Dosen pembimbing berjumlah 1 orang (pembimbing tunggal) | [I] Instruksi khusus Prodi SI UNDA | Terpenuhi: `\pembimbing` tunggal di `config/identitas.tex` dan `unda-skripsi.cls` |
| K-41 | Halaman Pernyataan Tools AI | Wajib memuat deklarasi tools AI, ruang lingkup etis, dan e-meterai Rp 10.000 | [I] Instruksi khusus Prodi SI UNDA | Terpenuhi: `frontmatter/pernyataan-ai.tex` & `\pernyataanai` |
| K-42 | Alokasi e-Meterai Rp 10.000 | Wajib pada Pernyataan Keaslian dan Pernyataan Tools AI | [I] Instruksi khusus Prodi SI UNDA | Terpenuhi: kotak penempatan e-meterai berdampingan dengan tanda tangan |
| K-43 | Lampiran Similarity Score | Rekapitulasi Turnitin (maks. 20%) dan bukti digital receipt | [I] Instruksi khusus Prodi SI UNDA | Terpenuhi: `backmatter/lampiran-d.tex` (Tabel D.1) |
| K-44 | Batas Jumlah & Akreditasi Referensi | Minimal 30 referensi, jurnal minimal SINTA 3, 5 tahun terakhir (2021--2026) | [I] Instruksi khusus Prodi SI UNDA | Terpenuhi: 36 entri terverifikasi di `references.bib` dan panduan daftar pustaka |
| K-45 | Repositori GitHub & Mendeley Data | Wajib repositori kode GitHub dan dataset Mendeley Data | [I] Instruksi khusus Prodi SI UNDA | Terpenuhi: `\tautangithub`, `\tautanmendeley` di `config/identitas.tex` dan Lampiran C |
| K-46 | Kata Kunci Abstrak | Minimal 5 kata atau frasa | [I] Instruksi khusus Prodi SI UNDA | Terpenuhi: contoh 5 kata kunci pada abstrak ID dan EN |
| K-47 | Istilah Asing pada Judul & Teks | Wajib dicetak miring (*italic*), termasuk pada judul bersampul kapital | [I] Instruksi khusus Prodi SI UNDA | Terpenuhi: `\textit` preserved dalam `\MakeUppercase`, `\istilah` |
| K-48 | Watermark Publikasi | Wajib dihidupkan setelah skripsi dinyatakan lulus dan disahkan | [I] Instruksi khusus Prodi SI UNDA | Terpenuhi: pengumuman log terminal, komentar `main.tex`, dan `README.md` |
| K-49 | Penyisipan Lembar Scan Bertanda Tangan | Didukung perintah `\sisipkanhalaman` via `pdfpages` dengan nomor romawi berurutan | [I] Instruksi khusus Prodi SI UNDA | Terpenuhi: `\sisipkanhalaman[plain]{scan/...pdf}` |
