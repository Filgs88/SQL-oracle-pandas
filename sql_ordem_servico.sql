with tabela1 as(
select item_ordem_servico_tarefa.NUMERO_ORDEM_SERVICO
,coalesce(sum(item_ordem_servico_tarefa.horas),0) as horas_tarefa

from industria.item_ordem_servico_tarefa

where item_ordem_servico_tarefa.ano_ordem_servico >= 2024

group by item_ordem_servico_tarefa.NUMERO_ORDEM_SERVICO)

, tabela2 as(
select item_ordem_servico_apont.NUMERO_ORDEM_SERVICO
,coalesce(sum(item_ordem_servico_apont.TOTHORAS_TRABALHADAS),0) as horas_apont

from industria.item_ordem_servico_apont

where item_ordem_servico_apont.ano_ordem_servico >= 2024

group by item_ordem_servico_apont.NUMERO_ORDEM_SERVICO)

select ordem_servico.ano_ordem_servico
,ordem_servico.NUMERO_ORDEM_SERVICO
,ordem_servico.CODIGO_CTE_ALFA
,ordem_servico.cod_funcionario
,coalesce(tabela1.horas_tarefa,0) as horas_tarefa
,coalesce(tabela2.horas_apont,0) as horas_apont
,ordem_servico.CODIGO_DESTINO_MANUTENCAO
,ordem_servico.CODIGO_TIPOMANUTENCAO
,ordem_servico.codigo_prioridade
,ordem_servico.SOLITACAO_SERVICO
,ordem_servico.data_abertura
,ordem_servico.DATA_ENCERRAMENTO
,ordem_servico.DATAHORA_ACEITE

from industria.ordem_servico
,tabela1
,tabela2

where ordem_servico.ano_ordem_servico >= 2024
and tabela1.NUMERO_ORDEM_SERVICO (+)= ordem_servico.NUMERO_ORDEM_SERVICO
and tabela2.NUMERO_ORDEM_SERVICO (+)= ordem_servico.NUMERO_ORDEM_SERVICO


order by ordem_servico.numero_ordem_servico