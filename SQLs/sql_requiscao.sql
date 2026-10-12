select 
    irm.nrrequisicao,
	irm.item,
    req.datarequisicao,
    irm.dataretirada,
	irm.cod_material,
	mm.descricao,
	coalesce(irm.quantidade,0) as quantidade,
	coalesce(irm.vrcustounitario,0) as custo_unitario,
	coalesce((irm.quantidade * irm.vrcustounitario),0) as custo_total,
	irm.codigo_cte,
	irm.cod_funcionario_retirar,
	irm.cod_objetocusto_ativo

from 
    material.itensrequisicaomaterial irm

left join 
    material.material mm on irm.cod_material = mm.cod_material
left join 
    material.requisicaomaterial req on irm.nrrequisicao = req.nrrequisicao

where 
    irm.datarequisicao_item > to_date(to_char(sysdate - 180, 'dd/mm/yyyy')) and
	irm.cod_almoxarifado = 8

order by 
    req.datarequisicao, irm.nrrequisicao