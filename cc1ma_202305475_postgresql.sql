-- Exclui o banco de dados uvv caso exista
DROP DATABASE IF EXISTS uvv;

-- Exclui o usuario Pedro_Cravo caso exista
DROP USER IF EXISTS Pedro_Cravo;

-- Criação do usuário Pedro_Cravo
CREATE USER Pedro_Cravo WITH PASSWORD 'senha' CREATEDB CREATEROLE;

-- Criação do banco de dados uvv
CREATE DATABASE uvv
  OWNER = Pedro_Cravo
  TEMPLATE = template0
  ENCODING = 'UTF8'
  LC_COLLATE = 'pt_BR.UTF-8'
  LC_CTYPE = 'pt_BR.UTF-8'
  CONNECTION LIMIT = -1;

-- Conexão com o banco de dados uvv
\c "host=localhost dbname=uvv user=Pedro_Cravo password='senha'"

-- Criação do schema lojas
CREATE SCHEMA lojas;

-- Definindo o caminho de pesquisa padrão para o usuário Pedro_Cravo
ALTER USER Pedro_Cravo
SET SEARCH_PATH TO lojas, $user, public;


-- Criando a tabelas produtos
CREATE TABLE lojas.produtos (
    produto_id NUMERIC(38) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    preco_unitario NUMERIC(10,2),
    detalhes BYTEA,
    imagem BYTEA,
    imagem_mime_type VARCHAR(512),
    imagem_arquivo VARCHAR(512),
    imagem_charset VARCHAR(512),
    imagem_ultima_atualizacao DATE,
    CONSTRAINT produto_id PRIMARY KEY (produto_id)
);

-- Comentários da tabela produtos
COMMENT ON TABLE lojas.produtos IS 'Criar tabela "produtos", com a PK "produto_id".
Lista os produtos, seus nomes, preços e detalhes.';
COMMENT ON COLUMN lojas.produtos.produto_id IS 'Cria a coluna "produto_id", que é a PK da tabela "produtos".';
COMMENT ON COLUMN lojas.produtos.nome IS 'Cria a coluna "nome" dentro da tabela "produtos".';
COMMENT ON COLUMN lojas.produtos.preco_unitario IS 'Cria a coluna "preco_unitario" dentro da tabela "produtos".';
COMMENT ON COLUMN lojas.produtos.detalhes IS 'Cria a coluna "detalhes" dentro da tabela "produtos".';
COMMENT ON COLUMN lojas.produtos.imagem IS 'Cria a coluna "imagem" dentro da tabela "produtos".';
COMMENT ON COLUMN lojas.produtos.imagem_mime_type IS 'Cria a coluna "imagem_mime_type" dentro da tabela "produtos".';
COMMENT ON COLUMN lojas.produtos.imagem_arquivo IS 'Cria a coluna "imagem_arquivo" dentro da tabela "produtos".';
COMMENT ON COLUMN lojas.produtos.imagem_charset IS 'Cria a coluna "imagem_charset" dentro da tabela "produtos".';
COMMENT ON COLUMN lojas.produtos.imagem_ultima_atualizacao IS 'Cria a coluna "imagem_ultima_atualizacao" dentro da tabela "produtos".';

-- Criando a tabela lojas
CREATE TABLE lojas.lojas (
    loja_id NUMERIC(38) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    endereco_web VARCHAR(100),
    endereco_fisico VARCHAR(512),
    latitude NUMERIC,
    longitude NUMERIC,
    logo BYTEA,
    logo_mime_type VARCHAR(512),
    logo_arquivo VARCHAR(512),
    logo_charset VARCHAR(512),
    logo_ultima_atualizacao DATE,
    CONSTRAINT loja_id PRIMARY KEY (loja_id)
);

