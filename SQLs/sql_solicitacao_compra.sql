with tbcot as (
    select 
        nr_solicitacao,
        nr_cotacao,
        preco,
        data_liberacao
    
    from 
        material.resultadocotacaoitem
    
    where 
        data_liberacao >= to_date(to_char(sysdate - 180, 'dd/mm/yyyy')) and
        data_liberacao is not null
)

select 
    solicitacaocompra.nr_solicitacao
    ,solicitacaocompra.cod_funcionario
    ,solicitacaocompra.cod_almoxarifado
    ,solicitacaocompra.data
    ,coalesce(solicitacaocompra.qtdesolicitada,0) as qtdesolicitada
    ,solicitacaocompra.cod_material
    ,material.descricao
    ,solicitacaocompra.observacao
    ,solicitacaocompra.informacao_fornecedor
    ,solicitacaocompra.datacriacao
    ,solicitacaocompra.situacao
    ,aprovacaosolicitacaocompra.dataaprovacao as aprovacaosolicitacao
    ,tbcot.nr_cotacao
    ,tbcot.data_liberacao
    ,coalesce(tbcot.preco,0) as preco
    ,aprovacaoparacompra.dataaprovacao as aprovacaocompra

from 
    material.solicitacaocompra
    ,material.aprovacaoparacompra
    ,material.aprovacaosolicitacaocompra
    ,material.material
    ,tbcot

where 
    solicitacaocompra.data > to_date(to_char(sysdate - 180, 'dd/mm/yyyy'))
    and solicitacaocompra.cod_almoxarifado in ('8','27')
    and aprovacaoparacompra.nr_solicitacao (+)= solicitacaocompra.nr_solicitacao
    and aprovacaosolicitacaocompra.nr_solicitacao (+)= solicitacaocompra.nr_solicitacao
    and solicitacaocompra.cod_material (+)= material.cod_material
    and tbcot.nr_solicitacao (+)= solicitacaocompra.nr_solicitacao