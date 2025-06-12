-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2025 at 12:27 PM
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
-- Database: `binuslite`
--

-- --------------------------------------------------------

--
-- Table structure for table `forumpost`
--

CREATE TABLE `forumpost` (
  `post_id` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `voteCount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `faculty` varchar(100) NOT NULL,
  `title` varchar(10) NOT NULL,
  `overview` varchar(1500) DEFAULT NULL,
  `career` varchar(500) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `videoLink` varchar(500) DEFAULT NULL,
  `catalogueLink` varchar(500) DEFAULT NULL,
  `foundedYear` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `isWatched` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`id`, `name`, `faculty`, `title`, `overview`, `career`, `region`, `videoLink`, `catalogueLink`, `foundedYear`, `duration`, `isWatched`) VALUES
(1, 'Accounting', 'School of Accounting', 'S.Ak.', 'Program Accounting BINUS UNIVERSITY dirancang untuk memudahkan kamu mempelajari hal hal yang berkaitan dengan laporan keuangan, kebijakan keuangan, laporan kinerja perusahaan, pemeriksaan laporan keuangan, laporan pertanggungan jawaban kepada stakeholder, pengambilan keputusan bisnis, serta pengelolaan dan analitik data keuangan (Accounting Data Analytics) termasuk juga penerapan prinsip akuntansi dan profesi akuntan. Dengan mempelajari program ini kamu bisa berkarir sebagai akuntan, auditor, management accountant, business analyst, data navigator, fraud investigator, tax accountant maupun tax officer.', 'Management Accountant, Auditor (External Auditor, Internal Auditor, Forensic Auditor, and Information System Auditor), Financial Controller and Analyst, Financial Planner, Business & System Analyst, Tax Accountant, External Business Advisor, Accounting Data Analyst, and Software Specialist.', 'Alam Sutera, Kemanggisan', 'https://www.youtube.com/watch?v=ocbpJPgkl3w&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=40', NULL, 1996, 4, 0),
(2, 'Accounting (@Bekasi)', 'School of Accounting', 'S.Ak.', 'Accounting Technology Program, merupakan Program Sarjana Akuntansi, School of Accounting, Binus University yang berlokasi di Kampus Binus Bekasi. Program Sarjana Akuntansi ini menekankan pada kurikulum Akuntansi yang di integrasikan pada penguasaan penerapan teknologi akuntansi (accounting software) bagi mahasiswanya.', 'Professional Accountant (yang fokus pada bidang, tetapi tidak terbatas sebagai) : Business Transformer, Data Navigator dan Digital Playmaker. Lulusan dapat juga berkarir sebagai Public Accountant, Management Accountant, Internal Auditor, Government Accountant, Government Auditor, Tax Consultant, Banker, Finance  Analyst, Entrepreneur', 'Bekasi', 'https://www.youtube.com/watch?v=ocbpJPgkl3w&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=40', NULL, 2018, 4, 0),
(3, 'Taxation', 'School of Accounting', 'S.Ak.', 'Program Taxation dirancang agar calon mahasiswa memiliki kompetensi Akuntansi, khususnya Perpajakan, kemampuan untuk berpikir analitis dan problem solving, serta keterampilan menggunakan teknologi sehingga kamu mampu menganalisis serta merancang strategi perpajakan yang komprehensif dengan memanfaatkan aplikasi perpajakan.', 'Konsultan Pajak (Tax Consultant), Ahli Pajak Perusahaan (Tax Corporate Analist), Pengacara Pajak (Tax Attorney), Ahli Transfer Pricing (Transfer Pricing Specialist), Ahli Bea Cukai-Expor- Impor (Export Import Tax Specialist), Perencana Teknologi Perpajakan (Digital Tax Planner/Taxologist), Perencana Wajib Pajak Miliuner (HNWI Tax planner), Perencana Pajak Dalam Negeri & Internasional (Domestic & International Tax planner)', 'Kemanggisan', 'https://www.youtube.com/watch?v=JgCcFNHzjSQ&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=38', NULL, 2022, 4, 0),
(4, 'Finance', 'School of Accounting', 'S.Ak.', 'Dengan bergabung di Program Finance, kamu akan belajar state of the art dunia keuangan saat ini: pasar modal, lembaga keuangan: bank dan non-bank serta Digital Finance. Kamu akan mempelajari keahlian yang diperlukan sebagai seorang praktisi keuangan yang handal seperti analisa laporan keuangan, valuasi dan simulasi investasi, data analytics serta aplikasi teknologi inovatif. Disamping itu kamu juga berkesempatan untuk memperoleh sertifikasi internasional bergengsi: Certified Financial Analyst (CFA).Pembelajaran akan dilakukan dengan pendekatan teori dan praktik yang diampu oleh para dosen pengajar dan praktisi berpengalaman. Sebagai mahasiswa program Finance, kamu juga akan memiliki akses ke database yang biasa digunakan oleh professional keuangan global yakni Bloomberg dan Osiris.', 'Financial Analyst, Treasurer, Financial Controller, Business and Development Analyst, Investment Advisor, Risk Analyst, Portfolio and Fund Manager, Trader, Credit Analyst', 'Alam Sutera', 'https://www.youtube.com/watch?v=P_XLuRiwRIU&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=39', NULL, 2012, 4, 0),
(5, 'Business Management', 'Binus Business School', 'S.E.', 'Program ini membekali mahasiswa dengan pengetahuan dan keahlian dalam konsep management, pemikiran kreatif, keterampilan kewirausahaan, pola pikir global, etika, dan layanan digital & supply chain management. Keunikan dari program ini adalah membekali mahasiswa dengan “Global Business Service Management, Supply Chain Management, dan Retail Management”. Service dan supply chain akan menjadi kompetensi masa depan yang krusial bagi setiap perusahaan, yaitu kompetensi dalam mengembangkan solusi terintegrasi untuk masalah pelanggan (orientasi layanan), termasuk mengelola pihak internal dan eksternal (supply chain) dan penggunaan teknologi terbaru dalam prosesnya (digital). Prodi Business Management membekali mahasiswanya dengan kurikulum yang sesuai untuk menghadapi tantangan tersebut. Program ini telah memiliki akreditasi sekolah bisnis internasional (AACSB) dan akreditasi nasional tertinggi yaitu BAN-PT ‘UNGGUL’.', 'e-commerce development, logistics/supply chain analyst, Procurement/Purchasing analyst, business analyst, business development, human resource development, business consultant, service provider (servpreneur)', 'Bekasi', 'https://www.youtube.com/watch?v=L_h9wsaTkts&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=16', NULL, 2013, 4, 0),
(6, 'Management', 'Binus Business School', 'S.E.', 'Kurikulum program manajemen dirancang untuk antisipasi dinamika persaingan global yang memerlukan kepemimpinan organisasi dan keterampilan kewirausahaan dengan basis teknologi yang kuat seperti kecerdasan buatan dan kemampuan untuk terus beradaptasi dan berinovasi untuk mempertahankan pertumbuhan berkelanjutan dan berkontribusi kepada masyarakat dan bangsa. Pembelajaran pada program manajemen mengasah kemampuan dalam mengembangkan dan mengelola bisnis, kemampuan menerapkan aplikasi teknologi informasi dalam bisnis, kemampuan menciptakan dan mengelola bisnis berbasis digital, dan kemampuan mengoptimalkan kapabilitas dan kapasitas organisasi serta sumber daya yang dimiliki. Kurikulum program manajemen juga menyediakan skema dan platform seperti program  2,5 tahun langsung menggapai karir, enrichment program, program minor, program streaming, mobilitas kampus, pertukaran internasional, dan free elective guna meningkatkan kemampuan praktis dan manajerial. Selain itu, program manajemen memberikan kesempatan untuk memperoleh tambahan kompetensi dan gelar sertifikasi profesi.', 'Entrepreneur startup, Business leader, Careers in various areas such as Research & Development, Human Resources, Marketing Relations, Social Media Specialist, Business Consultant, Business Analyst, Brand Manager, Product Manager, Finance, Digital Business Consultant', 'Alam Sutera, Kemanggisan, Bekasi', 'https://www.youtube.com/watch?v=9Iu_DZFiF3A&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=19', NULL, 2010, 4, 0),
(7, 'Business Creation', 'Binus Business School', 'S.E.', 'Business Creation merupakan program yang dirancang secara khusus untuk menghasilkan pengusaha yang kreatif dan inovatif. Program ini mendukung mahasiswa untuk membangun bisnis yang berkelanjutan dan mampu menghadapi perubahan.', 'Entrepreneur, Intrapreneur, Pengembang Bisnis, Perencana Bisnis dan Konsultan Bisnis.', 'Alam Sutera', 'https://www.youtube.com/watch?v=osG-eVAeDL4&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=17', NULL, 2014, 4, 0),
(8, 'Global Business Marketing', 'Binus Business School', 'S.E.', 'Program Global Business Marketing membantu kamu mempelajari cara merancang strategi pemasaran kreatif, merespons tren pasar, dan menerapkan konsep digital marketing untuk mencapai target yang ditetapkan, serta telah terakreditasi AACSB (Association for Advance Collegiate Schools of Business).', 'Brand Management, Product Line Management, Market Development Specialist, Marketing Consultant, Digital Marketing Management, Customer Relationship Management, Marketing and Selling Management, Product Activation Specialist, Channels Development Management, Performance Marketing Analyst, Marketing and Selling Management, Retail Management, B2B Marketing Specialist, Market-Business Analyst', 'Alam Sutera, Kemanggisan', 'https://www.youtube.com/watch?v=HVayHl1ffJM&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=18', NULL, 2010, 4, 0),
(9, 'International Business Management', 'Binus Business School', 'S.E.', 'International Business Management (IBM) adalah program sarjana yang dimiliki oleh BINUS UNIVERSITY. Program ini berdurasi selama empat tahun dan bertujuan untuk memberikan pemahaman komprehensif kepada para mahasiswa mengenai operasi bisnis internasional, termasuk ekonomi global, keuangan internasional, manajemen lintas budaya, dan perdagangan internasional. Program IBM dirancang untuk melengkapi para mahasiswa dengan keterampilan dan pengetahuan yang diperlukan agar berhasil dalam lingkungan bisnis global.', 'International Finance Controller, Import/ Export Compliance Specialist Business Analyst/ Development, International Economist/Banking/Marketing Manager, Multinational Manager, Business Development Manager, International Trade and Customs Manager, International Foreign Policy Advisor, Global Entrepreneur', 'Alam Sutera', 'https://www.youtube.com/watch?v=4nOtkll6NMY&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=37', NULL, 2013, 4, 0),
(10, 'International Business Management - Global Class', 'Binus Business School', 'S.E.', 'International Business Management (IBM) adalah program sarjana yang dimiliki oleh BINUS UNIVERSITY. Program ini berdurasi selama empat tahun dan bertujuan untuk memberikan pemahaman komprehensif kepada para mahasiswa mengenai operasi bisnis internasional, termasuk ekonomi global, keuangan internasional, manajemen lintas budaya, dan perdagangan internasional. Program IBM dirancang untuk melengkapi para mahasiswa dengan keterampilan dan pengetahuan yang diperlukan agar berhasil dalam lingkungan bisnis global.', 'International Finance Controller, Import/ Export Compliance Specialist Business Analyst/ Development, International Economist/Banking/Marketing Manager, Multinational Manager, Business Development Manager, International Trade and Customs Manager, International Foreign Policy Advisor, Global Entrepreneur', 'Alam Sutera', 'https://www.youtube.com/watch?v=4nOtkll6NMY&list=PLVfxj2HRUAZEN_XxPsLqizEwPRHI-RR2c&index=37', NULL, 2013, 4, 0),
(11, 'Digital Business', 'Binus Business School', 'S.Bns.', 'Program Studi Bisnis Digital akan menyiapkan mahasiswa dalam pengembangan dan pengelolaan bisnis berbasis teknologi digital dan didukung kemampuan financial technology (fintech). Program ini berfokus untuk menciptakan lulusan yang siap membangun usaha rintisan berbasis digital (digital entrepreneur) dan lulusan yang dapat bekerja di perusahaan Nasional maupun Multinasional.', 'Digital Entrepreneur (Startup Founder/Co-Founder, Chief Executive Officer & Business Development Manager), Consultant (Digital Business Consultant, Digital Transformation Consultant & Management Consultant), Analyst (Business Analyst, Data Analyst & Digital Business Analyst), Researcher (Digital Business Research, Digital Market Research & Digital Transformation Research), Fintech Specialist (Fintech Developer & Fintech Designer)', 'Semarang', 'https://youtu.be/HvBvoGlYMk8', NULL, 2019, 4, 0),
(12, 'Digital Business (@Medan)', 'Binus Business School', 'S.Bns.', 'Program Studi Digital Business dirancang untuk mempersiapkan mahasiswa menghadapi era bisnis modern yang berbasis teknologi digital. Program ini mengintegrasikan pengetahuan bisnis konvensional dengan teknologi dan aplikasi bisnis digital yang relevan, seperti e-commerce, analisis data, pemasaran digital, manajemen konten, dan pengembangan aplikasi berbasis web, termasuk memanfaatkan teknologi AI dalam bisnis. Mahasiswa akan belajar bagaimana memanfaatkan teknologi untuk menciptakan model bisnis inovatif, mengelola platform digital, dan meningkatkan efisiensi operasional melalui transformasi digital. Program ini juga mengajarkan strategi dalam memanfaatkan media sosial, AI dan aplikasi bisnis berbasis digital untuk memperluas jangkauan bisnis. Lulusan akan memiliki kompetensi dan mindset global untuk bekerja dalam berbagai sektor, mulai dari start-up hingga perusahaan multinasional, serta berkontribusi dalam pengembangan ekonomi digital yang berkelanjutan.', 'Digital Entrepreneur, Analis Strategi Digital dan E-Commerce, Konsultan Bisnis Digital, Analis Business Intelligent, Analis Pemasaran Digital, Analis Bisnis Keberlanjutan Digital, Manajer Proyek Digital untuk Inisiatif Ekosistem Biru', 'Medan', 'https://www.youtube.com/watch?v=wvvYYJVV8O4', NULL, 2025, 4, 0),
(13, 'International Trade (@Medan)', 'Binus Business School', 'S.Bns.', 'Program Studi International Trade dirancang untuk mempersiapkan mahasiswa dalam menghadapi perdagangan internasional berbasis online yang semakin berkembang dan terintegrasi dengan bisnis secara luas di era globalisasi. Program ini mengeksplorasi pengembangan perdagangan global dengan memanfatkan teknologi informasi yang memungkinkan pengelolaan bisnis secara efisien dan sekaligus membuka peluang baru. Mahasiswa akan mempelajari berbagai aspek perdagangan internasional, seperti manajemen rantai pasok global, regulasi perdagangan lintas negara, serta penggunaan teknologi informasi berbasis cloud untuk memantau dan mengelola transaksi internasional. Mahasiswa akan mempelajari berbagai aspek perdagangan internasional, seperti manajemen rantai pasok global, regulasi perdagangan lintas negara, serta penggunaan teknologi informasi berbasis cloud untuk memantau dan mengelola transaksi internasional. Selain itu, program ini juga mengajarkan mindset kewirausahaan digital global, mahasiswa belajar untuk memanfaatkan teknologi digital dalam menciptakan inovasi bisnis dan memperluas pasar internasional. Lulusan akan memiliki kompetensi dalam mengelola perdagangan internasional berbasis cloud dan mindset kewirausahaan global yang siap untuk berkontribusi dalam perdagangan digital di pasar global yang dinamis.', 'Business Analyst, Business Planner and Developer, International Marketing Analyst, Consultant for International Finance and Trade, Joint Venture Project Consultant, Global Risk Management Analyst, Export - Import Analyst/Office', 'Medan', 'https://www.youtube.com/watch?v=0F4bxNGpGJ0', NULL, 2025, 4, 0),
(14, 'Creativepreneurship (@Bandung)', 'Binus Business School', 'S.Bns.', 'Program Creativepreneurship merupakan program studi di bawah Program Sarjana BINUS Business School yang membahas kebutuhan kreativitas dan kewirausahaan. Sejalan dengan pencapaian akreditasi Internasional melalui AACSB sejak tahun 2020. Program ini mengutamakan kualitas proses belajar mengajar yang selaras dengan Student Outcomes yang dibutuhkan oleh Stakeholders. Lulusan akan memperoleh gelar Sarjana Bisnis yang berfokus pada membangun bisnis di industri kreatif dan mengembangkan perusahaan berbasis kreativitas. Program ini akan mengeksplorasi Creativepreneurship sebagai kepemimpinan dalam bisnis yang mengeksplorasi komersialisasi TIK dengan pengetahuan, keterampilan, dan sikap kewirausahaan praktis dan kreatif yang diperlukan untuk mengembangkan ide-ide bisnis baru dalam domain inovasi teknologi yang sedang berkembang. Hasil dari proyek creativepreneur dimaksudkan untuk mengejar pertumbuhan bisnis yang sukses secara terus-menerus untuk menangkap nilai bagi perusahaan secara berkelanjutan dan etis, terlebih lagi, secara aktif berkontribusi pada kemakmuran masyarakat luas. Teknik Pembelajaran Eksperiensial dan Praktik Inovasi, yaitu Laboratorium Kehidupan Kewirausahaan, Pengujian Pasar Praktis dan Komersialisasi, Penawaran Investor, Mentoring, Pelatihan, Konseling, Program Fasilitasi, digunakan untuk memperoleh pengetahuan, keterampilan, dan sikap praktis dalam pengembangan inovasi teknologi, komersialisasi, dan penciptaan usaha inovatif.', 'Entrepreneur, Intrapreneur, Business Developer, Business Planner, Business Consultant, Technopreneur, Sociopreneur, Business Analyst, E-Commerce Specialist, Venture Capitalist', 'Bandung', 'https://youtu.be/nIAdAWGkWFk', NULL, 2020, 4, 0),
(15, 'Entrepreneurship - Business Creation (@Malang)', 'Binus Business School', 'S.Bns.', 'Di Kampus Malang, Program Sarjana BINUS Business School menawarkan Program Studi Penciptaan Bisnis Kewirausahaan. Program ini menerima akreditasi internasional AACSB pada tahun 2020. Sejalan dengan akreditasi internasional ini, kurikulum Program dirancang untuk memberikan pengalaman belajar mengajar berkualitas tinggi dalam mendukung para siswa untuk menjadi pengusaha yang kreatif dan inovatif dengan mengembangkan cetak biru terstruktur untuk mengubah ide menjadi usaha atau inisiatif yang layak. Gaya pendidikan juga bertujuan untuk membentuk karakteristik dan pola pikir siswa sebagai pengusaha masa depan. Mereka memiliki motivasi tinggi, berani mencoba dan berinovasi dalam memulai bisnis baru di berbagai bidang, industri, atau pasar. Program Studi Penciptaan Bisnis Kewirausahaan memperkenalkan kewirausahaan sebagai disiplin akademis. Kurikulum dirancang khususnya untuk mempersiapkan siswa menjadi pengusaha yang kreatif dan inovatif dengan memberikan cetak biru untuk mengubah ide menjadi usaha atau inisiatif yang layak. Pendidikan kewirausahaan juga bertujuan untuk membentuk karakteristik dan pola pikir pengusaha yang memiliki motivasi tinggi, berani mencoba dan berinovasi, yang dapat diterapkan di berbagai bidang kehidupan dan karier seseorang. Kurikulum Program Studi Penciptaan Bisnis Kewirausahaan dirancang khusus untuk mempersiapkan siswa agar mampu menerapkan pengetahuan kewirausahaan mereka dan memulai bisnis baru.', 'Entrepreneur, Intrapreneur, Global entrepreneur, Business Developer, Business Planner, Business Consultant', 'Malang', 'https://youtu.be/q-fDYZhxh6E', NULL, 2020, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `user_id` int(11) NOT NULL,
  `displayname` varchar(63) DEFAULT NULL,
  `username` varchar(63) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forumpost`
--
ALTER TABLE `forumpost`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `forumpost`
--
ALTER TABLE `forumpost`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forumpost`
--
ALTER TABLE `forumpost`
  ADD CONSTRAINT `forumpost_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
