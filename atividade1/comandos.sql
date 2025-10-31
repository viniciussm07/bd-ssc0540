CREATE TABLE Time (
  nome VARCHAR(30) PRIMARY KEY,
  estado VARCHAR(2),
  tipo VARCHAR(20) CHECK (tipo in ('AMADOR','PROFISSIONAL')),
  saldo_gols NUMBER(5)
); -- ok

CREATE TABLE Joga (
  time1 VARCHAR(30),
  time2 VARCHAR(30),
  classico NUMBER(1) CHECK (classico in (0,1)),
  CONSTRAINT pk_joga PRIMARY KEY (time1, time2),
  CONSTRAINT fk_joga_time1 FOREIGN KEY (time1)
    REFERENCES Time(nome)
    ON DELETE CASCADE,
  CONSTRAINT fk_joga_time2 FOREIGN KEY (time2)
    REFERENCES Time(nome)
    ON DELETE CASCADE,
  CONSTRAINT ck_joga CHECK (time1 <> time2)
); -- ok

CREATE TABLE Partida (
  time1 VARCHAR(30),
  time2 VARCHAR(30),
  data_partida DATE,
  placar VARCHAR(7) DEFAULT '0x0',
  local VARCHAR(30),
  CONSTRAINT pk_partida PRIMARY KEY (time1, time2, data_partida),
  CONSTRAINT fk_partida_time1 FOREIGN KEY (time1)
    REFERENCES Time(nome)
    ON DELETE CASCADE,
  CONSTRAINT fk_partida_time2 FOREIGN KEY (time2)
    REFERENCES Time(nome)
    ON DELETE CASCADE,
  CONSTRAINT ck_partida CHECK (time1 <> time2),
  CONSTRAINT ck_partida_placar CHECK (REGEXP_LIKE(placar, '^[0-9]{1,2,3}x[0-9]{1,2,3}$'))
);
