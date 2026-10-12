select 
    ano_ordem_servico,
    numero_ordem_servico,
    numero_item_tarefa,
    codigo_tarefa,
    coalesce(horas,0) as horas

from 
    industria.item_ordem_servico_tarefa

where 
    item_ordem_servico_tarefa.ano_ordem_servico >= to_number(to_char(sysdate - 365, 'yyyy'))

order by 
    numero_ordem_servico