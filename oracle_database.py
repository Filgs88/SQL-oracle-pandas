import pyodbc

class Conexao:
    def conection():
        con = pyodbc.connect(
        'Driver={Oracle em OraClient11g_home2};'
        'dbq=host ip:port/hostname;'
        'Uid=user id;'
        'Pwd=pwd;'
        )
        return con
        
    def close(con):
        con.close()
