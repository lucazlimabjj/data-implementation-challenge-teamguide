-- Consulta 1 — Headcount atual por time 
-- Resultado esperado (colunas): 
-- ● Nome dos times ativos (deleted_at = null) da empresa id = 204; 
-- ● Quantidade de colaboradores ativos atualmente em cada time; 
-- ● Líder do time. 
-- Decidi fazer o desafio usando views para abordar ele de maneira diferente.

SELECT 
tae.nome_time,
cat.quantidade,
lt.nome_lider
FROM times_ativos_empresa tae
LEFT JOIN colab_ativos_time cat
ON cat.nome_time = tae.nome_time
LEFT JOIN lider_time lt
ON lt.nome_time = cat.nome_time

CREATE VIEW times_ativos_empresa AS
SELECT 
nome as nome_time,
deletado_em as status,
id_empresa
FROM times t
WHERE t.deletado_em is NULL
AND id_empresa = 204

CREATE VIEW colab_ativos_time AS
SELECT 
t.nome as nome_time, 
COUNT(c.id) as quantidade
FROM times t
INNER JOIN membros m
ON m.id_time = t.id
INNER JOIN colaboradores c
ON c.id = m.id_colaborador
WHERE c.desligado IS FALSE
GROUP BY t.nome

CREATE VIEW lider_time AS
SELECT 
c.nome as nome_lider,
t.nome as nome_time
FRom colaboradores c
INNER JOIN lideres l
ON l.id_colaborador = c.id
INNER JOIN times t
ON t.id = l.id_time 

-- Consulta 2 — Histórico mensal (janeiro–julho/2025) 
-- Resultado esperado (colunas): 
-- ● Mês de referência (jan, fev, mar…); 
-- ● Nome dos times ativos (deleted_at = null) da empresa id = 204 em cada mês; 
-- ● Quantidade de colaboradores ativos no último dia do mês de referência em 
-- cada time.

SELECT 
  t.nome AS nome_time,
  COUNT(c.id) AS colaboradores_ativos
FROM times t
LEFT JOIN membros m 
ON m.id_time = t.id
LEFT JOIN colaboradores c 
ON c.id = m.id_colaborador
AND c.desligado IS FALSE
WHERE t.deletado_em IS NULL
GROUP BY t.nome
ORDER BY t.nome;




