select NRREQUISICAO
,ITEM
,COD_MATERIAL
,coalesce(quantidade,0) as quantidade
,DATARETIRADA
,coalesce(VRCUSTOUNITARIO,0) as VRCUSTOUNITARIO
,coalesce(QTDESOLICITADA,0) as QTDESOLICITADA
,CODIGO_CTE
,COD_FUNCIONARIO_RETIRAR
,COD_ITEM_CUSTO
,COD_OBJETOCUSTO_ATIVO
,JUSTIFICATIVA_CANCELAM

from material.ITENSREQUISICAOMATERIAL

where datarequisicao_item > to_date('01/12/2023','dd/mm/yyyy')
and cod_almoxarifado = 8