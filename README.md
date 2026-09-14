# PIX em Números — Adoção e Queda de Uso por Segmento

Análise exploratória (EDA) da evolução do uso de PIX ao longo de 6 meses, simulando uma demanda do time de Produto de um banco digital.

## Contexto

Simulação de uma demanda do time de Produto de um banco digital: entender a adoção do PIX por segmento de cliente e, principalmente, identificar clientes que reduziram o uso — sinal possível de migração para outro banco ou insatisfação com o produto.

## Problema de negócio

O time de Produto não tinha visibilidade de quais clientes estavam reduzindo o uso do PIX mês a mês, o que dificultava agir antes de uma possível perda desses clientes para a concorrência.

## Objetivo

Mapear a adoção do PIX por segmento ao longo do tempo e identificar os clientes com maior queda no número de transações entre o primeiro e o último mês analisado.

## Dataset

**Dataset simulado.** Não existe base pública real de PIX no nível de cliente individual (o Banco Central só publica estatísticas agregadas, por privacidade). Foi gerado um dataset sintético de 500 clientes ao longo de 6 meses (~3.000 linhas), com 15% dos clientes simulando queda progressiva de uso — para permitir a prática de detecção desse padrão.

- **Colunas:** `cliente_id`, `mes`, `segmento` (PF Varejo / PF Alta Renda / PJ Pequeno Negócio), `idade`, `qtd_transacoes_pix`, `valor_total_pix`, `canal_preferencial`

## Ferramentas

- SQL (MySQL) para exploração e métricas agregadas
- Python (pandas, matplotlib) para inspeção, séries temporais e EDA
- Jupyter Notebook

## Metodologia

1. Exploração inicial via SQL: volume e ticket médio por segmento, evolução mensal do valor total.
2. Em Python: conversão de datas, comparação do primeiro vs. último mês por cliente para identificar quedas de uso.
3. Visualização da evolução mensal por segmento.

## Principais análises

- Volume e frequência média de transações por segmento
- Evolução do valor total de PIX mês a mês
- Diferença entre transações do primeiro e do último mês, por cliente
- Ranking dos 10 clientes com maior queda de uso

## Principais insights

- O segmento **PJ Pequeno Negócio** tem a maior média de transações por cliente (~34,8/mês), seguido de PF Alta Renda (~20,2) e PF Varejo (~9,4) — perfil de negócio usa o PIX com muito mais frequência que pessoa física.
- O valor total transacionado no mês caiu de forma constante ao longo do período (~13% de queda entre janeiro e junho), puxado pelo grupo de clientes em queda de uso.
- Um grupo de clientes (ex: C0181, C0179, C0430) apresentou quedas de mais de 30 transações entre o primeiro e o último mês — os principais candidatos a uma ação de retenção.
- O canal `App` tem ticket médio de ~R$ 3.791 por transação.

## Recomendações

- Priorizar contato/retenção com os clientes do ranking de maior queda, começando pelos de maior valor histórico.
- Investigar se a queda está concentrada em algum segmento ou canal específico, para direcionar a causa (ex: problema no app, concorrência, mudança de hábito).
- Acompanhar a métrica de queda mês a mês como indicador recorrente, não só uma análise pontual.

## Limitações

- Dataset simulado — os padrões de queda foram gerados artificialmente para fins didáticos e não reflitam comportamento real de clientes.
- Apenas 6 meses de histórico; tendências sazonais não podem ser avaliadas.

## Conclusão

A análise mostra como comparar o comportamento de um cliente ao longo do tempo (não só uma foto estática) já é suficiente para levantar uma lista acionável de clientes em risco de abandono do produto — uma prática central em times de Customer Analytics.

## Como executar

```bash
pip install pandas matplotlib
```

1. Use o `pix_uso_mensal.csv` gerado para este projeto.
2. Rode os scripts SQL em `sql/` em um banco MySQL.
3. Abra o notebook em `python/` no Jupyter.
