CREATE TABLE Cliente (
	ID INT IDENTITY(1, 1),
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    UF VARCHAR(2),
    Celular VARCHAR(15)
);

CREATE TABLE Financiamento (
	ID INT IDENTITY(1, 1),
    IdFinanciamento INT PRIMARY KEY,
    CPF VARCHAR(11) FOREIGN KEY REFERENCES Cliente(CPF),
    TipoFinanciamento VARCHAR(50),
    ValorTotal NUMERIC(18,2),
    DataUltimoVencimento DATE
);

CREATE TABLE Parcela (
	ID INT IDENTITY(1, 1),
    IdParcela INT PRIMARY KEY,
    IdFinanciamento INT FOREIGN KEY REFERENCES Financiamento(IdFinanciamento),
    NumeroParcela INT,
    ValorParcela NUMERIC(18,2),
    DataVencimento DATE,
    DataPagamento DATE
);

-- Inserindo Clientes
INSERT INTO Cliente (CPF, Nome, UF, Celular) VALUES ('12345678901', 'João Silva', 'SP', '11999887766');
INSERT INTO Cliente (CPF, Nome, UF, Celular) VALUES ('98765432109', 'Maria Oliveira', 'RJ', '21988776655');

-- Inserindo Financiamentos
INSERT INTO Financiamento (IdFinanciamento, CPF, TipoFinanciamento, ValorTotal, DataUltimoVencimento) 
VALUES (1, '12345678901', 'Imobiliário', 300000, '2024-12-31');
INSERT INTO Financiamento (IdFinanciamento, CPF, TipoFinanciamento, ValorTotal, DataUltimoVencimento) 
VALUES (2, '98765432109', 'Consorcio', 4900000, '2024-10-19');

-- Inserindo Parcelas
INSERT INTO Parcela (IdParcela, IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) 
VALUES (1, 1, 1, 5000, '2024-01-31', '2024-01-25');
INSERT INTO Parcela (IdParcela, IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) 
VALUES (2, 1, 2, 5000, '2024-02-28', NULL);
INSERT INTO [dbo].[Parcela] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento])
     VALUES (3, 1, 1, 15000, '2024-03-20', '2024-03-10');

INSERT INTO [dbo].[Parcela] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento])
     VALUES (3, 2, 1, 15000, '2024-04-23', '2024-04-30')


SELECT c.Nome, c.CPF 
FROM Cliente c
JOIN Financiamento f ON c.CPF = f.CPF
JOIN Parcela p ON f.IdFinanciamento = p.IdFinanciamento
WHERE c.UF = 'SP'
GROUP BY c.Nome, c.CPF
HAVING (COUNT(p.DataPagamento) * 100 / COUNT(*)) > 60;



SELECT TOP 4 c.Nome, c.CPF
FROM Cliente c
JOIN Financiamento f ON c.CPF = f.CPF
JOIN Parcela p ON f.IdFinanciamento = p.IdFinanciamento
WHERE p.DataVencimento > DATEADD(DAY, 5, GETDATE()) AND p.DataPagamento IS NULL
ORDER BY p.DataVencimento;