-- Comentários da tabela lojas
COMMENT ON TABLE lojas.lojas IS 'Cria a tabela "lojas" com a PK "loja_id". Que lista os dados de cada loja.';
COMMENT ON COLUMN lojas.lojas.loja_id IS 'Cria a coluna "loja_id", que é a PK da tabela "lojas".';
COMMENT ON COLUMN lojas.lojas.nome IS 'Cria a coluna "nome", não pode ter valor "null"';
COMMENT ON COLUMN lojas.lojas.endereco_web IS 'Cria a coluna "endereco_web" dentro da tabela "lojas".';
COMMENT ON COLUMN lojas.lojas.endereco_fisico IS 'Cria a coluna "endereco_fisico" dentro da tabela "lojas".';
COMMENT ON COLUMN lojas.lojas.latitude IS 'Cria a coluna "latitude" dentro da tabela "lojas".';
COMMENT ON COLUMN lojas.lojas.longitude IS 'Cria a coluna "longitude" dentro da tabela "lojas".';
COMMENT ON COLUMN lojas.lojas.logo IS 'Cria a coluna "logo" dentro da tabela "lojas", os tipos de dados dessa coluna são "BLOB".';
COMMENT ON COLUMN lojas.lojas.logo_mime_type IS 'Cria a coluna "logo_mime_type" dentro da tabela "lojas".';
COMMENT ON COLUMN lojas.lojas.logo_arquivo IS 'Cria a coluna "logo_arquivo" dentro da tabela "lojas".';
COMMENT ON COLUMN lojas.lojas.logo_charset IS 'Cria a coluna "logo_charset" dentro da tabela "lojas".';
COMMENT ON COLUMN lojas.lojas.logo_ultima_atualizacao IS 'Cria a coluna "logo_ultima_atualizacao" dentro da tabela "lojas".';

-- Criando a tabela estoques
CREATE TABLE lojas.estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT estoque_id PRIMARY KEY (estoque_id)
);

-- Comentários da tabela estoques
COMMENT ON TABLE lojas.estoques IS 'Criar tabela "estoques", com a PK "estoque_id".
Lista o id de cada produto no estoque, id de cada loja que tem produtos em estoque e a quantidade de cada um.';
COMMENT ON COLUMN lojas.estoques.estoque_id IS 'Cria a coluna "estoque_id", que é a PK da tabela "estoques".';
COMMENT ON COLUMN lojas.estoques.loja_id IS 'Cria a coluna "loja_id", que é a PK da tabela "lojas".';
COMMENT ON COLUMN lojas.estoques.produto_id IS 'Cria a coluna "produto_id", que é a PK da tabela "produtos".';
COMMENT ON COLUMN lojas.estoques.quantidade IS 'Cria a coluna "quantidade" dentro da tabela "estoques".';

-- Criando a tabela clientes
CREATE TABLE lojas.clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone3 VARCHAR(20),
                telefone2 VARCHAR(20),
                CONSTRAINT cliente_id PRIMARY KEY (cliente_id)
);

-- Comentários da tabela clientes
COMMENT ON TABLE lojas.clientes IS 'Criar tabela "clientes", com a PK "cliente_id".
Lista os emails, nomes e telefones de cada cliente, juntamente com o id próprio de cada um.';
COMMENT ON COLUMN lojas.clientes.cliente_id IS 'Cria a coluna "cliente_id", que é a PK da tabela "clientes".';
COMMENT ON COLUMN lojas.clientes.email IS 'Cria a coluna "email", que contem o email de cada cliente.';
COMMENT ON COLUMN lojas.clientes.nome IS 'Cria a tabela "nome", que lista o nome de cada cliente.';
COMMENT ON COLUMN lojas.clientes.telefone1 IS 'Cria  a  tabela "telefone1", não é uma tabela de preenchimento obrigatório.';
COMMENT ON COLUMN lojas.clientes.telefone3 IS 'Cria  a  tabela "telefone3", não é uma tabela de preenchimento obrigatório.';
COMMENT ON COLUMN lojas.clientes.telefone2 IS 'Cria  a  tabela "telefone2", não é uma tabela de preenchimento obrigatório.';

-- Criando a tabela pedidos
CREATE TABLE lojas.pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT pedido_id PRIMARY KEY (pedido_id)
);

-- Comentários da tabela pedidos
COMMENT ON TABLE lojas.pedidos IS 'Criar tabela "pedidos", com a PK "pedido_id".
Lista os pedidos feitos, a hora de cada um, a id do cliente que fez o pedido e o id da loja que vai enviar.';
COMMENT ON COLUMN lojas.pedidos.pedido_id IS 'Cria a coluna "pedido_id", que é a PK, da tabela "pedidos".';
COMMENT ON COLUMN lojas.pedidos.cliente_id IS 'Cria a coluna "cliente_id", que é a PK da tabela "clientes".';
COMMENT ON COLUMN lojas.pedidos.loja_id IS 'Cria a coluna "loja_id", que é a PK da tabela "lojas".';
COMMENT ON COLUMN lojas.pedidos.data_hora IS 'Cria a coluna "data_hora" dentro da tabela "pedidos".';
COMMENT ON COLUMN lojas.pedidos.status IS 'Cria a coluna "status" dentro da tabela "pedidos".';

-- Criando a tabela envios
CREATE TABLE lojas.envios (
                envio_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT envio_id PRIMARY KEY (envio_id)
);

