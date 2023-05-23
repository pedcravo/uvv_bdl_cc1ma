
CREATE TABLE public.produtos (
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
COMMENT ON TABLE public.produtos IS 'Criar tabela "produtos", com a PK "produto_id".
Lista os produtos, seus nomes, preços e detalhes.';
COMMENT ON COLUMN public.produtos.produto_id IS 'Cria a coluna "produto_id", que é a PK da tabela "produtos".';
COMMENT ON COLUMN public.produtos.nome IS 'Cria a coluna "nome" dentro da tabela "produtos".';
COMMENT ON COLUMN public.produtos.preco_unitario IS 'Cria a coluna "preco_unitario" dentro da tabela "produtos".';
COMMENT ON COLUMN public.produtos.detalhes IS 'Cria a coluna "detalhes" dentro da tabela "produtos".';
COMMENT ON COLUMN public.produtos.imagem IS 'Cria a coluna "imagem" dentro da tabela "produtos".';
COMMENT ON COLUMN public.produtos.imagem_mime_type IS 'Cria a coluna "imagem_mime_type" dentro da tabela "produtos".';
COMMENT ON COLUMN public.produtos.imagem_arquivo IS 'Cria a coluna "imagem_arquivo" dentro da tabela "produtos".';
COMMENT ON COLUMN public.produtos.imagem_charset IS 'Cria a coluna "imagem_charset" dentro da tabela "produtos".';
COMMENT ON COLUMN public.produtos.imagem_ultima_atualizacao IS 'Cria a coluna "imagem_ultima_atualizacao" dentro da tabela "produtos".';


CREATE TABLE public.lojas (
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
COMMENT ON TABLE public.lojas IS 'Cria a tabela "lojas" com a PK "loja_id". Que lista os dados de cada loja.';
COMMENT ON COLUMN public.lojas.loja_id IS 'Cria a coluna "loja_id", que é a PK da tabela "lojas".';
COMMENT ON COLUMN public.lojas.nome IS 'Cria a coluna "nome", não pode ter valor "null"';
COMMENT ON COLUMN public.lojas.endereco_web IS 'Cria a coluna "endereco_web" dentro da tabela "lojas".';
COMMENT ON COLUMN public.lojas.endereco_fisico IS 'Cria a coluna "endereco_fisico" dentro da tabela "lojas".';
COMMENT ON COLUMN public.lojas.latitude IS 'Cria a coluna "latitude" dentro da tabela "lojas".';
COMMENT ON COLUMN public.lojas.longitude IS 'Cria a coluna "longitude" dentro da tabela "lojas".';
COMMENT ON COLUMN public.lojas.logo IS 'Cria a coluna "logo" dentro da tabela "lojas", os tipos de dados dessa coluna são "BLOB".';
COMMENT ON COLUMN public.lojas.logo_mime_type IS 'Cria a coluna "logo_mime_type" dentro da tabela "lojas".';
COMMENT ON COLUMN public.lojas.logo_arquivo IS 'Cria a coluna "logo_arquivo" dentro da tabela "lojas".';
COMMENT ON COLUMN public.lojas.logo_charset IS 'Cria a coluna "logo_charset" dentro da tabela "lojas".';
COMMENT ON COLUMN public.lojas.logo_ultima_atualizacao IS 'Cria a coluna "logo_ultima_atualizacao" dentro da tabela "lojas".';


CREATE TABLE public.estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT estoque_id PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE public.estoques IS 'Criar tabela "estoques", com a PK "estoque_id".
Lista o id de cada produto no estoque, id de cada loja que tem produtos em estoque e a quantidade de cada um.';
COMMENT ON COLUMN public.estoques.estoque_id IS 'Cria a coluna "estoque_id", que é a PK da tabela "estoques".';
COMMENT ON COLUMN public.estoques.loja_id IS 'Cria a coluna "loja_id", que é a PK da tabela "lojas".';
COMMENT ON COLUMN public.estoques.produto_id IS 'Cria a coluna "produto_id", que é a PK da tabela "produtos".';
COMMENT ON COLUMN public.estoques.quantidade IS 'Cria a coluna "quantidade" dentro da tabela "estoques".';


CREATE TABLE public.clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone3 VARCHAR(20),
                telefone2 VARCHAR(20),
                CONSTRAINT cliente_id PRIMARY KEY (cliente_id)
);
COMMENT ON TABLE public.clientes IS 'Criar tabela "clientes", com a PK "cliente_id".
Lista os emails, nomes e telefones de cada cliente, juntamente com o id próprio de cada um.';
COMMENT ON COLUMN public.clientes.cliente_id IS 'Cria a coluna "cliente_id", que é a PK da tabela "clientes".';
COMMENT ON COLUMN public.clientes.email IS 'Cria a coluna "email", que contem o email de cada cliente.';
COMMENT ON COLUMN public.clientes.nome IS 'Cria a tabela "nome", que lista o nome de cada cliente.';
COMMENT ON COLUMN public.clientes.telefone1 IS 'Cria  a  tabela "telefone1", não é uma tabela de preenchimento obrigatório.';
COMMENT ON COLUMN public.clientes.telefone3 IS 'Cria  a  tabela "telefone3", não é uma tabela de preenchimento obrigatório.';
COMMENT ON COLUMN public.clientes.telefone2 IS 'Cria  a  tabela "telefone2", não é uma tabela de preenchimento obrigatório.';


CREATE TABLE public.pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT pedido_id PRIMARY KEY (pedido_id)
);
COMMENT ON TABLE public.pedidos IS 'Criar tabela "pedidos", com a PK "pedido_id".
Lista os pedidos feitos, a hora de cada um, a id do cliente que fez o pedido e o id da loja que vai enviar.';
COMMENT ON COLUMN public.pedidos.pedido_id IS 'Cria a coluna "pedido_id", que é a PK, da tabela "pedidos".';
COMMENT ON COLUMN public.pedidos.cliente_id IS 'Cria a coluna "cliente_id", que é a PK da tabela "clientes".';
COMMENT ON COLUMN public.pedidos.loja_id IS 'Cria a coluna "loja_id", que é a PK da tabela "lojas".';
COMMENT ON COLUMN public.pedidos.data_hora IS 'Cria a coluna "data_hora" dentro da tabela "pedidos".';
COMMENT ON COLUMN public.pedidos.status IS 'Cria a coluna "status" dentro da tabela "pedidos".';


