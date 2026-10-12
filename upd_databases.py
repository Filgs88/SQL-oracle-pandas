import pandas as pd, sqlite3
from oracle_database import Conexao

def criar_db(nomedf, local_arquivo):
    with open(local_arquivo, "r") as arquivo:
        sql = arquivo.read()

    con = Conexao.conection()
    df = pd.read_sql_query(sql, con)
    df.to_excel(f'C:/Users/PC/OneDrive - MSFT/PCM/01. PCMI/25. SQLs/{nomedf}.xlsx', index=False)
    con.close()

variaveis = [
    # Utilitarios ----
    ("ObjCustos", "./SQLs/sql_obj_custo.sql"),
    ("PontoFuncionarios", "./SQLs/sql_ponto_funcionarios.sql"),

    # Serviços ----
    ("Apontamentos", "./SQLs/sql_apontamentos.sql"),
    ("OrdensDeServico", "./SQLs/sql_ordens_de_servico.sql"),
    ("OrdemServico", "./SQLs/sql_ordem_servico.sql"),
    ("OSGeral", "./SQLs/sql_os_geral.sql"),
    ("OSTarefas", "./SQLs/sql_tarefas_os.sql"),

    # Compras e manutenções ----
    ("SolicitacaoCompra", "./SQLs/sql_solicitacao_compra.sql"),
    ("SolicitacaoServico", "./SQLs/sql_solicitacao_servico.sql"),
    ("RelatorioScPendentes", "./SQLs/sql_lista_sc_pendente.sql"),
    ("OrdemCompra", "./SQLs/sql_ordem_compra.sql"),

    # Materiais ----
    ("Requisição", "./SQLs/sql_requiscao.sql"),
    ("MateiralEstoqueGeral", "./SQLs/sql_estoque_de_materiais.sql"),
    ("MATERIAIS", "./SQLs/sql_materiais.sql")
]

for var in variaveis:
    criar_db(var[0], var[1])
