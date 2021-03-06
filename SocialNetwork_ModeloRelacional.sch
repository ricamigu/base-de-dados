/*
 https://github.com/edrdo/dbdia
*/

table CLIENTE 
( 
  _ NumCC _ int, 
  Nome varchar, 
  DataNascimento date,  
  Genero enum,
  Email ? varchar,
  Morada_Rua varchar,
  Morada_NumRua int,
  Morada_Andar ? int,
  Morada_Localidade varchar,
  Morada_CodPostal varchar
)

table DEPARTAMENTO
( 
   _ NomeDepartamento _ varchar,
   Gestor int --> FUNCIONARIO.IdFuncionario
)

table FUNCIONARIO
( 
  _ IdFuncionario _ int, 
  Nome varchar,
  NumCC int,
  DataNascimento date,
  Email ? varchar,
  Departamento varchar --> DEPARTAMENTO.NomeDepartamento,
  Supervisor ? int --> FUNCIONARIO.IdFuncionario,
  HorasTrabalho int, 
  Gere ? varchar
)




table ENCOMENDAS
(
  _ NumCC _ int --> CLIENTE.NumCC,
  IdEmpresa int --> FORNECEDOR.IdEmpresa,
  IdProduto int --> PRODUTO.IdProduto,
  Quantidade int,
  Custo decimal
  
)

table FORNECEDOR
(
 _ IdEmpresa _ int,
 NomeEmpresa varchar,
 IdProduto int --> PRODUTO.IdProduto,
 NomeProduto varchar,
 Custo decimal,
 Comissao decimal
)


table NUM_TELEMOVEL_FUNCIONARIO
(
  _ IdFuncionario _ --> FUNCIONARIO.IdFuncionario,
  _ NumTelemovel _ int
)

table NUM_TELEMOVEL_CLIENTE
(
  _ NumCC _ int --> CLIENTE.NumCC,
  _ NumTelemovel _ int 
)

table PRODUTO
(
  _ IdProduto _ int,
  Nome varchar,
  Custo decimal,
  IdEmpresa --> FORNECEDOR.IdEmpresa,
  Quantidade int
)
