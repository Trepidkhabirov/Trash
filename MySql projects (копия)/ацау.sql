
CREATE TABLE Tovar (
    Article          VARCHAR(20) primary key,
    ProductName     VARCHAR(200),
    Unit          VARCHAR(20),
    Price             DECIMAL(10,2),
    Supplier        VARCHAR(100),
    Manufacturer    VARCHAR(100),
    Category        VARCHAR(100),
    Discount           DECIMAL(5,2) DEFAULT 0,
    Stock         INT DEFAULT 0,
    Description         TEXT,
    Photo VARCHAR(100)
);


CREATE TABLE Punkt (
    PunktCode   VARCHAR(10) PRIMARY KEY,
    city     VARCHAR(20),
     street     VARCHAR(20),
      numberhome     VARCHAR(20) 
);

CREATE TABLE User (
    login       VARCHAR(100) PRIMARY KEY,        
    Role        VARCHAR(50),
    Fio         VARCHAR(100),
    password      VARCHAR(50)
);

CREATE TABLE Zakaz (
    OrderNumber  INT Auto_increment primary key,
    OrderDate DATE ,
    DeliveryDate        DATE,
    PickupCode           VARCHAR(100),
    login        VARCHAR(100),              
    code_poluch        VARCHAR(100),
    OrderStatus VARCHAR(100) ,
     FOREIGN KEY (PickupCode)    REFERENCES Punkt(PunktCode),
    FOREIGN KEY (login) REFERENCES User(login)
);

CREATE TABLE order_item (
    Article Varchar(50),
    ArticleZakaz VARCHAR(50),
    Count INT,
    FOREIGN KEY (Article) REFERENCES Tovar(Article)
);



INSERT INTO Zakaz (OrderNumber, Article, OrderDate, DeliveryDate, PickupCode, login, code_poluch, OrderStatus) VALUES
(1, 'А112Т4, 2, F635R4, 2', DATE('2025-02-27 00:00:00'), DATE('2025-04-20 00:00:00'), '1', 'stepanov', '901', 'Завершен'),
(2, 'H782T5, 1, G783F5, 1', DATE('2022-09-28 00:00:00'), DATE('2025-04-21 00:00:00'), '11', 'nikiforova', '902', 'Завершен'),
(3, 'J384T6, 10, D572U8, 10', DATE('2025-03-21 00:00:00'), DATE('2025-04-22 00:00:00'), '2', 'sazonov', '903', 'Завершен'),
(4, 'F572H7, 5, D329H3, 4', DATE('2025-02-20 00:00:00'), DATE('2025-04-23 00:00:00'), '11', 'odintsov', '904', 'Завершен'),
(5, 'А112Т4, 2, F635R4, 2', DATE('2025-03-17 00:00:00'), DATE('2025-04-24 00:00:00'), '2', 'stepanov', '905', 'Завершен'),
(6, 'H782T5, 1, G783F5, 1', DATE('2025-03-01 00:00:00'), DATE('2025-04-25 00:00:00'), '15', 'nikiforova', '906', 'Завершен'),
(7, 'J384T6, 10, D572U8, 10', DATE('2025-04-30 00:00:00'), DATE('2025-04-26 00:00:00'), '3', 'sazonov', '907', 'Завершен'),
(8, 'F572H7, 5, D329H3, 4', DATE('2025-03-31 00:00:00'), DATE('2025-04-27 00:00:00'), '19', 'odintsov', '908', 'Новый'),
(9, 'B320R5, 5, G432E4, 1', DATE('2025-04-02 00:00:00'), DATE('2025-04-28 00:00:00'), '5', 'stepanov', '909', 'Новый'),
(10, 'S213E3, 5, E482R4, 5', DATE('2025-04-03 00:00:00'), DATE('2025-04-29 00:00:00'), '19', 'stepanov', '910', 'Новый');




