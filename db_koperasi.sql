-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 30 Apr 2016 pada 21.05
-- Versi Server: 10.1.10-MariaDB
-- PHP Version: 7.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_koperasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(12) NOT NULL,
  `nama` varchar(24) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `simpanan_wajib` int(11) NOT NULL,
  `simpanan_pokok` int(11) NOT NULL,
  `simpanan_sukarela` int(11) NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `alamat`, `telepon`, `simpanan_wajib`, `simpanan_pokok`, `simpanan_sukarela`, `saldo`) VALUES
('0001', 'Ardhi', 'cimahi', '081322291511', 255000, 110000, -173700, 274300),
('003', 'Heru', 'Cisangkan', '0813229112', 80000, 90000, 5000, 150000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bayarcicilan`
--

CREATE TABLE `bayarcicilan` (
  `nomorbyr` varchar(12) NOT NULL,
  `tanggalbyr` date NOT NULL,
  `idkredit` varchar(12) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `sisa` int(11) NOT NULL,
  `cicilan` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `kodeptg` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bayarcicilan`
--

INSERT INTO `bayarcicilan` (`nomorbyr`, `tanggalbyr`, `idkredit`, `jumlah`, `sisa`, `cicilan`, `keterangan`, `kodeptg`) VALUES
('BY16042801', '0000-00-00', 'KR16042803', 501, 499, '1', 'Pembayaran Bulan Mei 2016', 'PTG01'),
('BY16042802', '2016-04-28', 'KR16042803', 499, 0, '2', 'Pembayaran Bulan Juni 2016', 'PTG01'),
('BY16042803', '2016-04-28', 'KR16042803', 501, 0, '3', 'kembali 501 LUNAS', 'PTG01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengambilan`
--

CREATE TABLE `pengambilan` (
  `ID_Pengambilan` varchar(12) NOT NULL,
  `tanggal` date NOT NULL,
  `id_anggota` varchar(12) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kodeptg` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengambilan`
--

INSERT INTO `pengambilan` (`ID_Pengambilan`, `tanggal`, `id_anggota`, `jumlah`, `kodeptg`) VALUES
('ABL160406001', '2016-04-06', '003', 150000, 'PTG01'),
('ABL160428001', '0000-00-00', '0001', 5000, 'PTG01'),
('ABL160428002', '0000-00-00', '0001', 200000, 'PTG01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `kodeptg` varchar(12) NOT NULL,
  `namaptg` varchar(24) NOT NULL,
  `passwordptg` varchar(24) NOT NULL,
  `statusptg` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`kodeptg`, `namaptg`, `passwordptg`, `statusptg`) VALUES
('PTG01', 'ADMIN', 'ADMIN', 'ADMINISTRATOR'),
('PTG02', 'ARDHI', 'GANTENG', 'OPERATOR'),
('PTG03', 'HERU', 'GAMAO', 'USER');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjaman`
--

CREATE TABLE `pinjaman` (
  `idkredit` varchar(12) NOT NULL,
  `tanggal` date NOT NULL,
  `id_anggota` varchar(12) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `bunga` int(11) NOT NULL,
  `lamacicilan` int(11) NOT NULL,
  `angsuranke` int(11) NOT NULL,
  `angsuran` int(11) NOT NULL,
  `telahbayar` int(11) NOT NULL,
  `sisa` int(11) NOT NULL,
  `keterangan` varchar(24) NOT NULL,
  `kodeptg` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pinjaman`
--

INSERT INTO `pinjaman` (`idkredit`, `tanggal`, `id_anggota`, `jumlah`, `bunga`, `lamacicilan`, `angsuranke`, `angsuran`, `telahbayar`, `sisa`, `keterangan`, `kodeptg`) VALUES
('KR16042801', '2016-04-28', '0001', 74300, 10, 2, 0, 0, 0, 74300, '-', 'PTG01'),
('KR16042802', '0000-00-00', '003', 50000, 10, 2, 0, 25313, 0, 50000, '-', 'PTG01'),
('KR16042803', '2016-04-28', '0001', 1000, 2, 2, 3, 501, 1501, 0, 'LUNAS', 'PTG01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `simpanan`
--

CREATE TABLE `simpanan` (
  `id_simpanan` varchar(12) NOT NULL,
  `tanggal` date NOT NULL,
  `id_anggota` varchar(12) NOT NULL,
  `jenis_simpanan` varchar(24) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kodeptg` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `simpanan`
--

INSERT INTO `simpanan` (`id_simpanan`, `tanggal`, `id_anggota`, `jenis_simpanan`, `jumlah`, `kodeptg`) VALUES
('SPN160428001', '0000-00-00', '0001', 'Wajib', 50000, 'PTG01'),
('SPN160428002', '0000-00-00', '0001', 'Pokok', 50000, 'PTG01'),
('SPN160428003', '0000-00-00', '0001', 'Suka Rela', 5000, 'PTG01'),
('SPN160428004', '0000-00-00', '0001', 'Wajib', 200000, 'PTG01'),
('SPN160428005', '0000-00-00', '0001', 'Pokok', 50000, 'PTG01'),
('SPN160428006', '0000-00-00', '0001', 'Suka Rela', 5000, 'PTG01'),
('SPN160428007', '0000-00-00', '0001', 'Suka Rela', 19300, 'PTG01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `bayarcicilan`
--
ALTER TABLE `bayarcicilan`
  ADD PRIMARY KEY (`nomorbyr`);

--
-- Indexes for table `pengambilan`
--
ALTER TABLE `pengambilan`
  ADD PRIMARY KEY (`ID_Pengambilan`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`kodeptg`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`idkredit`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD PRIMARY KEY (`id_simpanan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
