SELECT ordem_servico.ano_ordem_servico
,ordem_servico.numero_ordem_servico
,ordem_servico.data_abertura
,ordem_servico.solitacao_servico
,requisicaomaterial.nrrequisicao
,itensrequisicaomaterial.nr_solicitacao
,ordem_servico.codigo_destino_manutencao
,material.cod_material
,material.descricao
,coalesce(itensrequisicaomaterial.qtdesolicitada,0) as qtdesolicitada
,itensrequisicaomaterial.observacao
,ordem_servico.cod_objetocusto
,ordem_servico.codigo_cte_alfa
,ordem_servico.codigo_tipomanutencao

FROM industria.ordem_servico
,material.itensrequisicaomaterial
,material.requisicaomaterial
,material.material

WHERE ordem_servico.numero_ordem_servico (+)= requisicaomaterial.numero_ordem_servico
and itensrequisicaomaterial.cod_material = material.cod_material
and itensrequisicaomaterial.nrrequisicao = requisicaomaterial.nrrequisicao
and ordem_servico.ano_ordem_servico in ('2023', '2024')
and ordem_servico.codigo_destino_manutencao in ('12', '109')
and material.cod_unidade in ('SV')
and requisicaomaterial.datarequisicao > to_date('01/09/2023', 'dd/mm/yyyy')
and ordem_servico.data_abertura > to_date('01/09/2023', 'dd/mm/yyyy')

ORDER BY ordem_servico.data_abertura