# Template LaTeX Skripsi S1 Sistem Informasi UNDA

Template naskah skripsi Program Studi S1 Sistem Informasi, Fakultas Ilmu
Komputer, Universitas Darwan Ali (UNDA). Format dan struktur mengikuti *Buku
Pedoman & Standar Riset Skripsi Sistem Informasi* (kurikulum OBE) dan *Buku
Panduan Dosen Pembimbing dan Dewan Penguji Skripsi OBE*. Rincian setiap
ketentuan beserta sumbernya ada di [`KETENTUAN.md`](KETENTUAN.md).

Anda cukup mengisi identitas dan isi bab. Seluruh tata letak (margin, huruf, spasi,
penomoran, sampul, daftar isi, daftar pustaka) diatur secara otomatis oleh kelas
`unda-skripsi.cls`.

---

## Ketentuan Khusus Prodi Sistem Informasi UNDA

1. **Dosen Pembimbing:** Di Prodi Sistem Informasi UNDA, dosen pembimbing naskah skripsi adalah **1 orang** (pembimbing tunggal).
2. **Dewan Penguji Sidang Akhir:** Standar naskah skripsi final memuat **2 orang penguji**: Ketua Penguji (Penguji I) dan Anggota Penguji (Penguji II). Pengesahan naskah skripsi final disahkan oleh **Ketua Program Studi** (bukan Dekan).
3. **Kewajiban e-Meterai Rp 10.000:** Ada **dua bagian** yang WAJIB dibubuhi e-meterai Rp 10.000 dan tanda tangan mahasiswa:
   - **Halaman Pernyataan Keaslian Skripsi** (`frontmatter/pernyataan.tex`)
   - **Halaman Pernyataan Penggunaan Tools AI** (`frontmatter/pernyataan-ai.tex`)
4. **Batas Kata Abstrak:** Abstrak skripsi dibatasi **200--250 kata** (baik versi Bahasa Indonesia maupun Bahasa Inggris), ditulis dalam 1 paragraf utuh.
5. **Kata Kunci Abstrak:** Kata kunci pada Abstrak (Indonesia) dan Abstract (Inggris) wajib **minimal 5 kata atau frasa**.
6. **Penulisan Nama di Sampul:** Nama mahasiswa pada sampul luar dan halaman judul dalam otomatis dicetak menggunakan **huruf kapital semua (UPPERCASE)**.
7. **Daftar Pustaka Rata Kanan-Kiri:** Seluruh butir rujukan pada Daftar Pustaka wajib dicetak **rata kanan-kiri (justified)**.
8. **Standar Referensi:**
   - Jumlah referensi di Daftar Pustaka **minimal 30 buah**.
   - Artikel jurnal nasional wajib **minimal terakreditasi SINTA 3** (SINTA 1, 2, atau 3) atau jurnal internasional bereputasi (Scopus/WoS).
   - Seluruh rujukan wajib **mutakhir (5 tahun terakhir, yaitu 2021--2026)**, kecuali karya klasik/seminal yang mendasari teori utama (misalnya Hevner 2004, Brooke 1996).
9. **Istilah Asing Wajib Miring (*Italic*):** Seluruh istilah asing wajib dicetak miring dengan `\textit{...}` atau `\istilah{...}`, **termasuk jika berada di dalam Judul Skripsi**. Template secara otomatis mempertahankan cetak miring saat judul dikonversi menjadi huruf kapital pada sampul luar.
10. **Kode Sumber & Data Penelitian:** Kode sumber utama wajib diunggah ke repositori **GitHub**, dan dataset atau artefak penelitian diunggah ke repositori data resmi (**Mendeley Data** / Zenodo). Tautan keduanya dicantumkan pada Lampiran C.
11. **Uji Similaritas (Similarity Score):** Naskah wajib melalui uji similaritas resmi (Turnitin / iThenticate) dengan indeks kesamaan maksimal **20\%**. Rekapitulasi dan bukti digital receipt Turnitin dilampirkan pada **Lampiran D**.
12. **Aktivasi Watermark Resmi:** Jika naskah skripsi **telah dinyatakan LULUS Sidang Akhir dan mendapatkan pengesahan resmi**, opsi watermark **WAJIB dihidupkan** untuk publikasi/arsip digital di repositori:
   ```latex
   \documentclass[watermark=isi,panduan=false]{unda-skripsi}
   % atau
   \documentclass[watermark=semua,panduan=false]{unda-skripsi}
   ```

---

## Isi Folder

```
main.tex                 berkas utama: opsi kelas dan urutan berkas
unda-skripsi.cls         seluruh format dokumen (jangan diubah)
config/identitas.tex     judul, nama, NPM, pembimbing, penguji, kaprodi, tanggal, repositori
frontmatter/             sampul, halaman judul, pengesahan, persetujuan,
                         pernyataan keaslian (e-meterai), pernyataan tools AI (e-meterai),
                         abstrak, abstract, kata pengantar, daftar-daftar
chapters/bab1.tex ...    BAB I sampai BAB V
backmatter/              daftar pustaka dan lampiran A, B, C (kode/repositori), D (similarity)
references.bib           basis data referensi (BibLaTeX, format IEEE, >= 30 entri)
figures/                 logo universitas dan gambar naskah
verifikasi/              bukti render visual dokumen hasil uji (150 DPI)
KETENTUAN.md             matriks ketentuan pedoman dan status keterpenuhan
LICENSE                  lisensi LPPL 1.3c dan 3 klausul pengecualiannya
```

---

