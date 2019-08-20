-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Agu 2019 pada 10.39
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_cucian`
--

CREATE TABLE `tb_cucian` (
  `id` int(11) NOT NULL,
  `kd_cucian` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `ukuran` enum('Kecil','Sedang','Besar') NOT NULL,
  `harga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_cucian`
--

INSERT INTO `tb_cucian` (`id`, `kd_cucian`, `jenis`, `ukuran`, `harga`) VALUES
(2, 'C-001', 'Selimut Tipis', 'Kecil', '4000'),
(3, 'C-002', 'Selimut Tipis', 'Sedang', '5000'),
(4, 'C-003', 'Selimut Tipis', 'Besar', '7000'),
(5, 'C-004', 'Selimut Tebal', 'Kecil', '7500'),
(6, 'C-005', 'Selimut Tebal', 'Sedang', '8500'),
(7, 'C-006', 'Selimut Tebal', 'Besar', '10000'),
(8, 'C-007', 'Bed Cover', 'Kecil', '12000'),
(9, 'C-008', 'Bed Cover', 'Sedang', '20000'),
(10, 'C-009', 'Bed Cover', 'Besar', '27000'),
(11, 'C-010', 'Sprei', 'Kecil', '5000'),
(12, 'C-011', 'Sprei', 'Sedang', '6000'),
(13, 'C-012', 'Sprei', 'Besar', '7000'),
(14, 'C-013', 'Boneka', 'Kecil', '10000'),
(15, 'C-014', 'Boneka', 'Sedang', '15000'),
(16, 'C-015', 'Boneka', 'Besar', '30000'),
(17, 'C-016', 'Jaket Tipis', 'Kecil', '9000'),
(18, 'C-017', 'Jaket Tebal', 'Besar', '12000'),
(19, 'C-018', 'Jamper', 'Kecil', '6000'),
(20, 'C-019', 'Jamper', 'Besar', '7000'),
(21, 'C-020', 'Sepatu Dewasa', 'Kecil', '25000'),
(22, 'C-021', 'Sepatu Anak Tanggung', 'Kecil', '20000'),
(23, 'C-022', 'Sepatu Balita', 'Kecil', '15000'),
(24, 'C-023', 'Tas Biasa', 'Besar', '25000'),
(25, 'C-024', 'Tas Tanggung', 'Sedang', '15000'),
(26, 'C-025', 'Tas Kecil', 'Kecil', '10000'),
(27, 'C-026', 'Jas satu set', 'Besar', '20000'),
(28, 'C-027', 'Jas saja dan Rompi', 'Besar', '15000'),
(29, 'C-028', 'Karpet Tebal', 'Besar', '8000'),
(30, 'C-029', 'Karpet Tipis', 'Besar', '7000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id` int(11) NOT NULL,
  `kd_paket` varchar(20) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `harga` varchar(11) NOT NULL,
  `jangka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_paket`
--

INSERT INTO `tb_paket` (`id`, `kd_paket`, `jenis`, `harga`, `jangka`) VALUES
(1, 'PA-001', 'Cuci Basah', '2000', 2),
(2, 'PA-002', 'Setrika', '3500', 2),
(5, 'PA-005', 'Cuci Kering', '3500', 2),
(8, 'PA-008', 'Cuci Setrika', '5000', 2),
(12, 'PA-009', 'Quick ', '10000', 4),
(13, 'PA-010', 'Express', '8500', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penerimaan`
--

CREATE TABLE `tb_penerimaan` (
  `id` int(11) NOT NULL,
  `kd_penerimaan` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `total` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL,
  `status_bayar` enum('Lunas','Belum Lunas') DEFAULT 'Belum Lunas',
  `status_proses` enum('Proses','Selesai') NOT NULL DEFAULT 'Proses',
  `pengerjaan` enum('Diambil','Diantar') NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `jenis` varchar(15) NOT NULL,
  `berat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_penerimaan`
--

INSERT INTO `tb_penerimaan` (`id`, `kd_penerimaan`, `nama`, `tgl_masuk`, `tgl_keluar`, `total`, `bayar`, `status_bayar`, `status_proses`, `pengerjaan`, `keterangan`, `jenis`, `berat`) VALUES
(1, 'T-001', 'M-001', '2019-08-18', '2019-08-19', '12000', '12000', 'Lunas', 'Proses', 'Diambil', 'wqeqewq', 'C-001', '3'),
(2, 'T-002', 'M-001', '2019-08-18', '2019-08-19', '21000', '25000', 'Lunas', 'Proses', 'Diantar', 'erqqeqweq', 'C-003', '3'),
(5, 'T-003', 'M-001', '2019-08-18', '2019-08-20', '10500', '15000', 'Lunas', 'Proses', 'Diambil', 'wewe', 'PA-002', '3'),
(6, 'T-004', 'M-002', '2019-08-18', '2019-08-19', '140000', '150000', 'Lunas', 'Proses', 'Diantar', 'Jangan Luntur', 'C-008', '7');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `kd_user` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `foto` varchar(25) NOT NULL,
  `level` enum('Admin','Owner','Member') NOT NULL,
  `jenis` enum('Owner','Member','Non Member') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `kd_user`, `nama`, `alamat`, `telp`, `username`, `password`, `foto`, `level`, `jenis`) VALUES
(1, 'A-001', 'Admin Laundry', 'Purwokerto', '081390469322', 'admin', '12345678', 'admin.jpg', 'Admin', 'Owner'),
(3, 'O-001', 'Owner Laundry New', 'Purwokerto', '081390469311', 'OwnerLaundry', '12345678', '14082019140647indra.jpg', 'Owner', 'Owner'),
(10, 'M-001', 'Dies Grestiana Sari', 'Sidabowa', '081390469311', 'DiesGrestiana', '12345678', 'indra.jpg', 'Member', 'Member'),
(12, 'M-002', 'Rully Kusuma', 'Desa Ledug No. 55 Purwokerto', '089777888999', 'Rully Kusuma', '12345678', 'user4-128x128.jpg', 'Member', 'Member');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_cucian`
--
ALTER TABLE `tb_cucian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_penerimaan`
--
ALTER TABLE `tb_penerimaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_user` (`kd_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_cucian`
--
ALTER TABLE `tb_cucian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_penerimaan`
--
ALTER TABLE `tb_penerimaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
