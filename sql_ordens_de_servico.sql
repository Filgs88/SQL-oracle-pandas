with tbl_apont as (
	select id_vinc,
	sum(tothoras_trabalhadas) as horas_apont

	from (
		select ano_ordem_servico || '-' || numero_ordem_servico || '-' || codigo_tarefa as id_vinc,
			tothoras_trabalhadas

		from industria.item_ordem_servico_apont

		where ano_ordem_servico >= 2025
	)

	group by id_vinc
),

tbl_tarefas as (
	select *

	from (
		select ano_ordem_servico || ' / ' || numero_ordem_servico as id,
			ano_ordem_servico || '-' || numero_ordem_servico || '-' || codigo_tarefa as id_vinc,
			numero_item_tarefa,
			codigo_tarefa,
			floor(horas) + ((horas - floor(horas)) * 60 / 100) as horas_planej,
	        floor(tbl_apont.horas_apont) + ((tbl_apont.horas_apont - floor(tbl_apont.horas_apont)) * 60 / 100) as horas_apont
	
		from industria.item_ordem_servico_tarefa

        left join tbl_apont on ano_ordem_servico || '-' || numero_ordem_servico || '-' || codigo_tarefa = tbl_apont.id_vinc
	
		where ano_ordem_servico >= 2025
	)
)

select ordem_servico.ano_ordem_servico || ' / ' || ordem_servico.numero_ordem_servico as id,
	ordem_servico.solitacao_servico,
	ordem_servico.codigo_cte_alfa,
	ordem_servico.cod_objetocusto,
	ordem_servico.cod_funcionario,
	ordem_servico.codigo_destino_manutencao,
	ordem_servico.codigo_tipomanutencao,
	ordem_servico.codigo_prioridade,
	tbl_tarefas.codigo_tarefa,
	coalesce(tbl_tarefas.horas_planej, 0) as horas_planej,
	coalesce(tbl_tarefas.horas_apont, 0) as horas_apont,
	ordem_servico.data_abertura,
	ordem_servico.data_encerramento,
	ordem_servico.data_cancelamento

from industria.ordem_servico

left join tbl_tarefas on ordem_servico.ano_ordem_servico || ' / ' || ordem_servico.numero_ordem_servico = tbl_tarefas.id

where ordem_servico.data_abertura > to_date('01/05/2025', 'dd/mm/yyyy')

order by id