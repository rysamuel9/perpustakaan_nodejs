-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Agu 2020 pada 16.58
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_library`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `isbn` char(13) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `year` varchar(4) NOT NULL,
  `author` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `isbn`, `name`, `category_id`, `year`, `author`, `description`) VALUES
(1, '4031231332110', 'Belajar Pemrograman Node JS', 1, '2019', 'Budawarman', 'Buku ini adalah Belajar Pemrograman Node JS'),
(2, '4031231332111', 'Algoritma dan Pemrograman', 1, '2016', 'Bani Junian', 'Buku ini adalah Algoritma dan Pemrograman'),
(3, '4031231332112', 'Komunikasi Data', 2, '2017', 'Okta Yudayana', 'Buku ini adalah Komunikasi Data'),
(4, '4031231332113', 'Ensiklopedia Dunia', 5, '2018', 'Ujang Nurmaman', 'Buku ini adalah Ensiklopedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `subcategory` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `subcategory`) VALUES
(1, 'Umum', 'Publikasi Umum'),
(2, 'Umum', 'Informasi Umum dan Komputer'),
(3, 'Umum', 'Bibiliografi'),
(4, 'Umum', 'Perpustakaan dan Informasi'),
(5, 'Umum', 'Ensiklopedia'),
(6, 'Umum', 'Majalah dan Jurnal'),
(7, 'Umum', 'Asosiasi, Organisasi dan Museum'),
(8, 'Umum', 'Media Massa, Jurnalisme dan Publikasi'),
(9, 'Umum', 'Kutipan'),
(10, 'Umum', 'Manuskrip dan Buku Langka'),
(11, 'Filsafat dan Psikologi', 'Filsafat dan Psikologi'),
(12, 'Filsafat dan Psikologi', 'Metafisika'),
(13, 'Filsafat dan Psikologi', 'Epistimologi'),
(14, 'Filsafat dan Psikologi', 'Parapsikologi dan Okultisme'),
(15, 'Filsafat dan Psikologi', 'Pemikiran Filosofis'),
(16, 'Filsafat dan Psikologi', 'Psikologi'),
(17, 'Filsafat dan Psikologi', 'Filosofis Logis'),
(18, 'Filsafat dan Psikologi', 'Etik'),
(19, 'Filsafat dan Psikologi', 'Filosofis Kuno, Zaman Pertengahan dan Filosofi Ketimuran'),
(20, 'Filsafat dan Psikologi', 'Filosofis Barat Modern'),
(21, 'Agama', 'Agama'),
(22, 'Sosial', 'Ilmu Sosial, Sosiologi dan Antropologi'),
(23, 'Sosial', 'Statistik'),
(24, 'Sosial', 'Ilmu Politik'),
(25, 'Sosial', 'Ekonomi'),
(26, 'Sosial', 'Hukum'),
(27, 'Sosial', 'Administrasi Publik dan Ilmu Kemiliteran'),
(28, 'Sosial', 'Masalah dan Layanan Sosial'),
(29, 'Sosial', 'Pendidikan'),
(30, 'Sosial', 'Perdagangan, Komunikasi dan Transportasi'),
(31, 'Sosial', 'Norma, Etika dan Tradisi'),
(32, 'Bahasa', 'Bahasa'),
(33, 'Sains dan Matematika', 'Sains'),
(34, 'Sains dan Matematika', 'Matematika'),
(35, 'Sains dan Matematika', 'Astronomi'),
(36, 'Sains dan Matematika', 'Fisika'),
(37, 'Sains dan Matematika', 'Kimia'),
(38, 'Sains dan Matematika', 'Ilmu Kebumian dan Geologi'),
(39, 'Sains dan Matematika', 'Fosil dan Kehidupan Prasejarah'),
(40, 'Sains dan Matematika', 'Biologi'),
(41, 'Sains dan Matematika', 'Tanaman'),
(42, 'Sains dan Matematika', 'Zoologi'),
(43, 'Teknologi', 'Teknologi'),
(44, 'Teknologi', 'Kesehatan dan Obat-Obatan'),
(45, 'Teknologi', 'Teknik'),
(46, 'Teknologi', 'Pertanian'),
(47, 'Teknologi', 'Manajemen Rumah Tangga dan Keluarga'),
(48, 'Teknologi', 'Manajemen dan Hubungan dengan Publik'),
(49, 'Teknologi', 'Teknik Kimia'),
(50, 'Teknologi', 'Manufaktur'),
(51, 'Teknologi', 'Manufaktur untuk Keperluan Khusus'),
(52, 'Teknologi', 'Konstruksi'),
(53, 'Seni dan Rekreasi', 'Kesenian dan Rekreasi'),
(54, 'Seni dan Rekreasi', 'Perencanaan dan Arsitektur Lanskap'),
(55, 'Seni dan Rekreasi', 'Arsitektur'),
(56, 'Seni dan Rekreasi', 'Patung, Keramik dan Seni Metal'),
(57, 'Seni dan Rekreasi', 'Seni Grafis dan Dekoratif'),
(58, 'Seni dan Rekreasi', 'Lukisan'),
(59, 'Seni dan Rekreasi', 'Percetakan'),
(60, 'Seni dan Rekreasi', 'Fotografi, Film, dan Video'),
(61, 'Seni dan Rekreasi', 'Musik'),
(62, 'Seni dan Rekreasi', 'Olahraga, Permainan dan Hiburan'),
(63, 'Literatur dan Sastra', 'Literatur, Sastra, Retorika dan Kritik'),
(64, 'Sejarah dan Geografi', 'Sejarah'),
(65, 'Sejarah dan Geografi', 'Geografi dan Perjalanan'),
(66, 'Sejarah dan Geografi', 'Biografi dan Asal-Usul'),
(67, 'Sejarah dan Geografi', 'Sejarah Dunia Lama'),
(68, 'Sejarah dan Geografi', 'Asal-Usul Eropa'),
(69, 'Sejarah dan Geografi', 'Asal-Usul Asia'),
(70, 'Sejarah dan Geografi', 'Asal-Usul Afrika'),
(71, 'Sejarah dan Geografi', 'Asal-Usul Amerika Utara'),
(72, 'Sejarah dan Geografi', 'Asal-Usul Amerika Selatan'),
(73, 'Sejarah dan Geografi', 'Asal-Usul Wilayah Lain'),
(76, 'Sejarah dan Geografi', 'Asal-Usul Australia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `book_id` int(11) NOT NULL,
  `borrow_duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `members`
--

INSERT INTO `members` (`id`, `name`, `email`, `book_id`, `borrow_duration`) VALUES
(1, 'Adi Laksana', 'adi.laksana@gmail.com', 1, 5),
(2, 'Bagas Wongsono', 'bagasw@gmail.com', 2, 4),
(3, 'Nanu Nugraha', 'nanurah@gmail.com', 3, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Rizki Ramadhan', 'rizkiradhan25@gmail.com', '$2a$08$I773hvoc.OsjyG0XnaULKOePoVAR3Q1CTXgogeQUuVjCu9r7V6VR6'),
(3, 'Fauzi Nugraha', 'fauzi.nug@gmail.com', '$2a$08$td2F2clP4HCPWIj.Y8sa0eXAv6PAoawKIBl.bLlSAOiddHId2jk0m');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT untuk tabel `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
