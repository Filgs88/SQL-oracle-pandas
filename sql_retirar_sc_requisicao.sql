with tabela_ano as (select cod_material,
cod_almoxarifado,
ano,
mes,
quantidade

from (select cod_material, 
cod_almoxarifado, 
ano,
mes, 
quantidade, 
max(ANO) over (partition by cod_material) max_ano

from material.estoque

where cod_almoxarifado = 8
and cod_grupoempresa = 1
and cod_empresa = 1
and cod_filial = 1)

where ano = max_ano),

tabela_estoque as (select cod_material,
cod_almoxarifado,
ano,
mes,
quantidade

from (select cod_material,
cod_almoxarifado,
ano,
mes, 
quantidade,
max(mes) over (partition by cod_material) max_mes

from tabela_ano)

where mes = max_mes)

select itensrequisicaomaterial.nrrequisicao,
itensrequisicaomaterial.item,
itensrequisicaomaterial.nr_solicitacao,
itensrequisicaomaterial.datarequisicao_item,
itensrequisicaomaterial.cod_material,
material.descricao,
material.cod_unidade,
coalesce(itensrequisicaomaterial.quantidade,0) as quantidade,
coalesce(tabela_estoque.quantidade,0) as quantidade_estoque,
itensrequisicaomaterial.dataretirada,
itensentradarequisicao.sequencia_nf,
itensentradarequisicao.nrnf,
contagemconfirmacao.data

from material.itensrequisicaomaterial,
material.itensentradarequisicao,
material.material,
material.contagemconfirmacao,
tabela_estoque

where itensrequisicaomaterial.cod_almoxarifado = 8 and
tabela_estoque.cod_material = material.cod_material and
itensrequisicaomaterial.nrrequisicao = itensentradarequisicao.nrrequisicao and
itensrequisicaomaterial.item (+)= itensentradarequisicao.item_requisicao and
material.cod_material = itensrequisicaomaterial.cod_material and
itensentradarequisicao.sequencia_nf (+)= contagemconfirmacao.sequencia_nf and
itensrequisicaomaterial.datarequisicao_item > to_date('01/06/2023','dd/mm/yyyy') and
itensrequisicaomaterial.nr_solicitacao > 0 and
material.cod_unidade <> 'SV' and
itensrequisicaomaterial.dataretirada is null and
contagemconfirmacao.data > to_date('01/06/2023','dd/mm/yyyy') and
itensrequisicaomaterial.quantidade <= tabela_estoque.quantidade

order by itensrequisicaomaterial.datarequisicao_item desc