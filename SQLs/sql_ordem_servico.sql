with tabela1 as(
    select 
        item_ordem_servico_tarefa.numero_ordem_servico
        ,coalesce(sum(item_ordem_servico_tarefa.horas),0) as horas_tarefa
    
    from 
        industria.item_ordem_servico_tarefa
    
    where 
        item_ordem_servico_tarefa.ano_ordem_servico = 2025
    
    group by 
        item_ordem_servico_tarefa.numero_ordem_servico
),

tabela2 as(
    select 
        item_ordem_servico_apont.numero_ordem_servico
        ,coalesce(sum(item_ordem_servico_apont.tothoras_trabalhadas),0) as horas_apont
    
    from 
        industria.item_ordem_servico_apont
    
    where 
        item_ordem_servico_apont.ano_ordem_servico = 2025
    
    group by 
        item_ordem_servico_apont.numero_ordem_servico
)

select 
    ordem_servico.ano_ordem_servico
    ,ordem_servico.numero_ordem_servico
    ,ordem_servico.codigo_cte_alfa
    ,ordem_servico.cod_funcionario
    ,coalesce(tabela1.horas_tarefa,0) as horas_tarefa
    ,coalesce(tabela2.horas_apont,0) as horas_apont
    ,ordem_servico.codigo_destino_manutencao
    ,ordem_servico.codigo_tipomanutencao
    ,ordem_servico.codigo_prioridade
    ,ordem_servico.solitacao_servico
    ,ordem_servico.data_abertura
    ,ordem_servico.data_encerramento
    ,ordem_servico.datahora_aceite

from 
    industria.ordem_servico
    ,tabela1
    ,tabela2

where 
    ordem_servico.data_abertura >= to_date('01/03/2025', 'dd/mm/yyyy')
    and tabela1.numero_ordem_servico (+)= ordem_servico.numero_ordem_servico
    and tabela2.numero_ordem_servico (+)= ordem_servico.numero_ordem_servico

order by 
    ordem_servico.numero_ordem_servico