SELECT * FROM colaboradores;  -- Verificando tabelas a serem usadas
SELECT * FROM membros;        -- Verificando tabelas a serem usadas                              
SELECT * FROM lideres;        -- Verificando tabelas a serem usadas

UPDATE colaboradores c        -- Comando de atualização da tabela colaboradores que recebe alias "c"
SET desligado = TRUE          -- Definindo que a coluna "desligado" recebe o valor "TRUE" caso..
WHERE id_empresa = 123        -- Condicional que diz que o colaborador tem que ser da empresa com o id 123
AND data_admissao between '2025-02-01' AND '2025-04-01'  -- condicional que define o periodo de admissão do colaborador 
AND EXISTS(                   -- Condicional que verifica se o colaborador é um membro e está no time 12
SELECT 1
FROM membros m 
WHERE m.id_colaborador = c.id
AND id_time = 12
) 
AND NOT EXISTS(               -- Condicional que verifica se o colaborador não é o lider do time 12
SELECT 1 
FROM lideres l
where l.id_colaborador = c.id
and id_time =12
)










