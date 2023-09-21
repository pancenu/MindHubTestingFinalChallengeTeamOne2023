CREATE TABLE Loan (
    idLoan int NOT NULL,
    name varchar(50) NOT NULL,
    maxAmount int NOT NULL,
    payments int NOT NULL,
    PRIMARY KEY (idLoan)
);

CREATE TABLE Client (
    idClient int NOT NULL,
    firstname varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    PRIMARY KEY (idClient)
);

CREATE TABLE LoanClient (
    idLoanClient int NOT NULL,
    idClient int NOT NULL,
    idLoan int NOT NULL,
    amount int NOT NULL,
    payments int NOT NULL,
    PRIMARY KEY (idLoanClient),
    FOREIGN KEY (idLoan) REFERENCES Loan(idLoan),
    FOREIGN KEY (idClient) REFERENCES Client(idClient)
);

CREATE TABLE Account (
    idAccount int NOT NULL,
    idClient int NOT NULL,
    number varchar(20) NOT NULL,
    creationDate varchar(20) NOT NULL,
    balance int NOT NULL,
    PRIMARY KEY (idAccount),
    FOREIGN KEY (idClient) REFERENCES Client(idClient)
);

CREATE TABLE TypeTransaction (
    idType int NOT NULL,
    type varchar(8),
    PRIMARY KEY (idType)
);

CREATE TABLE Transaction (
    idTransaction int NOT NULL,
    idType int NOT NULL,
    idAccount int NOT NULL,
    amount int NOT NULL,
    date varchar(20) NOT NULL,
    description varchar(50) NOT NULL,
    PRIMARY KEY (idTransaction),
    FOREIGN KEY (idType) REFERENCES TypeTransaction(idType),
    FOREIGN KEY (idAccount) REFERENCES Account(idAccount)
);

CREATE TABLE Cards (
    idCard INT NOT NULL,
    idType INT NOT NULL,
    idClient INT NOT NULL,
    cardHolder VARCHAR(255) NOT NULL,
    `limit` INT,
    fromDate DATE NOT NULL,
    thruDate DATE NOT NULL,
    cvv VARCHAR(10) NOT NULL,
    idColor INT NOT NULL,
    maxLimit INT,
    availableLimit INT,
    PRIMARY KEY (idCard),
    FOREIGN KEY (idType) REFERENCES Type(idType),
    FOREIGN KEY (idClient) REFERENCES Client(idClient)
);

