-- ============================================================
-- ENUMS (LISTAS DE VALORES FIXOS)
-- ============================================================

CREATE TYPE status_plano AS ENUM ('IN_PROGRESS', 'CONCLUDED');
CREATE TYPE status_acao AS ENUM ('PENDING', 'IN_PROGRESS', 'CONCLUDED');

-- ============================================================
-- TABELA: EMPRESAS
-- ============================================================

CREATE TABLE empresas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL
);

-- ============================================================
-- TABELA: COLABORADORES
-- ============================================================

CREATE TABLE colaboradores (
    id SERIAL PRIMARY KEY,                               -- Identificador único
    cpf CHAR(11) UNIQUE NOT NULL,                        -- CPF (somente números)
    nome VARCHAR(200) NOT NULL,                          -- Nome completo
    email VARCHAR(254) NOT NULL,                         -- E-mail corporativo
    data_nascimento DATE,                                -- Data de nascimento
    data_admissao DATE,                                  -- Data de entrada na empresa
    id_empresa INT NOT NULL REFERENCES empresas(id) ON DELETE CASCADE ON UPDATE CASCADE,
    desligado BOOLEAN DEFAULT FALSE,                     -- FALSE = ativo / TRUE = demitido
    CONSTRAINT chk_cpf_tamanho CHECK (char_length(cpf) = 11)
);

-- ============================================================
-- TABELA: TIMES
-- ============================================================

CREATE TABLE times (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    id_empresa INT NOT NULL REFERENCES empresas(id) ON DELETE CASCADE ON UPDATE CASCADE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deletado_em TIMESTAMP
);

-- ============================================================
-- TABELA: LÍDERES
-- ============================================================

CREATE TABLE lideres (
    id SERIAL PRIMARY KEY,
    id_colaborador INT NOT NULL REFERENCES colaboradores(id) ON DELETE CASCADE ON UPDATE CASCADE,
    id_time INT NOT NULL REFERENCES times(id) ON DELETE CASCADE ON UPDATE CASCADE,
    desde DATE NOT NULL
);

-- ============================================================
-- TABELA: MEMBROS (ATIVOS)
-- ============================================================

CREATE TABLE membros (
    id SERIAL PRIMARY KEY,
    id_colaborador INT NOT NULL REFERENCES colaboradores(id) ON DELETE CASCADE,
    id_time INT NOT NULL REFERENCES times(id) ON DELETE CASCADE ON UPDATE CASCADE,
    desde DATE NOT NULL
);

-- ============================================================
-- TABELA: EX-MEMBROS (HISTÓRICO)
-- ============================================================

CREATE TABLE ex_membros (
    id SERIAL PRIMARY KEY,
    id_colaborador INT NOT NULL REFERENCES colaboradores(id) ON DELETE CASCADE ON UPDATE CASCADE,
    id_time INT NOT NULL REFERENCES times(id) ON DELETE CASCADE,
    data_inicio DATE,
    data_fim DATE
);

-- ============================================================
-- TABELA: PLANOS DE DESENVOLVIMENTO INDIVIDUAL (PDI)
-- ============================================================

CREATE TABLE plano_pdi (
    id SERIAL PRIMARY KEY,
    id_colaborador INT NOT NULL REFERENCES colaboradores(id) ON DELETE CASCADE ON UPDATE CASCADE,
    nome VARCHAR(1024) NOT NULL,                         -- Nome do PDI
    descricao TEXT,                                      -- Descrição opcional
    data_inicio DATE NOT NULL,                           -- Data de início do PDI
    data_termino DATE NOT NULL,                          -- Data de término do PDI
    status status_plano DEFAULT 'IN_PROGRESS' NOT NULL,  -- IN_PROGRESS, CONCLUDED
    CONSTRAINT chk_datas_pdi CHECK (data_termino >= data_inicio)
);

-- ============================================================
-- TABELA: AÇÕES DO PDI
-- ============================================================

CREATE TABLE acoes_pdi (
    id SERIAL PRIMARY KEY,
    id_plano INT NOT NULL REFERENCES plano_pdi(id) ON DELETE CASCADE ON UPDATE CASCADE,
    titulo VARCHAR(255) NOT NULL,                        -- Título da ação
    descricao TEXT,                                      -- Descrição opcional
    data_limite DATE NOT NULL,                           -- Data limite da ação
    status status_acao DEFAULT 'PENDING' NOT NULL,       -- PENDING, IN_PROGRESS, CONCLUDED
    CONSTRAINT chk_data_acao CHECK (data_limite >= CURRENT_DATE - INTERVAL '10 years')
);

-- ============================================================
-- RESTRIÇÕES ADICIONAIS E RELACIONAMENTOS
-- ============================================================

-- Plano deve sempre pertencer a um colaborador existente
ALTER TABLE plano_pdi
ADD CONSTRAINT fk_plano_colaborador FOREIGN KEY (id_colaborador)
REFERENCES colaboradores (id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Ações devem sempre pertencer a um plano existente
ALTER TABLE acoes_pdi
ADD CONSTRAINT fk_acao_plano FOREIGN KEY (id_plano)
REFERENCES plano_pdi (id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ============================================================
-- VISÃO GERAL DAS TABELAS
-- ============================================================
-- empresas        → cadastro de empresas.
-- colaboradores   → informações dos colaboradores.
-- times           → estrutura organizacional.
-- lideres         → vínculo entre líder e time.
-- membros         → colaboradores ativos em times.
-- ex_membros      → histórico de vínculos antigos.
-- plano_pdi       → planos de desenvolvimento individual.
-- acoes_pdi       → ações associadas a cada PDI.
-- ============================================================
