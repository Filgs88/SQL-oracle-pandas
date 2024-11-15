select ano_ordem_servico,
numero_ordem_servico,
numero_item_tarefa,
codigo_tarefa,
coalesce(horas,0) as horas

from industria.item_ordem_servico_tarefa

where item_ordem_servico_tarefa.ano_ordem_servico = 2024

order by numero_ordem_servico