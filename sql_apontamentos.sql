select data_inicio,
cod_funcionario,
coalesce(tothoras_trabalhadas,0) as tothoras_trabalhadas,
ano_ordem_servico,
numero_ordem_servico,
codigo_tarefa,
codigo_tarefa || '-' || numero_ordem_servico || '-' || ano_ordem_servico as ID

from industria.item_ordem_servico_apont

where data_inicio >= to_date('01/01/2024','dd/mm/yyyy')

order by data_inicio