-- Comentários da tabela envios
COMMENT ON TABLE lojas.envios IS 'Cria tabela "envios", que contém os dados dos envios de cada loja cadastrada.';
COMMENT ON COLUMN lojas.envios.envio_id IS 'Cria a coluna "envio_id", que é a PK.';
COMMENT ON COLUMN lojas.envios.cliente_id IS 'Cria a coluna "cliente_id", que é a PK da tabela "clientes".';
COMMENT ON COLUMN lojas.envios.loja_id IS 'Cria a coluna "loja_id", que é a PK da tabela "lojas".';
COMMENT ON COLUMN lojas.envios.endereco_entrega IS 'Cria a tabela "endereco_entrega", que não pode ter valor "null".';
COMMENT ON COLUMN lojas.envios.status IS 'Cria a coluna "status", que não pode ter o valor "null".'; 

-- Criando a tabela pedidos_itens
CREATE TABLE lojas.pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT pedido_id_e_produto_id PRIMARY KEY (pedido_id, produto_id)
);

-- Comentários da tabela pedidos_itens
COMMENT ON TABLE lojas.pedidos_itens IS 'Criar tabela "pedidos_itens", com a PFK "pedido_id" e "produto_id".
Essa tabela tem um relacionamento identificado com a tabela "pedidos" e "produtos".
Lista o id de cada produto no estoque, id de cada pedido, a quantidade, o numero da linha e o id do envio.';
COMMENT ON COLUMN lojas.pedidos_itens.pedido_id IS 'Cria a coluna "pedido_id", que é a PK, da tabela "pedidos".';
COMMENT ON COLUMN lojas.pedidos_itens.produto_id IS 'Cria a coluna "produto_id", que é a PK da tabela "produtos".';
COMMENT ON COLUMN lojas.pedidos_itens.envio_id IS 'Cria a coluna "envio_id", que é a PK.';
COMMENT ON COLUMN lojas.pedidos_itens.numero_da_linha IS 'Cria a coluna "numero_da_linha" dentro da tabela "pedidos_itens".';
COMMENT ON COLUMN lojas.pedidos_itens.preco_unitario IS 'Cria a coluna "preco_unitario" dentro da tabela "pedidos_itens".';
COMMENT ON COLUMN lojas.pedidos_itens.quantidade IS 'Cria a coluna "quantidade" dentro da tabela "pedidos_itens".';


-- Criando relacionamento com a FK produto_id em estoques
ALTER TABLE lojas.estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Criando relacionamento com a FK produto_id em pedidos_itens
ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Criando relacionamento com a FK loja_id em envios 
ALTER TABLE lojas.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Criando relacionamento com a FK loja_id em pedidos
ALTER TABLE lojas.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Criando relacionamento com a FK loja_id em estoques
ALTER TABLE lojas.estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Criando relacionamento com a FK cliente_id em envios
ALTER TABLE lojas.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Criando relacionamento com a FK cliente_id em pedidos
ALTER TABLE lojas.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Criando relacionamento com a FK pedido_id em pedidos_itens
ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES lojas.pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Criando relacionamento com a FK envio_id em pedidos_itens
ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES lojas.envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


-- Adicionando a restrição na coluna status da tabela pedidos
ALTER TABLE lojas.pedidos
ADD CONSTRAINT check_status
CHECK (status IN ('CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO'));

-- Adicionando a restrição na coluna status da tabela envios
ALTER TABLE lojas.envios
ADD CONSTRAINT check_status
CHECK (status IN ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'));

-- Adicionando a restrição na coluna preco_unitario da tabela produtos
ALTER TABLE lojas.produtos
ADD CONSTRAINT check_preco_unitario_positivo
CHECK (preco_unitario >= 0);

-- Adicionando a restrição na coluna preco_unitario da tabela pedidos_itens
ALTER TABLE lojas.pedidos_itens
ADD CONSTRAINT check_preco_unitario_positivo
CHECK (preco_unitario >= 0);

-- Adicionando a restrição na coluna quantidade da tabela pedidos_itens
ALTER TABLE lojas.pedidos_itens
ADD CONSTRAINT check_quantidade_positivo
CHECK (quantidade >= 0);

-- Adicionando a restrição na coluna quantidade da tabela estoques
ALTER TABLE lojas.estoques
ADD CONSTRAINT check_quantidade_positivo
CHECK (quantidade >= 0);

-- Adicionando a restrição nas colunas endereco_web e endereco_fisico da tabela lojas
ALTER TABLE lojas.lojas
ADD CONSTRAINT check_endereco_preenchido
CHECK (endereco_web IS NOT NULL OR endereco_fisico IS NOT NULL);