CREATE TABLE public.envios (
                envio_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT envio_id PRIMARY KEY (envio_id)
);
COMMENT ON TABLE public.envios IS 'Cria tabela "envios", que contém os dados dos envios de cada loja cadastrada.';
COMMENT ON COLUMN public.envios.envio_id IS 'Cria a coluna "envio_id", que é a PK.';
COMMENT ON COLUMN public.envios.cliente_id IS 'Cria a coluna "cliente_id", que é a PK da tabela "clientes".';
COMMENT ON COLUMN public.envios.loja_id IS 'Cria a coluna "loja_id", que é a PK da tabela "lojas".';
COMMENT ON COLUMN public.envios.endereco_entrega IS 'Cria a tabela "endereco_entrega", que não pode ter valor "null".';
COMMENT ON COLUMN public.envios.status IS 'Cria a coluna "status", que não pode te o valor "null".';


CREATE TABLE public.pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT pedido_id_e_produto_id PRIMARY KEY (pedido_id, produto_id)
);
COMMENT ON TABLE public.pedidos_itens IS 'Criar tabela "pedidos_itens", com a PFK "pedido_id" e "produto_id".
Essa tabela tem um relacionamento identificado com a tabela "pedidos" e "produtos".
Lista o id de cada produto no estoque, id de cada pedido, a quantidade, o numero da linha e o id do envio.';
COMMENT ON COLUMN public.pedidos_itens.pedido_id IS 'Cria a coluna "pedido_id", que é a PK, da tabela "pedidos".';
COMMENT ON COLUMN public.pedidos_itens.produto_id IS 'Cria a coluna "produto_id", que é a PK da tabela "produtos".';
COMMENT ON COLUMN public.pedidos_itens.envio_id IS 'Cria a coluna "envio_id", que é a PK.';
COMMENT ON COLUMN public.pedidos_itens.numero_da_linha IS 'Cria a coluna "numero_da_linha" dentro da tabela "pedidos_itens".';
COMMENT ON COLUMN public.pedidos_itens.preco_unitario IS 'Cria a coluna "preco_unitario" dentro da tabela "pedidos_itens".';
COMMENT ON COLUMN public.pedidos_itens.quantidade IS 'Cria a coluna "quantidade" dentro da tabela "pedidos_itens".';


ALTER TABLE public.estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES public.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES public.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES public.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES public.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES public.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES public.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES public.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES public.pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES public.envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
