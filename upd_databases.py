import pandas as pd
from oracle_database import Conexao

def criar_db(sql, nomedf):
	con = Conexao.conection()
	df = pd.read_sql_query(sql, con)
	df.to_excel(f'//192.168.1.88/Users/PC/OneDrive - MSFT/PCM/01. PCMI/25. SQLs/{nomedf}.xlsx', index=False)
	con.close()

# Database de Materiais. --------------------------------------------------------------------
nomedf = "MATERIAIS"
with open("./SQLs/sql_materiais.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Apontamentos. ---------------------------------------------------------------
nomedf = "Apontamentos"
with open("./SQLs/sql_apontamentos.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Estoque de materiais. ----------------------------------------------------------
nomedf = "MateiralEstoqueGeral"
with open("./SQLs/sql_estoque_de_materiais.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Ordens de compra. --------------------------------------------------------------
nomedf = "OrdemCompra"
with open("./SQLs/sql_ordem_compra.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Ordens de serviço. --------------------------------------------------------------
nomedf = "OrdemServico"
with open("./SQLs/sql_ordem_servico.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Ordem de serviço geral. ----------------------------------------------------------
nomedf = "OSGeral"
with open("./SQLs/sql_os_geral.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Tarefas de ordens de serviço. -----------------------------------------------------
nomedf = "OSTarefas"
with open("./SQLs/sql_tarefas_os.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Lista de sc pendentes. ------------------------------------------------------------
nomedf = "RelatorioScPendentes"
with open("./SQLs/sql_lista_sc_pendente.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Requisições. -------------------------------------------------------------------------
nomedf = "Requisição"
with open("./SQLs/sql_requiscao.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Retirada de requisições com sc. --------------------------------------------------------
nomedf = "RetiradaRequisicoesSC"
with open("./SQLs/sql_retirar_sc_requisicao.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Solicitações de compra. -----------------------------------------------------------------
nomedf = "SolicitacaoCompra"
with open("./SQLs/sql_solicitacao_compra.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Solicitações de serviço. -------------------------------------------------------------------
nomedf = "SolicitacaoServico"
with open("./SQLs/sql_solicitacao_servico.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)

# Database de Requisições com retirada pendente -------------------------------------------------------------------
nomedf = "RequisicoesRetiradaPendente"
with open("./SQLs/sql_retirada_requisicao_pendente.sql", "r") as arquivo:
	sql = arquivo.read()
criar_db(sql, nomedf)