select 
    nroc,
	dataoc,
	nr_solicitacao,
	cod_material,
	qtd_solicitada,
	preco,
	cod_fornecedor,
	sequencia_nf,
	nrnf

from (
    select 
        itensordemcompra.nroc,
		ordemcompra.dataoc,
		itensordemcompra.nr_solicitacao,
		itensordemcompra.cod_material,
		coalesce(itensordemcompra.quantidade_solic, 0) as qtd_solicitada,
		coalesce(itensordemcompra.preco, 0) as preco,
		ordemcompra.cod_fornecedor,
		itensentrada.sequencia_nf,
		itensentrada.nrnf,
		solicitacaocompra.cod_almoxarifado,
		row_number() over (partition by itensordemcompra.nr_solicitacao order by itensordemcompra.nroc) as id_sqc

	from 
	    material.itensordemcompra 

	left join 
	    material.solicitacaocompra on itensordemcompra.nr_solicitacao = solicitacaocompra.nr_solicitacao
	left join 
	    material.ordemcompra on itensordemcompra.nroc = ordemcompra.nroc
	left join 
	    material.itensentrada on itensordemcompra.nr_solicitacao = itensentrada.nr_solicitacao

	where 
	    itensordemcompra.nroc > 110000 and
		solicitacaocompra.cod_almoxarifado = 8
)

where 
    id_sqc = 1