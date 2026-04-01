CREATE TABLE profili (
    id_profilo INT PRIMARY KEY AUTO_INCREMENT,
    nome_profilo VARCHAR(100) NOT NULL
);

CREATE TABLE nazioni (
    iso_code CHAR(2) PRIMARY KEY,
    nome_nazione VARCHAR(100) NOT NULL
);

CREATE TABLE utenti (
    id_utente INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    citta VARCHAR(100),
    id_profilo INT,
    iso_code CHAR(2),
    attivo TINYINT(1) DEFAULT 1,
    foto_profilo VARCHAR(255) DEFAULT NULL,
    data_registrazione DATETIME,
    FOREIGN KEY (id_profilo) REFERENCES profili(id_profilo)
        ON UPDATE CASCADE,
    FOREIGN KEY (iso_code) REFERENCES nazioni(iso_code)
        ON UPDATE CASCADE
);

CREATE TABLE generi (
    id_genere INT PRIMARY KEY AUTO_INCREMENT,
    nome_genere VARCHAR(100) NOT NULL
);

CREATE TABLE persone (
    id_persona INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    iso_code CHAR(2),
    foto VARCHAR(255), 
    wikipedia_slug VARCHAR(255),
    FOREIGN KEY (iso_code) REFERENCES nazioni(iso_code)
        ON UPDATE CASCADE
);

CREATE TABLE films (
    id_film INT PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(255) NOT NULL,
    trama TEXT,
    durata_minuti INT,
    data_uscita DATE,
    copertina_path VARCHAR(255),
    trailer_id VARCHAR(20)
);

CREATE TABLE films_generi (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_film INT NOT NULL,
    id_genere INT NOT NULL,
    UNIQUE KEY (id_film, id_genere),
    FOREIGN KEY (id_film) REFERENCES films(id_film)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_genere) REFERENCES generi(id_genere)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE films_persone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_film INT NOT NULL,
    id_persona INT NOT NULL,
    ruolo ENUM('Regista', 'Attore'),
    FOREIGN KEY (id_film) REFERENCES films(id_film)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_persona) REFERENCES persone(id_persona)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE watchlist (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_film INT NOT NULL,
    id_utente INT NOT NULL,
    data_inserimento DATETIME,
    UNIQUE KEY (id_film, id_utente),
    FOREIGN KEY (id_film) REFERENCES films(id_film)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_utente) REFERENCES utenti(id_utente)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE watched (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_film INT NOT NULL,
    id_utente INT NOT NULL,
    data_inserimento DATETIME,
    UNIQUE KEY (id_film, id_utente),
    FOREIGN KEY (id_film) REFERENCES films(id_film)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_utente) REFERENCES utenti(id_utente)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE preferiti (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_film INT NOT NULL,
    id_utente INT NOT NULL,
    data_inserimento DATETIME,
    UNIQUE KEY (id_film, id_utente),
    FOREIGN KEY (id_film) REFERENCES films(id_film)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_utente) REFERENCES utenti(id_utente)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE recensioni (
	id_recensione INT PRIMARY KEY AUTO_INCREMENT,
    id_film INT NOT NULL,
    id_utente INT NOT NULL,
    voto DECIMAL(2,1),
    testo TEXT,
    data_inserimento DATETIME,
    UNIQUE KEY (id_film, id_utente),
    FOREIGN KEY (id_film) REFERENCES films(id_film)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_utente) REFERENCES utenti(id_utente)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE sessioni (
    id_sessione VARCHAR(255) PRIMARY KEY,
    id_utente INT NOT NULL,
    data_login DATETIME,
    data_logout DATETIME,
    FOREIGN KEY (id_utente) REFERENCES utenti(id_utente)
        ON DELETE CASCADE ON UPDATE CASCADE
);