# Rimbun

Rimbun adalah aplikasi mobile berbasis Flutter untuk mengenal berbagai tanaman hias beserta cara dasar merawatnya. Pengguna dapat melihat koleksi tanaman, mencari berdasarkan nama, memfilter berdasarkan kategori, membaca informasi perawatan, dan menyimpan tanaman favorit.

Aplikasi ini dibuat sebagai project Ujian Tengah Semester (UTS) dengan konsep **single screen**: seluruh fitur berada di satu halaman utama tanpa navigasi antarhalaman. Data tanaman menggunakan data dummy lokal, tanpa API maupun database.

## Data Mahasiswa

> [!IMPORTANT]
> | Keterangan | Data |
> |---|---|
> | **Mata Kuliah** | Pemograman Mobile 2 |
> | **Nama** | Fitri Wulandari |
> | **NIM** | 25552012009 |
> | **Kelas** | TIF K-24B |

## Download APK

> [!TIP]
> **[Download Rimbun APK](apk/rimbun.apk)**
>
> Cara memasang di perangkat Android:
> 1. Unduh file [`rimbun.apk`](apk/rimbun.apk).
> 2. Buka file tersebut di perangkat Android.
> 3. Jika muncul peringatan, izinkan instalasi dari sumber tidak dikenal untuk aplikasi yang digunakan membuka file.
> 4. Tekan **Install**, lalu buka aplikasi **Rimbun**.
>
> Minimal Android 7.0 (API 24).

## Fitur

| Fitur | Keterangan |
|---|---|
| Koleksi Tanaman | Menampilkan daftar tanaman dalam bentuk grid berisi gambar, nama, kategori, dan tingkat perawatan. |
| Pencarian | Mencari tanaman berdasarkan nama. Pencarian tidak membedakan huruf besar dan kecil. |
| Filter Kategori | Memfilter tanaman berdasarkan kategori: Semua, Dalam Ruangan, Luar Ruangan, Sukulen, dan Berbunga. |
| Tanaman Unggulan | Menampilkan satu tanaman pilihan dalam banner di bagian atas halaman. |
| Detail Tanaman | Menampilkan deskripsi, kebutuhan penyiraman, kebutuhan cahaya, dan tingkat perawatan dalam bottom sheet. |
| Favorit | Menambah dan menghapus tanaman favorit dengan menekan ikon hati. |
| Daftar Favorit | Tombol di header menampilkan jumlah favorit dan membuka daftar tanaman favorit. |
| Empty State | Menampilkan pesan ketika hasil pencarian atau filter tidak ditemukan. |

Data favorit hanya disimpan selama aplikasi berjalan dan akan kembali kosong saat aplikasi ditutup.

## Alur Penggunaan

1. Pengguna membuka aplikasi dan melihat halaman utama berisi header, kolom pencarian, filter kategori, tanaman unggulan, dan koleksi tanaman.
2. Pengguna mengetik nama tanaman pada kolom pencarian. Koleksi tanaman langsung diperbarui sesuai kata kunci.
3. Pengguna memilih kategori pada filter. Kategori aktif ditandai dengan warna berbeda, dan koleksi tanaman hanya menampilkan tanaman pada kategori tersebut.
4. Pencarian dan filter dapat digabung. Jika tidak ada tanaman yang cocok, aplikasi menampilkan pesan "Tanaman tidak ditemukan".
5. Pengguna menekan kartu tanaman atau tombol "Lihat Info" pada tanaman unggulan untuk membuka detail tanaman.
6. Pada detail tanaman, pengguna dapat membaca informasi perawatan, menandai tanaman sebagai favorit, lalu menutup detail dengan tombol "Tutup" atau dengan menggeser sheet ke bawah.
7. Pengguna menekan ikon hati pada kartu tanaman untuk menambah atau menghapus favorit. Jumlah favorit pada tombol di header langsung berubah.
8. Pengguna menekan tombol favorit di header untuk melihat daftar tanaman favorit. Dari daftar ini, pengguna dapat membuka detail tanaman atau menghapusnya dari favorit.

## Teknologi

| Item | Keterangan |
|---|---|
| Framework | Flutter 3.50 |
| Bahasa | Dart 3.14 |
| State Management | Provider (ChangeNotifier) |
| UI | material_ui |
| Font | Poppins (disimpan lokal di `assets/fonts`) |
| Platform | Android |

## Struktur Folder

```text
rimbun/
├── assets/
│   ├── fonts/          # Font Poppins
│   └── images/         # Gambar tanaman
├── lib/
│   ├── main.dart       # Entry point aplikasi
│   ├── app.dart        # MaterialApp dan registrasi Provider
│   ├── core/theme/     # Warna dan tema aplikasi
│   ├── models/         # Model data Plant
│   ├── data/           # Data dummy tanaman dan kategori
│   ├── providers/      # State pencarian, filter, dan favorit
│   ├── screens/        # Halaman utama
│   └── widgets/        # Komponen UI yang dapat digunakan ulang
├── test/               # Unit test dan widget test
└── pubspec.yaml
```

## Instalasi dan Menjalankan di Lokal

### Prasyarat

- Flutter SDK versi 3.47 atau lebih baru. Project ini dikembangkan dengan Flutter 3.50.
- Android Studio beserta Android SDK.
- Emulator Android atau perangkat Android dengan USB debugging aktif.
- Git.

Pastikan Flutter terpasang dengan benar:

```bash
flutter doctor
```

Bagian **Flutter** dan **Android toolchain** harus bertanda centang.

### Langkah Instalasi

1. Clone repository dan masuk ke folder project.

   ```bash
   git clone <url-repository>
   cd rimbun
   ```

2. Unduh dependency.

   ```bash
   flutter pub get
   ```

3. Jalankan emulator Android atau sambungkan perangkat Android, lalu pastikan perangkat terdeteksi.

   ```bash
   flutter devices
   ```

4. Jalankan aplikasi.

   ```bash
   flutter run
   ```

   Jika ada lebih dari satu perangkat, pilih perangkat tertentu dengan:

   ```bash
   flutter run -d <device-id>
   ```

### Menjalankan Test

```bash
flutter test
```

### Build APK

```bash
flutter build apk --release
```

File APK tersedia di `build/app/outputs/flutter-apk/app-release.apk`.

### Kendala Umum

| Masalah | Solusi |
|---|---|
| Gambar atau font tidak muncul setelah mengubah asset | Hentikan aplikasi lalu jalankan ulang `flutter run`. Hot reload tidak memuat asset baru. |
| Error `material_ui` tidak ditemukan | Versi Flutter terlalu lama. Perbarui dengan `flutter upgrade`. |
| Perangkat tidak terdeteksi | Jalankan `flutter doctor` dan pastikan USB debugging aktif atau emulator sudah berjalan. |

## Kredit

- Gambar tanaman: [Magnific](https://www.magnific.com).
- Font: [Poppins](https://fonts.google.com/specimen/Poppins) oleh Indian Type Foundry, lisensi SIL Open Font License.
