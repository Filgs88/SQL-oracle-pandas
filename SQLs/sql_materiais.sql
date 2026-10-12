with tbl_fiscal as(
    select
        cod_classif_fiscal,
        classificacaofiscal

    from
        material.historicoclassificacaofiscal

    where
        datatermino is null and
        length(trim(classificacaofiscal)) = 8
),

tbl_ncm as (
    select
        sequencia,
        cod_material,
        cod_classif_fiscal

    from
        material.HISTORICOMATERIALNCM

    where
        datatermino is null
),

tbl_situacao as (
    select 
        cod_grupoempresa,
        cod_empresa,
        cod_filial,
        cod_material,
        situacao,
        datainicio,
        datatermino
    
    from 
        material.MATERIALPORFILIAL 
    
    where 
        cod_grupoempresa = 1 and
        cod_empresa = 1 and
        cod_filial = 1 and
        datatermino is null and
        situacao like 'I'
)

select
    material.cod_material,
    material.cod_familia,
    material.cod_grupomaterial,
    material.descricao,
    material.cod_unidade,
    to_number(trim(tbl_fiscal.classificacaofiscal)) as classificacaofiscal,
    material.especificacaotecnica

from
    material.material

left join
    tbl_ncm on material.cod_material = tbl_ncm.cod_material
left join
    tbl_fiscal on tbl_ncm.cod_classif_fiscal = tbl_fiscal.cod_classif_fiscal
left join
    tbl_situacao on material.cod_material = tbl_situacao.cod_material

where 
    tbl_situacao.situacao is null

order by
    material.descricao