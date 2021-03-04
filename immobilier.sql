-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 01 mars 2021 à 16:01
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `immobilier`
--
CREATE DATABASE IF NOT EXISTS `immobilier` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `immobilier`;

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

CREATE TABLE `agence` (
  `idAgence` int(6) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `idDemande` int(5) NOT NULL,
  `idPersonne` int(3) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `budget` int(7) NOT NULL,
  `superficie` int(5) NOT NULL,
  `categorie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `logement`
--

CREATE TABLE `logement` (
  `idLogement` int(4) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `prix` int(7) NOT NULL,
  `superficie` int(5) NOT NULL,
  `categorie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `logement_agence`
--

CREATE TABLE `logement_agence` (
  `idLogementAgence` int(5) NOT NULL,
  `idAgence` int(6) NOT NULL,
  `idLogement` int(4) NOT NULL,
  `frais` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `logement_personne`
--

CREATE TABLE `logement_personne` (
  `idLogementPersonne` int(5) NOT NULL,
  `idPersonne` int(3) NOT NULL,
  `idLogement` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `idPersonne` int(3) NOT NULL,
  `prenom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`idAgence`);

--
-- Index pour la table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`idDemande`),
  ADD KEY `idPersonne` (`idPersonne`);

--
-- Index pour la table `logement`
--
ALTER TABLE `logement`
  ADD PRIMARY KEY (`idLogement`);

--
-- Index pour la table `logement_agence`
--
ALTER TABLE `logement_agence`
  ADD PRIMARY KEY (`idLogementAgence`),
  ADD KEY `idAgence` (`idAgence`),
  ADD KEY `idLogement` (`idLogement`);

--
-- Index pour la table `logement_personne`
--
ALTER TABLE `logement_personne`
  ADD PRIMARY KEY (`idLogementPersonne`),
  ADD UNIQUE KEY `idLogement` (`idLogement`),
  ADD KEY `idPersonne` (`idPersonne`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`idPersonne`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agence`
--
ALTER TABLE `agence`
  MODIFY `idAgence` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demande`
--
ALTER TABLE `demande`
  MODIFY `idDemande` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `logement`
--
ALTER TABLE `logement`
  MODIFY `idLogement` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `logement_agence`
--
ALTER TABLE `logement_agence`
  MODIFY `idLogementAgence` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `logement_personne`
--
ALTER TABLE `logement_personne`
  MODIFY `idLogementPersonne` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `idPersonne` int(3) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `logement_agence`
--
ALTER TABLE `logement_agence`
  ADD CONSTRAINT `logement_agence_ibfk_1` FOREIGN KEY (`idLogement`) REFERENCES `logement` (`idLogement`),
  ADD CONSTRAINT `logement_agence_ibfk_2` FOREIGN KEY (`idAgence`) REFERENCES `agence` (`idAgence`);

--
-- Contraintes pour la table `logement_personne`
--
ALTER TABLE `logement_personne`
  ADD CONSTRAINT `logement_personne_ibfk_1` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`),
  ADD CONSTRAINT `logement_personne_ibfk_2` FOREIGN KEY (`idLogement`) REFERENCES `logement` (`idLogement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
