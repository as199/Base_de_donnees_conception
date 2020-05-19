-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 19 mai 2020 à 16:21
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hopital`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `NUMERO_CHAMBRE` int(11) NOT NULL,
  `CATEGORIE_CHAMBRE` varchar(20) NOT NULL,
  `TYPE_CHAMBRE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`NUMERO_CHAMBRE`, `CATEGORIE_CHAMBRE`, `TYPE_CHAMBRE`) VALUES
(6, 'c1', 'blue');

-- --------------------------------------------------------

--
-- Structure de la table `departementmedical`
--

CREATE TABLE `departementmedical` (
  `NUMERO_DEPARTEMENT` int(11) NOT NULL,
  `NOM_DEPARTEMENT` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `departementmedical`
--

INSERT INTO `departementmedical` (`NUMERO_DEPARTEMENT`, `NOM_DEPARTEMENT`) VALUES
(1, 'd1'),
(2, 'd1'),
(3, 'd2'),
(4, 'd3'),
(5, 'd4');

-- --------------------------------------------------------

--
-- Structure de la table `feuilledevolution`
--

CREATE TABLE `feuilledevolution` (
  `NUMERO_FEUILLE` int(11) NOT NULL,
  `NUMERO_DEPARTEMENT` int(11) NOT NULL,
  `NUMERO_MALADE` int(11) NOT NULL,
  `DATE_FEUILLE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `feuilledevolution`
--

INSERT INTO `feuilledevolution` (`NUMERO_FEUILLE`, `NUMERO_DEPARTEMENT`, `NUMERO_MALADE`, `DATE_FEUILLE`) VALUES
(5, 3, 3, '2020-04-14'),
(6, 2, 1, '2020-05-04');

-- --------------------------------------------------------

--
-- Structure de la table `interne`
--

CREATE TABLE `interne` (
  `NUMERO_DEPARTEMENT` int(11) NOT NULL,
  `NUMERO_MALADE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `interne`
--

INSERT INTO `interne` (`NUMERO_DEPARTEMENT`, `NUMERO_MALADE`) VALUES
(1, 3),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `lit`
--

CREATE TABLE `lit` (
  `NUMERO_LIT` int(11) NOT NULL,
  `NUMERO_CHAMBRE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lit`
--

INSERT INTO `lit` (`NUMERO_LIT`, `NUMERO_CHAMBRE`) VALUES
(1, 6);

-- --------------------------------------------------------

--
-- Structure de la table `malade`
--

CREATE TABLE `malade` (
  `NUMERO_MALADE` int(11) NOT NULL,
  `NOM_MALADE` varchar(70) NOT NULL,
  `ADRESSE_MALADE` varchar(100) NOT NULL,
  `SEXE_MALADE` varchar(10) NOT NULL,
  `DATE_DE_NAISSANCE_MALADE` date DEFAULT NULL,
  `LIEU_DE_NAISSANCE_MALADE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `malade`
--

INSERT INTO `malade` (`NUMERO_MALADE`, `NOM_MALADE`, `ADRESSE_MALADE`, `SEXE_MALADE`, `DATE_DE_NAISSANCE_MALADE`, `LIEU_DE_NAISSANCE_MALADE`) VALUES
(1, 'assane', 'Podor', 'm', '2020-05-04', 'Podor'),
(2, 'fatou', 'yoff', 'f', '2020-05-20', 'daf'),
(3, 'fama', 'dakar', 'f', '2012-04-22', 'joal');

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `NUMERO_MEDECIN` int(11) NOT NULL,
  `NUMERO_DEPARTEMENT` int(11) NOT NULL,
  `NOM_MEDECIN` varchar(70) NOT NULL,
  `SPECIALITE_MEDECIN` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`NUMERO_MEDECIN`, `NUMERO_DEPARTEMENT`, `NOM_MEDECIN`, `SPECIALITE_MEDECIN`) VALUES
(1, 1, 'fall', 'S1'),
(2, 2, 'Diop', 'S1'),
(3, 3, 'FAYE', 'S2');

-- --------------------------------------------------------

--
-- Structure de la table `occuper`
--

CREATE TABLE `occuper` (
  `NUMERO_MALADE` int(11) NOT NULL,
  `NUMERO_LIT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `occuper`
--

INSERT INTO `occuper` (`NUMERO_MALADE`, `NUMERO_LIT`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `suivre`
--

CREATE TABLE `suivre` (
  `NUMERO_MEDECIN` int(11) NOT NULL,
  `NUMERO_MALADE` int(11) NOT NULL,
  `NUMERO_EVOLUTION` int(11) NOT NULL,
  `DATE_EVOLUTION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `suivre`
--

INSERT INTO `suivre` (`NUMERO_MEDECIN`, `NUMERO_MALADE`, `NUMERO_EVOLUTION`, `DATE_EVOLUTION`) VALUES
(1, 3, 4, '2020-05-12');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`NUMERO_CHAMBRE`);

--
-- Index pour la table `departementmedical`
--
ALTER TABLE `departementmedical`
  ADD PRIMARY KEY (`NUMERO_DEPARTEMENT`);

--
-- Index pour la table `feuilledevolution`
--
ALTER TABLE `feuilledevolution`
  ADD PRIMARY KEY (`NUMERO_FEUILLE`),
  ADD KEY `FK_CONCERNER` (`NUMERO_DEPARTEMENT`),
  ADD KEY `FK_POSSEDER` (`NUMERO_MALADE`);

--
-- Index pour la table `interne`
--
ALTER TABLE `interne`
  ADD PRIMARY KEY (`NUMERO_DEPARTEMENT`,`NUMERO_MALADE`),
  ADD KEY `FK_INTERNE` (`NUMERO_MALADE`);

--
-- Index pour la table `lit`
--
ALTER TABLE `lit`
  ADD PRIMARY KEY (`NUMERO_LIT`),
  ADD KEY `FK_SE_TROUVER` (`NUMERO_CHAMBRE`);

--
-- Index pour la table `malade`
--
ALTER TABLE `malade`
  ADD PRIMARY KEY (`NUMERO_MALADE`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`NUMERO_MEDECIN`),
  ADD KEY `FK_EVOLUER` (`NUMERO_DEPARTEMENT`);

--
-- Index pour la table `occuper`
--
ALTER TABLE `occuper`
  ADD PRIMARY KEY (`NUMERO_MALADE`,`NUMERO_LIT`),
  ADD KEY `FK_OCCUPER` (`NUMERO_LIT`);

--
-- Index pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD PRIMARY KEY (`NUMERO_MEDECIN`,`NUMERO_MALADE`),
  ADD KEY `FK_SUIVRE` (`NUMERO_MALADE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `NUMERO_CHAMBRE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `departementmedical`
--
ALTER TABLE `departementmedical`
  MODIFY `NUMERO_DEPARTEMENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `feuilledevolution`
--
ALTER TABLE `feuilledevolution`
  MODIFY `NUMERO_FEUILLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `interne`
--
ALTER TABLE `interne`
  MODIFY `NUMERO_DEPARTEMENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `lit`
--
ALTER TABLE `lit`
  MODIFY `NUMERO_LIT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `malade`
--
ALTER TABLE `malade`
  MODIFY `NUMERO_MALADE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `NUMERO_MEDECIN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `occuper`
--
ALTER TABLE `occuper`
  MODIFY `NUMERO_MALADE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `suivre`
--
ALTER TABLE `suivre`
  MODIFY `NUMERO_MEDECIN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `feuilledevolution`
--
ALTER TABLE `feuilledevolution`
  ADD CONSTRAINT `FK_CONCERNER` FOREIGN KEY (`NUMERO_DEPARTEMENT`) REFERENCES `departementmedical` (`NUMERO_DEPARTEMENT`),
  ADD CONSTRAINT `FK_POSSEDER` FOREIGN KEY (`NUMERO_MALADE`) REFERENCES `malade` (`NUMERO_MALADE`);

--
-- Contraintes pour la table `interne`
--
ALTER TABLE `interne`
  ADD CONSTRAINT `FK_INTERNE` FOREIGN KEY (`NUMERO_MALADE`) REFERENCES `malade` (`NUMERO_MALADE`),
  ADD CONSTRAINT `FK_INTERNE2` FOREIGN KEY (`NUMERO_DEPARTEMENT`) REFERENCES `departementmedical` (`NUMERO_DEPARTEMENT`);

--
-- Contraintes pour la table `lit`
--
ALTER TABLE `lit`
  ADD CONSTRAINT `FK_SE_TROUVER` FOREIGN KEY (`NUMERO_CHAMBRE`) REFERENCES `chambre` (`NUMERO_CHAMBRE`);

--
-- Contraintes pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD CONSTRAINT `FK_EVOLUER` FOREIGN KEY (`NUMERO_DEPARTEMENT`) REFERENCES `departementmedical` (`NUMERO_DEPARTEMENT`);

--
-- Contraintes pour la table `occuper`
--
ALTER TABLE `occuper`
  ADD CONSTRAINT `FK_OCCUPER` FOREIGN KEY (`NUMERO_LIT`) REFERENCES `lit` (`NUMERO_LIT`),
  ADD CONSTRAINT `FK_OCCUPER2` FOREIGN KEY (`NUMERO_MALADE`) REFERENCES `malade` (`NUMERO_MALADE`);

--
-- Contraintes pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD CONSTRAINT `FK_SUIVRE` FOREIGN KEY (`NUMERO_MALADE`) REFERENCES `malade` (`NUMERO_MALADE`),
  ADD CONSTRAINT `FK_SUIVRE2` FOREIGN KEY (`NUMERO_MEDECIN`) REFERENCES `medecin` (`NUMERO_MEDECIN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
