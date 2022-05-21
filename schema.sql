BEGIN
EXECUTE IMMEDIATE 'DROP TABLE narudzbe';
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error. Not found.');
END;

/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE zaposlenici';
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error. Not found.');
END;

/

CREATE TABLE zaposlenici
(
    id        INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ime       VARCHAR(50) NOT NULL,
    prezime   VARCHAR(50) NOT NULL,
    email     VARCHAR(255) NOT NULL,
    drzava    VARCHAR(255)
);

/

CREATE TABLE narudzbe
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datum_narudzbe DATE DEFAULT SYSDATE,
    racun_izdao_id INT,
    adresa VARCHAR(255),
    zip VARCHAR(10),
    cijena_bez_pdv NUMBER(8, 2) DEFAULT 0,
    cijena_ukupno NUMBER(9, 2) DEFAULT 0,
    CONSTRAINT fk_izdao
        FOREIGN KEY (racun_izdao_id)
            REFERENCES zaposlenici (id)
            ON DELETE SET NULL
);

/