## Tata Cara Menyisipkan Lembar Scan Tanda Tangan & e-Meterai

Karena lembar pengesahan, persetujuan, pernyataan keaslian, dan pernyataan tools AI akan dibubuhi tanda tangan fisik/elektronik serta e-meterai secara terpisah dari naskah, mahasiswa dapat menyisipkan berkas PDF hasil scan tersebut ke dalam naskah skripsi utuh tanpa merusak penomoran halaman Romawi.

Caranya sangat mudah:
1. Simpan berkas PDF lembar yang sudah bertanda tangan dan/atau bermeterai (1 halaman PDF) di folder proyek (misalnya buat subfolder `scan/`):
   - `scan/lembar-pengesahan-signed.pdf`
   - `scan/lembar-persetujuan-signed.pdf`
   - `scan/pernyataan-keaslian-signed.pdf`
   - `scan/pernyataan-ai-signed.pdf`
2. Buka berkas `.tex` yang bersangkutan di `frontmatter/`:
   - Beri tanda komentar (`%`) pada perintah lembar otomatis bawaan LaTeX.
   - Buka tanda komentar pada perintah `\sisipkanhalaman`:
   ```latex
   % \lembarpengesahan
   \sisipkanhalaman[plain]{scan/lembar-pengesahan-signed.pdf}
   ```
3. Opsi `[plain]` akan otomatis mencantumkan nomor halaman Romawi kecil (misal: iii, iv, v) di bagian bawah tengah halaman secara presisi sehingga urutan halaman naskah tetap utuh dan sempurna.
   *(Jika berkas scan PDF Anda sudah memiliki nomor halaman cetak sendiri, gunakan opsi `[empty]` agar tidak terjadi nomor halaman ganda).*

---

## Kompilasi

Template **wajib** dikompilasi dengan **XeLaTeX** dan **biber**.

### Di Komputer Sendiri (Linux / macOS / Windows)

1. Pasang TeX Live (2023 atau lebih baru) lengkap. Di Fedora:
   ```bash
   sudo dnf install texlive-scheme-full
   ```
   Di Ubuntu/Debian:
   ```bash
   sudo apt install texlive-full
   ```
2. Jalankan perintah kompilasi:
   ```bash
   latexmk -xelatex main.tex
   ```
   Atau secara manual:
   ```bash
   xelatex main.tex
   biber main
   xelatex main.tex
   xelatex main.tex
   ```

### Di Overleaf

1. Unggah seluruh isi folder proyek ke proyek Overleaf baru.
2. Buka menu **Menu** (ikon di kiri atas editor Overleaf).
3. Pada opsi **Compiler**, ubah dari `pdfLaTeX` menjadi **`XeLaTeX`**.
4. Klik **Recompile**.

---

## Opsi Kelas Dokumen

Opsi diatur pada baris pertama `main.tex`:
```latex
\documentclass[watermark=tidak,panduan=true]{unda-skripsi}
```

- **`watermark`**:
  - `tidak` (bawaan selama penyusunan): tanpa watermark.
  - `sampul`: watermark logo UNDA hanya di sampul luar.
  - `awal`: watermark di bagian halaman romawi awal.
  - `isi`: watermark di seluruh bab isi dan lampiran.
  - `semua`: watermark di seluruh halaman naskah (kecuali sampul).
  *(Wajib diaktifkan sebagai `isi` atau `semua` setelah skripsi disahkan).*
- **`panduan`**:
  - `true`: menampilkan kotak panduan penulisan di setiap bab.
  - `false`: menyembunyikan seluruh kotak panduan saat naskah siap dicetak/diuji.

---

## Tentang Template

- **Penyusun:** Dr. Dwi Wahyu Prabowo, S.Si., M.Eng.
- **Program Studi:** S1 Sistem Informasi, Fakultas Ilmu Komputer, Universitas Darwan Ali
- **Versi:** 1.1 (26 November 2026)
- **Maintainer:** Dr. Dwi Wahyu Prabowo, S.Si., M.Eng.

### Riwayat Perubahan

| Versi | Tanggal | Perubahan |
|---|---|---|
| 1.0 | 2026-11-26 | Rilis perdana sesuai Buku Pedoman Riset Skripsi OBE dan Buku Panduan Dosen/Penguji. |
| 1.1 | 2026-11-26 | Pembaruan standar prodi: pembimbing tunggal (1 orang), penambahan Halaman Pernyataan Penggunaan Tools AI (dengan alokasi e-meterai Rp 10.000), penambahan kotak e-meterai pada Pernyataan Keaslian, Lampiran D (Similarity Score Turnitin), perluasan Daftar Pustaka minimal 30 entri (standar SINTA 3 & 5 tahun terakhir), dukungan repositori GitHub & Mendeley Data pada Lampiran C, perintah `\sisipkanhalaman` untuk scan lembar bertanda tangan, proteksi margin ketat (`\emergencystretch 3em`), pelestarian cetak miring (*italic*) pada istilah asing di judul, dan pengumuman wajib watermark publikasi. |

### Lisensi

Template ini dirilis di bawah lisensi **LaTeX Project Public License (LPPL) versi 1.3c** atau yang lebih baru, dengan hak cipta dipegang oleh Dr. Dwi Wahyu Prabowo, S.Si., M.Eng. Teks lengkap lisensi tersedia di berkas [`LICENSE`](LICENSE).
Pengecualian: Karya skripsi mahasiswa tetap milik mahasiswa sepenuhnya, logo Universitas Darwan Ali adalah hak cipta universitas, dan data referensi adalah metadata bibliografi pihak ketiga.
