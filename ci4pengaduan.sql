-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2024 at 08:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci4pengaduan`
--

-- --------------------------------------------------------

--
-- Table structure for table `foto_pengaduan`
--

CREATE TABLE `foto_pengaduan` (
  `id` int(11) UNSIGNED NOT NULL,
  `pengaduan_id` int(11) UNSIGNED NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `nik` char(17) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masyarakat`
--

INSERT INTO `masyarakat` (`id`, `user_id`, `nik`, `nama`, `no_telp`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, '111111', 'jihan padang', '908790', 'jl.amal', '2024-09-12 09:27:46', '2024-09-12 09:27:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(2, '2024-09-11-014037', 'App\\Database\\Migrations\\Pengaduan', 'default', 'App', 1726031685, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `tgl_pengaduan` date DEFAULT NULL,
  `isi_laporan` text NOT NULL,
  `status` enum('0','proses','selesai') NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id`, `user_id`, `tgl_pengaduan`, `isi_laporan`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-09-18', 'ASFDfzdf', 'proses', '2024-09-12 05:13:28', '2024-09-12 11:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id` int(11) UNSIGNED NOT NULL,
  `pengaduan_id` int(11) UNSIGNED NOT NULL,
  `tgl_tanggapan` date DEFAULT NULL,
  `tanggapan` text NOT NULL,
  `petugas_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('petugas','admin','masyarakat') NOT NULL DEFAULT 'masyarakat',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'jihan padanggg', 'jihanpadang123@gmail.com', '$2y$10$QJhP36q3Lwjxn1lnNONQM.VE0HGL4rmHE4KQngV7gjtUl6DEVCisi', 'masyarakat', '2024-09-12 09:27:46', '2024-09-12 09:27:46'),
(2, 'zati&jihan', 'tihan@gmail.com', '$2y$10$IwNfiXYfeC0fD/TQq/McUun9R0S0kQQX9xLMlucJa8fcslItYP3Bu', 'masyarakat', '2024-09-12 09:30:05', '2024-09-12 09:30:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foto_pengaduan`
--
ALTER TABLE `foto_pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foto_pengaduan_pengaduan_id_foreign` (`pengaduan_id`);

--
-- Indexes for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `masyarakat_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tanggapan_pengaduan_id_foreign` (`pengaduan_id`),
  ADD KEY `tanggapan_petugas_id_foreign` (`petugas_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foto_pengaduan`
--
ALTER TABLE `foto_pengaduan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `masyarakat`
--
ALTER TABLE `masyarakat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foto_pengaduan`
--
ALTER TABLE `foto_pengaduan`
  ADD CONSTRAINT `foto_pengaduan_pengaduan_id_foreign` FOREIGN KEY (`pengaduan_id`) REFERENCES `pengaduan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD CONSTRAINT `masyarakat_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_pengaduan_id_foreign` FOREIGN KEY (`pengaduan_id`) REFERENCES `pengaduan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tanggapan_petugas_id_foreign` FOREIGN KEY (`petugas_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
