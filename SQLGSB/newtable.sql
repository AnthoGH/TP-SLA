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
