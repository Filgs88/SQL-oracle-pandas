select
    ep.data,
    ep.cod_funcionario,
    ep.cod_evento,
    floor(ep.referencia) + ((ep.referencia - floor(ep.referencia)) * 60 / 100) as horas_diarias

from 
    rh.eventosponto ep

join 
    rh.view_dossie vd on vd.cod_funcionario = ep.cod_funcionario

where 
    ep.cod_evento in (1130, 4) and
    vd.cod_setor in (147, 178, 165, 155, 2340, 168, 169, 185, 186, 188, 187) and
    ep.data >= to_date('01/03/2026', 'dd/mm/yyyy')

order by 
    ep.cod_funcionario, ep.data
