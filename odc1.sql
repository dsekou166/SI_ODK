-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 13 juil. 2022 à 10:47
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `odc1`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `idacti` int(10) NOT NULL,
  `duree` varchar(30) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `annee` year(4) NOT NULL,
  `idtypeact` int(10) NOT NULL,
  `idetat` int(10) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`idacti`, `duree`, `libelle`, `annee`, `idtypeact`, `idetat`, `date`) VALUES
(1, '2 à 3 jours', 'Introduction sur UML', 2022, 2, 2, '2022-08-02'),
(2, '1 journee', 'Initiation drupal', 2022, 3, 1, '2022-06-06'),
(3, '3 à 6 mois', 'Kalanso2', 2022, 1, 1, '2022-07-03'),
(4, '2 à 3 jours', 'Initiation drupal', 2022, 2, 3, '2022-08-07'),
(5, '1 journee', 'prise de contact', 2022, 3, 3, '2022-08-17'),
(6, '2 à 3 jours', 'event', 2022, 2, 3, '2022-09-09'),
(7, '3 à 6 mois', 'kalanso 1', 2021, 1, 1, '2021-11-02');

-- --------------------------------------------------------

--
-- Structure de la table `postulant`
--

CREATE TABLE `postulant` (
  `idapp` int(10) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `date_de_naissance` varchar(20) DEFAULT NULL,
  `idacti` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `postulant`
--

INSERT INTO `postulant` (`idapp`, `nom`, `prenom`, `email`, `numero`, `date_de_naissance`, `idacti`) VALUES
(1, 'MAIGA', 'Abasse', 'abassemaiga@gmail.com', '72225182', '21/12/2003', 1),
(2, 'DIARRA', 'Tiecoura', 'tiec@gmail.com', '70804808', '01/01/2000', 3),
(3, 'DIAKITE', 'Sekou', 'Sekou@gmail.com', '77668090', '22/11/1998', 2);

-- --------------------------------------------------------

--
-- Structure de la table `typeact`
--

CREATE TABLE `typeact` (
  `idtypeact` int(10) NOT NULL,
  `nomtype` varchar(20) NOT NULL,
  `duree` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `typeact`
--

INSERT INTO `typeact` (`idtypeact`, `nomtype`, `duree`) VALUES
(1, 'Formation', '3 à 6 mois'),
(2, 'Evenement', '2 à 3 jours'),
(3, 'Talks', '1 journee');

-- --------------------------------------------------------

--
-- Structure de la table `typeetat`
--

CREATE TABLE `typeetat` (
  `idetat` int(10) NOT NULL,
  `statut` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `typeetat`
--

INSERT INTO `typeetat` (`idetat`, `statut`) VALUES
(1, 'Terminer'),
(2, 'En cours'),
(3, 'A venir');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`idacti`),
  ADD KEY `fk1` (`idtypeact`),
  ADD KEY `fk2` (`idetat`);

--
-- Index pour la table `postulant`
--
ALTER TABLE `postulant`
  ADD PRIMARY KEY (`idapp`),
  ADD KEY `fk3` (`idacti`);

--
-- Index pour la table `typeact`
--
ALTER TABLE `typeact`
  ADD PRIMARY KEY (`idtypeact`);

--
-- Index pour la table `typeetat`
--
ALTER TABLE `typeetat`
  ADD PRIMARY KEY (`idetat`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`idtypeact`) REFERENCES `typeact` (`idtypeact`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`idetat`) REFERENCES `typeetat` (`idetat`);

--
-- Contraintes pour la table `postulant`
--
ALTER TABLE `postulant`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`idacti`) REFERENCES `activite` (`idacti`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
