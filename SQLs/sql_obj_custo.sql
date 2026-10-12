select 
    cod_objetocusto,
    descricao

from 
    rh.objetocusto

where 
    inativo = 'F'

order by 
    descricao