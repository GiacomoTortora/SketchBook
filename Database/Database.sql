-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Ruolo` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Jack','Tortora','jack@mail.com','Jack123','admin'),(2,'Raffaele','Parisi','raffaele@mail.com','Raffaele123','admin'),(3,'Simone','Califano','simone@mail.com','Simone123','admin'),(4,'Giovanni','Battista','gb@gmail.com','1234','user'),(5,'Ciccio','Cavolfiore','cc@gmail.com','1234','user'),(6,'cristo','crocifisso','cri@mail.com','1234','user'),(7,'urca','cal','as@mail.com','1234','user');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dettagli_ordine`
--

DROP TABLE IF EXISTS `dettagli_ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dettagli_ordine` (
  `ID_Ordine` int NOT NULL,
  `ID_Prodotto` int NOT NULL,
  `NomeProdotto` varchar(45) NOT NULL,
  `PrezzoProdotto` double NOT NULL,
  `IVAProdotto` double NOT NULL,
  `DescrizioneProdotto` varchar(45) NOT NULL,
  `Quantità` int NOT NULL,
  `Sconto` double DEFAULT NULL,
  PRIMARY KEY (`ID_Ordine`,`ID_Prodotto`),
  KEY `prodotto-ordine_idx` (`ID_Prodotto`),
  CONSTRAINT `ordine-prodotto` FOREIGN KEY (`ID_Ordine`) REFERENCES `ordine` (`ID`),
  CONSTRAINT `prodotto-ordine` FOREIGN KEY (`ID_Prodotto`) REFERENCES `prodotto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dettagli_ordine`
--

LOCK TABLES `dettagli_ordine` WRITE;
/*!40000 ALTER TABLE `dettagli_ordine` DISABLE KEYS */;
INSERT INTO `dettagli_ordine` VALUES (9,1,'Fabiano',10,22,'dlas',4,10);
/*!40000 ALTER TABLE `dettagli_ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzo`
--

DROP TABLE IF EXISTS `indirizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Via` varchar(45) NOT NULL,
  `Città` varchar(45) NOT NULL,
  `CAP` char(5) NOT NULL,
  `Provincia` varchar(45) NOT NULL,
  `Stato` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzo`
--

LOCK TABLES `indirizzo` WRITE;
/*!40000 ALTER TABLE `indirizzo` DISABLE KEYS */;
INSERT INTO `indirizzo` VALUES (1,'Circumvallazione','Nola','80035','NA','Italia'),(2,'Boh','Salerno','84133','SA','Italia'),(3,'Boh','Nocera Inferiore','84014','SA','Italia');
/*!40000 ALTER TABLE `indirizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locazione`
--

DROP TABLE IF EXISTS `locazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locazione` (
  `ID_Cliente` int NOT NULL,
  `ID_Indirizzo` int NOT NULL,
  PRIMARY KEY (`ID_Cliente`,`ID_Indirizzo`),
  KEY `indirizzo-cliente_idx` (`ID_Indirizzo`),
  CONSTRAINT `cliente-indirizzo` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID`),
  CONSTRAINT `indirizzo-cliente` FOREIGN KEY (`ID_Indirizzo`) REFERENCES `indirizzo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locazione`
--

LOCK TABLES `locazione` WRITE;
/*!40000 ALTER TABLE `locazione` DISABLE KEYS */;
INSERT INTO `locazione` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `locazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pagamento`
--

DROP TABLE IF EXISTS `metodo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pagamento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `#Carta` varchar(16) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pagamento`
--

LOCK TABLES `metodo_pagamento` WRITE;
/*!40000 ALTER TABLE `metodo_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Stato` varchar(45) NOT NULL,
  `ID_Cliente` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ordine-cliente_idx` (`ID_Cliente`),
  CONSTRAINT `ordine-cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (9,'2028-08-21','ordinato',4);
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(150) NOT NULL,
  `Descrizione` varchar(500) NOT NULL,
  `Prezzo` double NOT NULL,
  `IVA` int NOT NULL,
  `Quantita` int NOT NULL,
  `Sconto` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (1,'Blocco Disegno Fabriano Tiziano Colori Tenui 160gr.','La carta da disegno Tiziano ha una marcatura morbida che la rende ideale per pastello, ',17.04,22,3,NULL),(2,'Blocco Disegno Fabriano Tiziano Colori Brizzati 160gr.','La carta da disegno Tiziano ha una marcatura morbida che la rende ideale per pastello, carboncino, grafite, matita, tempera, air brush, oltre a tutte le tecniche di stampa.',17.04,22,3,NULL),(3,'Canson Album da disegno C4 - LISCIO - 224g','Gli album C4 contengono carta bianca con 4 angoli realizzati con cartoncino molto robusto per un utilizzo intenso sia a scuola che a casa.  224g/m3 - 24x33',4.13,22,3,NULL),(4,'Canson Album da disegno C4 - RUVIDO - 224g','Gli album C4 contengono carta bianca con 4 angoli realizzati con cartoncino molto robusto per un utilizzo intenso sia a scuola che a casa.  224g/m3 - 24x33',8.26,22,3,NULL),(5,'Canson XL Mix Media Carta Multitecnica 300gr.','Questo blocco è caratterizzato da una carta a grana media, con una grammatura importante, ',8.19,22,3,NULL),(6,'Canson Art Book One - SketchBook 100mg - Nero','Canson Art Book One è l’indispensabile compagno quotidiano per schizzi e disegni. ',7.52,22,3,NULL),(7,'Faber Castel Polychromos - Pastelli Colorati','Le matite Polychromos, grazie alla loro insuperabile qualità, ',45.08,22,3,NULL),(8,'Lyra Rembrandt Polycolor, Confezioni di Matite','A chi ama le rese professionali, Rembrandt Polycolor propone una preziosa scatola in metallo. ',43.03,22,3,NULL),(9,'Winsor&Newton, Matite Colorate - 12 Pezzi','Colori meravigliosamente ricchi e vibranti caratterizzano queste matite dalla mina spessa. ',16.72,22,3,NULL),(10,'Derwent Sketching, Confezione 6 pz.- Matite','Disegnare significa essere sciolti e liberi: le matite Derwent non potrebbero essere più facili da usare. ',7.34,22,3,NULL),(11,'Faber-Castell Pitt Graphite Set - Matite Disegno','Professional quality set in a metal case',31.15,22,3,NULL),(12,'Winsor & Newton Studio Collection - 12 Matite','A range of graphite pencils for sketching and drawing, suitable for blending, ',9.01,22,3,NULL),(13,'Winsor&Newton ProMarker, Toni Neutri, 6 pennarelli','Questo set include 6 colori dai colori neutri. I ProMarker sono disponibili sciolti in 148 colori dai toni intensamente vivaci alle sottili sfumature pastello. ',14.23,22,3,NULL),(14,'Penne Multiliner Set 10 Pezzi - Copic Markers - Nero','Le penne Copic Multiliner SP sono ideali per applicazioni artistiche e utilizzi professionali. A differenza degli altri fineliner il corpo in metallo solido garantisce un\'incredibile stabilità della punta. Surplus: l\'inchiostro è ricaricabile e le punte sono sostituibili. ',32.78,22,3,NULL),(15,'Ecoline, Confezioni di Brush Pen - Pennarelli Colorati','Usa gli Ecoline Brush Pen per dare vita ai tuoi lavori! Disponibili in confezioni da 5 pz.',12.12,22,3,NULL),(16,'Winsor&Newton, ProMarker Toni Vibranti, 6 pennarelli','Questo set include 6 colori dai colori vibranti. I ProMarker sono disponibili sciolti in 148 colori dai toni intensamente vivaci alle sottili sfumature pastello. ',13.31,22,3,NULL),(17,'Set Acquerello 12 Pezzi Winsor&Newton Pocket Box','Questa famosa scatolina di plastica tascabile presenta una tavolozza base di colori a acquerello in 12 mezzi godet + pennellino tascabile. Il set studio perfetto per avvicinarsi a questa straordinaria tecnica.',11.88,22,3,NULL),(18,'Canson, Confezione Completa Acquerello - 10 pezzi','Confezione completa di 10 acquerelli, un blocco di carta specifica e due pennelli a punta tonda. Fantastica idea regalo!',30.69,22,3,NULL),(19,'Derwent Inktense Paint Pan, Set da Viaggio','Il set da viaggio Derwent Inktense Paint Pan è composto da colori appositamente formulati per apparire simili all\'acquerello tradizionale - seppur dalle tonalità particolarmente vibranti. Il superplus è che, una volta asciutto, il colore è resistente all\'acqua, il che significa che puoi lavorarci sopra senza modificare gli strati inferiori. La formulazione Inktense è la stessa della gamma di matite Derwent Inktense.',19.51,22,3,NULL),(20,'Cobra Study, Colori ad Olio, Miscibili con Acqua, 6x20ml','I colori ad olio \"COBRA STUDY\" sono miscelabili con acqua ma danno lo stesso risultato dei colori ad olio tradizionali. Alto grado di resistenza alla luce. Possono essere mescolati tra di loro e con i colori ad olio tradizionali. ',17.59,22,3,NULL),(21,'Van Gogh, Colori a Olio, Starter Kit Large - 10 pezzi','Questo set contiene 10 tubi da 20ml di colori a olio Van Gogh.',28.92,22,3,NULL),(22,'Set di 6 Pennelli Misti Sintetici Manico Corto Lefranc Bourgeois','Questo blister contiene un assortimento di 6 pennelli misti (tondo n.6 e n.12, filbert n.6 e n.12, piatto n.16 e n.24) a manico corto in fibra sintetica dorata. Indicati per la pittura acrilica forniscono un\'eccellente elasticità sulla tela con un tocco molto preciso.',5.05,22,3,NULL),(23,'Set di 3 Pennelli Tondi Sintetici Manico Corto Lefranc Bourgeois','Questo blister contiene un assortimento di 3 pennelli tondi (n.2, n.6 e n.10) a manico corto in fibra sintetica dorata. Indicati per la pittura acrilica forniscono un\'eccellente elasticità sulla tela con un tocco molto preciso.',2.87,22,3,NULL),(24,'Pintura, Telai Telati in Cotone a Grana Media - 30x40','Telai telati della Linea Standard di Pintura: tela con preparazione universale 100% cotone. - 30x40cm',4.34,22,3,NULL);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilizzo`
--

DROP TABLE IF EXISTS `utilizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilizzo` (
  `ID_Pagamento` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  PRIMARY KEY (`ID_Pagamento`,`ID_Cliente`),
  KEY `cliente-pagamento_idx` (`ID_Cliente`),
  CONSTRAINT `cliente-pagamento` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID`),
  CONSTRAINT `pagamento-cliente` FOREIGN KEY (`ID_Pagamento`) REFERENCES `metodo_pagamento` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizzo`
--

LOCK TABLES `utilizzo` WRITE;
/*!40000 ALTER TABLE `utilizzo` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valutazione`
--

DROP TABLE IF EXISTS `valutazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valutazione` (
  `ID_Cliente` int NOT NULL,
  `ID_Prodotto` int NOT NULL,
  `Data` date NOT NULL,
  `Score` int NOT NULL,
  `Commento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`,`ID_Prodotto`),
  KEY `prodotto-cliente_idx` (`ID_Prodotto`),
  CONSTRAINT `cliente-prodotto` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID`),
  CONSTRAINT `prodotto-cliente` FOREIGN KEY (`ID_Prodotto`) REFERENCES `prodotto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valutazione`
--

LOCK TABLES `valutazione` WRITE;
/*!40000 ALTER TABLE `valutazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `valutazione` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-23 17:55:45
