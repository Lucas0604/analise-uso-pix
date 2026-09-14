-- 1. Liste as 10 primeiras linhas, ordenadas por valor_total_pix decrescente.
SELECT *
FROM tabela_pix
ORDER BY valor_total_pix DESC
LIMIT 10;

-- 2. Quantos registros (linhas) existem por segmento?
SELECT
	segmento,
    COUNT(*) AS QTD
FROM tabela_pix
GROUP BY segmento;

-- 3. Qual a qtd_transacoes_pix média e o valor_total_pix médio por segmento?
SELECT
	segmento,
    ROUND(AVG(qtd_transacoes_pix), 2) AS qtd_transacores_media,
    ROUND(AVG(valor_total_pix), 2) AS valor_total_pix_medio
FROM tabela_pix
GROUP BY segmento;

-- 4. Quantos clientes distintos (cliente_id) existem na base?
SELECT COUNT(DISTINCT cliente_id)
FROM tabela_pix;

-- 5. Filtre apenas o mês 2024-01 e conte quantos registros existem por canal_preferencial.
SELECT 
	canal_preferencial,
    COUNT(*) AS qtd
FROM tabela_pix
WHERE mes = '2024-01'
GROUP BY canal_preferencial;

-- 6. Qual o valor total de PIX transacionado em cada mês?
SELECT 
	mes,
    ROUND(SUM(valor_total_pix), 2) AS valor_total
FROM tabela_pix
GROUP BY mes;

-- 7. Liste os 10 clientes com maior valor_total_pix somado ao longo de todos os meses.
SELECT 
	cliente_id,
    ROUND(SUM(valor_total_pix), 2) as SOMA
FROM tabela_pix
GROUP BY cliente_id
ORDER BY SOMA DESC
LIMIT 10;

-- 8. Usando GROUP BY + HAVING, liste os segmentos com média de qtd_transacoes_pix abaixo de 8.
SELECT 
	segmento,
    AVG(qtd_transacoes_pix) AS media_transacoes_pix
FROM tabela_pix
GROUP BY segmento
HAVING media_transacoes_pix < 8;
 
-- 9. Quantos clientes usam o canal App como preferencial?
SELECT 
	COUNT(DISTINCT cliente_id)
FROM tabela_pix
WHERE canal_preferencial = 'App'; 

-- 10. Ordene os segmentos pela soma total de valor_total_pix, do maior para o menor.
SELECT 
	segmento,
    ROUND(SUM(valor_total_pix),2) AS soma_total
FROM tabela_pix
GROUP BY segmento
ORDER BY soma_total DESC;


