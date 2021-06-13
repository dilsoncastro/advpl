/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma ณ RenumCTS บ Autor ณ Dilson Castro      บ Data ณ 22/09/06   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDescricao ณ Renumera o campo CTS_ORDEM da tabela CTS010                 ฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ MP8 IDE                                                    บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
/*/

#include "rwmake.ch"
#include "TopConn.Ch"
#include "protheus.ch"

User Function RenumCTS

Local wnrel
Local cString := "CTS"
Local titulo   := "Relatorio Renumera CTS"
Local NomeProg := "RENUMCTS"                               
Local Tamanho := "M"
Local cPerg    := "RENUMC"

PRIVATE aReturn := { "Zebrado", 1,"Administracao", 1, 2, 1, "",1 }

wnrel:=SetPrint(cString,NomeProg,cPerg,@titulo,"", "", "",.F.,.F.,.F.,Tamanho,,.F.)

//ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
//ณ Variaveis utilizadas para parametros                         ณ
//ณ mv_par01 Filial                                             ณ
//ณ mv_par02 Codigo da Visao Gerencial                          ณ
//ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
If nLastKey == 27
   Set Filter To
   Return .t.
Endif

SetDefault(aReturn,cString)

If nLastKey == 27
   Set Filter To
   Return .t.
Endif

RptStatus({|lEnd| TestRel(@lEnd,wnRel,cString,Tamanho,NomeProg)},titulo)

Return

Static Function TestRel(lEnd,WnRel,cString,Tamanho,NomeProg)
LOCAL cabec1,cabec2
LOCAL cRodaTxt := oemtoansi("Rodap้")
Local nCntImpr
Local nTipo
                   
nCntImpr := 0

li := 80
m_pag := 1

//ณ Inicializa os codigos de caracter Comprimido da impressora ณ
nTipo := 15

//ณ Monta os Cabecalhos                                        ณ
titulo:= oemtoansi("RELATORIO DOS INDICES DA VISAO GERENCIAL 002")
cabec1:= oemtoansi("ORDEM DOS INDICES")
cabec2:="FILIAL "+"PLANO "+"ORDEM       "+"LINHA"

//ณ Query: registros da visao gerencial decrescente     ณ
_q := "SELECT "
_q += " CTS.CTS_FILIAL,"
_q += " CTS.CTS_CODPLA,"
_q += " CTS.CTS_ORDEM,"
_q += " CTS.CTS_CONTAG,"
_q += " CTS.CTS_CTASUP,"
_q += " CTS.CTS_DESCCG,"
_q += " CTS.CTS_CLASSE,"
_q += " CTS.CTS_LINHA,"
_q += " CTS.CTS_CT1INI,"
_q += " CTS.CTS_CT1FIM,"
_q += " CTS.CTS_CTTINI,"
_q += " CTS.CTS_CTTFIM,"
_q += " CTS.CTS_CTDINI,"
_q += " CTS.CTS_CTDFIM,"
_q += " CTS.CTS_CTHINI,"
_q += " CTS.CTS_CTHFIM,"
_q += " CTS.CTS_IDENT,"
_q += " CTS.CTS_FORMUL,"
_q += " CTS.CTS_TPSALD,"
_q += " CTS.CTS_COLUNA,"
_q += " CTS.CTS_NOME,"
_q += " CTS.D_E_L_E_T_,"
_q += " CTS.R_E_C_N_O_,"
_q += " CTS.R_E_C_D_E_L_ "
_q += "FROM "+RetSqlName("CTS")+" CTS"
_q += " WHERE "
_q += " CTS.CTS_FILIAL = '" + mv_par01 + "' AND "
//_q += " CTS.CTS_FILIAL = '" + xFilial("CTS") + "' AND "
_q += " CTS.CTS_CODPLA = '" + mv_par02 + "' AND"
_q += " CTS.D_E_L_E_T_ <> '*' "
_q += "ORDER BY CTS.CTS_ORDEM DESC"

TCQUERY _q NEW ALIAS "TMP"

DbSelectArea("TMP")
_chave := "XX"                                  
_nRegAnt:= TMP->R_E_C_N_O_

//ณ Definindo contador: (quantidade de registros * 10 ) + 10            ณ
_ordem := (Contar("CTS","CTS_FILIAL == mv_par01 .AND. CTS_CODPLA == mv_par02") * 10) + 1
SetRegua(RecCount())

//ณ Alterando o valor do campo CTS_ORDEM para seguir um sequencial      ณ
While !Eof()
    IncRegua()
    If Li > 60
          cabec(titulo,cabec1,cabec2,nomeprog,tamanho,15)
          @ Li,0 PSAY __PrtThinLine()                    
     Endif
          
     _ordem -= 10
     _nReg := TMP->R_E_C_N_O_
     If _chave == TMP->(CTS_FILIAL+CTS_CODPLA+CTS_ORDEM+CTS_LINHA)
          DBSelectArea("CTS")       
          DBSetOrder(1)
          DBSeek(TMP->(CTS_FILIAL+CTS_CODPLA+CTS_ORDEM+CTS_LINHA))
          dbskip(-1)
        _ordem := Val(CTS->CTS_ORDEM)              
         DbSelectArea("TMP")
     Else                   
          DBSelectArea("CTS")
          Go _nReg
          RecLock("CTS",.F.)     
          CTS->CTS_ORDEM := StrZero(_ordem,10)              
          msunlock()
     EndIf           
    DbSelectArea("TMP")
    _chave := TMP->(CTS_FILIAL+"     "+CTS_CODPLA+"   "+CTS_ORDEM+" "+CTS_LINHA)       
    _nRegAnt:= TMP->R_E_C_N_O_
    IncRegua()
    DbSkip()

    nCntImpr++
        Li++
    @ Li,01 PSAY _chave

    If Li > 60
        Li:=66
    Endif

EndDO

@ Li+1,01 PSAY "Registros Encontrados: " + STR(Contar("CTS","CTS_FILIAL == mv_par01 .AND. CTS_CODPLA == mv_par02"))

DbCloseArea()

If li != 80
        Roda(nCntImpr,cRodaTxt,Tamanho)
EndIf

Set Device to Screen

If aReturn[5] = 1
        Set Printer To
        dbCommitAll()
        OurSpool(wnrel)
Endif

MS_FLUSH()
Return
