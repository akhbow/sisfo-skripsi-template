# Folder Berkas Scan (Tanda Tangan & e-Meterai)

Tempatkan berkas PDF hasil scan atau berkas elektronik bertanda tangan dan bermeterai di folder ini, misalnya:
- `lembar-pengesahan-signed.pdf`
- `lembar-persetujuan-signed.pdf`
- `pernyataan-keaslian-signed.pdf`
- `pernyataan-ai-signed.pdf`
- `turnitin-receipt.pdf`

Cara menggunakannya pada naskah skripsi:
Buka berkas `.tex` terkait di folder `frontmatter/`, lalu aktifkan perintah:
```latex
\sisipkanhalaman[plain]{scan/nama-berkas.pdf}
```
Perintah ini akan menyisipkan halaman scan tersebut dengan tetap mempertahankan nomor halaman Romawi kecil yang berurutan dan rapi.
