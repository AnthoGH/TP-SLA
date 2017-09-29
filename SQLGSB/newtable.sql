CREATE TABLE `Visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Absence` (
  `refVisiteur` char(4) NOT NULL,
  `date` date NOT NULL,
  `nbJours` int(11) NOT NULL,
  `refMotif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Motif` (
  `code` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `Absence`
  ADD PRIMARY KEY (`refVisiteur`,`date`),
  ADD KEY `refMotif` (`refMotif`);

ALTER TABLE `Motif`
  ADD PRIMARY KEY (`code`);

ALTER TABLE `Absence`
  ADD CONSTRAINT `Absence_ibfk_1` FOREIGN KEY (`refMotif`) REFERENCES `Motif` (`code`),
  ADD CONSTRAINT `Absence_ibfk_2` FOREIGN KEY (`refVisiteur`) REFERENCES `Visiteur` (`id`);
