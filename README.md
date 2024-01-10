# CreditChallenge


Esse é um CodeChallenge passado pela empresa X, abaixo está a resposta para 2 questões, que era uma voltada para SQL e outa sobre a explicação de Microserviço.

Eu também deixei o script em arquivo no repositorio, então você pode clonar e rodar. E o diagrama também está no repositorio, não consegui adicionar no README.

2 - CREATE TABLE Cliente ( ID INT IDENTITY(1, 1), CPF VARCHAR(11) PRIMARY KEY, Nome VARCHAR(100), UF VARCHAR(2), Celular VARCHAR(15) );

CREATE TABLE Financiamento ( ID INT IDENTITY(1, 1), IdFinanciamento INT PRIMARY KEY, CPF VARCHAR(11) FOREIGN KEY REFERENCES Cliente(CPF), TipoFinanciamento VARCHAR(50), ValorTotal NUMERIC(18,2), DataUltimoVencimento DATE );

CREATE TABLE Parcela ( ID INT IDENTITY(1, 1), IdParcela INT PRIMARY KEY, IdFinanciamento INT FOREIGN KEY REFERENCES Financiamento(IdFinanciamento), NumeroParcela INT, ValorParcela NUMERIC(18,2), DataVencimento DATE, DataPagamento DATE );

-- Inserindo Clientes INSERT INTO Cliente (CPF, Nome, UF, Celular) VALUES ('12345678901', 'João Silva', 'SP', '11999887766'); INSERT INTO Cliente (CPF, Nome, UF, Celular) VALUES ('98765432109', 'Maria Oliveira', 'RJ', '21988776655');

-- Inserindo Financiamentos INSERT INTO Financiamento (IdFinanciamento, CPF, TipoFinanciamento, ValorTotal, DataUltimoVencimento) VALUES (1, '12345678901', 'Imobiliário', 300000, '2024-12-31'); INSERT INTO Financiamento (IdFinanciamento, CPF, TipoFinanciamento, ValorTotal, DataUltimoVencimento) VALUES (2, '98765432109', 'Consorcio', 4900000, '2024-10-19');

-- Inserindo Parcelas INSERT INTO Parcela (IdParcela, IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (1, 1, 1, 5000, '2024-01-31', '2024-01-25'); INSERT INTO Parcela (IdParcela, IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (2, 1, 2, 5000, '2024-02-28', NULL); INSERT INTO [dbo].[Parcela] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (3, 1, 1, 15000, '2024-03-20', '2024-03-10');

INSERT INTO [dbo].[Parcela] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (3, 2, 1, 15000, '2024-04-23', '2024-04-30')

SELECT c.Nome, c.CPF FROM Cliente c JOIN Financiamento f ON c.CPF = f.CPF JOIN Parcela p ON f.IdFinanciamento = p.IdFinanciamento WHERE c.UF = 'SP' GROUP BY c.Nome, c.CPF HAVING (COUNT(p.DataPagamento) * 100 / COUNT(*)) > 60;

SELECT TOP 4 c.Nome, c.CPF FROM Cliente c JOIN Financiamento f ON c.CPF = f.CPF JOIN Parcela p ON f.IdFinanciamento = p.IdFinanciamento WHERE p.DataVencimento > DATEADD(DAY, 5, GETDATE()) AND p.DataPagamento IS NULL ORDER BY p.DataVencimento;

3 - Microsserviços são uma arquitetura de software que estrutura uma aplicação como um conjunto de serviços pequenos, independentes e modulares. Cada microsserviço executa um processo específico e se comunica através de APIs bem definidas. Esta abordagem difere da arquitetura monolítica, onde uma única aplicação é responsável por todas as funções.

Características dos Microsserviços: Independência: Cada microsserviço é independente dos outros, podendo ser desenvolvido, implantado, operado e escalado sem afetar os demais serviços.

Especialização: Cada serviço é focado em uma funcionalidade específica ou um conjunto de funcionalidades relacionadas, o que simplifica o desenvolvimento e a manutenção.

Comunicação Baseada em APIs: Os microsserviços se comunicam uns com os outros através de interfaces de programação de aplicativos (APIs), geralmente usando protocolos leves como REST ou gRPC.

Flexibilidade Tecnológica: Diferentes microsserviços podem ser escritos em diferentes linguagens de programação, usar diferentes tecnologias de armazenamento de dados e serem implantados em ambientes distintos.

Escalabilidade: Como os serviços são independentes, podem ser escalados individualmente conforme necessário, o que melhora a eficiência e o desempenho do sistema como um todo.

Resiliência: Falhas em um microsserviço geralmente não afetam outros serviços, o que aumenta a estabilidade geral do sistema.

