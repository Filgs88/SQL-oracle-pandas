select itensordemcompra.nr_solicitacao,
ordemcompra.dataoc,
itensordemcompra.nroc,
ordemcompra.nr_cotacao,
ITENSENTRADA.sequencia_nf,
ITENSENTRADA.nrnf,
ordemcompra.cod_fornecedor,
ordemcompra.cod_plano,
itensordemcompra.cod_material

from material.ORDEMCOMPRA,
material.ITENSORDEMCOMPRA,
material.ITENSENTRADA,
material.solicitacaocompra

where ordemcompra.dataoc > to_date('01/12/2023','dd/mm/yyyy') and
itensordemcompra.nr_solicitacao = solicitacaocompra.nr_solicitacao and
solicitacaocompra.cod_almoxarifado in ('8', '27') and
itensordemcompra.nroc (+)= ordemcompra.nroc and
itensentrada.nr_solicitacao (+)= itensordemcompra.nr_solicitacao

order by itensordemcompra.nr_solicitacao