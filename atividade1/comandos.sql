CREATE TABLE Time (
  nome VARCHAR(30) PRIMARY KEY,
  estado VARCHAR(2),
  tipo VARCHAR(20) CHECK (tipo in ('AMADOR','PROFISSIONAL')),
  saldo_gols NUMBER(3)
); -- ok

CREATE TABLE Joga (
  time1 VARCHAR(30),
  time2 VARCHAR(30),
  classico NUMBER(1) CHECK (classico in (0,1)),
  CONSTRAINT pk_time PRIMARY KEY (time1, time2),
  CONSTRAINT fk_time1 FOREIGN KEY (time1)
    REFERENCES Time(nome)
    ON DELETE SET CASCADE,
  CONSTRAINT fk_time2 FOREIGN KEY (time2)
    REFERENCES Time(nome)
    ON DELETE CASCADE,
  CONSTRAINT ck_joga CHECK (time1 <> time2),
);
