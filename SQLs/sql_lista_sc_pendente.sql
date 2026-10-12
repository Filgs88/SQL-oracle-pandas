select
    SolComp.nr_solicitacao as solicitacao,
    itensreq.nrrequisicao,
	SolComp.data,
	AprSol.dataaprovacao as apr_solicitacao,
	AprComp.dataaprovacao as apr_compra,
	OrdComp.nroc as ordem_compra,
	SolComp.cod_material,
	Mat.descricao,
	coalesce(SolComp.qtdesolicitada,0) as quantidade,
	Mat.cod_unidade,
	SolComp.observacao,
	SolComp.informacao_fornecedor,
	SolComp.situacao

from
    material.solicitacaocompra SolComp

left join 
    material.aprovacaoparacompra AprComp on SolComp.nr_solicitacao = AprComp.nr_solicitacao
left join 
    material.aprovacaosolicitacaocompra AprSol on SolComp.nr_solicitacao = AprSol.nr_solicitacao
left join 
    material.material Mat on SolComp.cod_material = Mat.cod_material
left join 
    material.itensordemcompra OrdComp on SolComp.nr_solicitacao = OrdComp.nr_solicitacao
left join 
    material.itensrequisicaomaterial itensreq on SolComp.nr_solicitacao = itensreq.nr_solicitacao

where
    SolComp.data >= to_date(to_char(sysdate - 180, 'dd/mm/yyyy')) and
	SolComp.cod_almoxarifado = 8

order by
    SolComp.nr_solicitacao desc