unit untBuscaClientesRel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, IBEAntialiasButton, ExtCtrls,classComboBox,
  DB;

type
  TfrmRelClienteLanctoF = class(TForm)
    ibeaOk: TIBEAntialiasButton;
    ibeaFechar: TIBEAntialiasButton;
    dtpPeriodoIni: TDateTimePicker;
    dtpPeriodoFinal: TDateTimePicker;
    Image9: TImage;
    lbl_Informacao: TLabel;
    lbl_PeriodoInicial: TLabel;
    lbl_PeriodoFinal: TLabel;
    lbl_Funcionario: TLabel;
    cboFuncionario: TComboBox;
    procedure ibeaFecharClick(Sender: TObject);
    procedure ExecSELECTFuncionario;
    procedure ExecSELECTCliente;
    procedure FormShow(Sender: TObject);
    procedure ibeaOkClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClienteLanctoF: TfrmRelClienteLanctoF;
  IDClass : Integer; //variavel para trazer o cliente atraves do idclass do cadastro
  IDCliente : TClasseCombo;//variavel para trazer o cliente atraves do id do combo
  IDCli : TClasseCombo;//variavel para trazer  o geral do cliente no relatorio.
  IDClassFunc : Integer;
  ClassFuncionario : TClasseCombo;
  ClassFuncPeriodo : TClasseCombo;

  IDFuncionario : Integer;
  IDClienteRel : Integer;


implementation

uses dataModule, untRelLanctoFCli, funcPosto;

{$R *.dfm}

procedure TfrmRelClienteLanctoF.ibeaFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmRelClienteLanctoF.ExecSELECTFuncionario;

begin

  with dmModule do begin

    ibClassificacao.Open;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Funcionario''');
    ibClassificacao.Open;
    IDClassFunc := ibClassificacao.FieldByName('IDCLASS').AsInteger;

    //BUSCA TODOS OS FUNCIONARIOS QUE ESTEJAM NA CLASSIFICAÇÃO DE FUNCIONARIOS
    ibFuncionario.Open;
    ibFuncionario.SQL.Clear;
    ibFuncionario.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + InttoStr(IDClassFunc) + ''' ORDER BY NOME');
    ibFuncionario.Open;

    //traz dados do funcionario no combo
    cboFuncionario.Clear; //LIMPA O COMBOBOX
    while not ibFuncionario.Eof do begin
      ClassFuncionario     := TClasseCombo.Create;//ATRIBUI A CLASSE CRIADA NA VARIAVEL
      ClassFuncionario.ID  := ibFuncionario.FieldByName('IDCAD').AsInteger;//ATRIBUI A IDENTIFICACAO DO FUNCIONARIO ATRAVES DO ID NA VARIAVEL.
      cboFuncionario.Items.AddObject(ibFuncionario.FieldByName('NOME').AsString,ClassFuncionario);//TRAZ OS ITENS ADICIONADOS AO OBJETO SELECIONADO NO COMBO E A DESCRICAO DO FUNCIONARIO.
      ibFuncionario.Next;

    end;{while}

  end;{with}


end;

procedure TfrmRelClienteLanctoF.ExecSELECTCliente;

begin

 { with dmModule do begin


    ibClassificacao.Close;
    ibClassificacao.SQL.Clear;
    ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Clientes''');
    ibClassificacao.Open;
    IDClass := ibClassificacao.FieldByName('IDCLASS').AsInteger; // ATRIBUI A IDENTIFICAÇÃO DO CLIENTE NA VARIAVEL.

    ibCadastro.Close;
    ibCadastro.SQL.Clear;
    ibCadastro.SQL.Add('SELECT * FROM TBLCADASTRO WHERE IDCLASS=''' + IntToStr(IDClass) + '''');
    ibCadastro.Open;

    cboCliente.Clear;

    while not ibCadastro.Eof do begin

      IDCliente := TClasseCombo.Create;
      IDCliente.ID := ibCadastro.FieldByName('IDCAD').AsInteger;
      cboCliente.Items.AddObject(ibCadastro.FieldByName('NOME').AsString,IDCliente);
      ibCadastro.Next;}

  //  end;{while}

 // end;{whit}

end;  

procedure TfrmRelClienteLanctoF.FormShow(Sender: TObject);
begin

  dtpPeriodoIni.DateTime   := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpPeriodoFinal.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  with dmModule do begin

    ExecSELECTCliente;
    ExecSELECTFuncionario;
    
  end;{with}
  
end;

procedure TfrmRelClienteLanctoF.ibeaOkClick(Sender: TObject);

var

ValorGeral : Real;
Total : String;


begin

  with dmModule do begin

    if cboFuncionario.ItemIndex <> - 1 Then begin

    ClassFuncPeriodo := TClasseCombo(cboFuncionario.Items.Objects[cboFuncionario.ItemIndex]);

    end;

  //  if cboCliente.ItemIndex <> - 1 Then begin

  //    IDCli := TClasseCombo(cboCliente.Items.Objects[cboCliente.ItemIndex]);

    {  ibClassificacao.Open;
      ibClassificacao.SQL.Clear;
      ibClassificacao.SQL.Add('SELECT IDCLASS FROM TBLCLASSIFICACAO WHERE DESCRICAO=''Funcionario''');
      ibClassificacao.Open;
      IDFuncionario := ibClassificacao.FieldByName('IDCLASS').AsInteger; }

      ibLanctoF.Close;
      ibLanctoF.SQL.Clear;
      ibLanctoF.SQL.Add('SELECT TBLLANCTOFUTURO.EMISSAO,TBLLANCTOFUTURO.VCTO,TBLLANCTOFUTURO.VALOR,'
      + ' TBLLANCTOFUTURO.CODCLI,TBLLANCTOFUTURO.IDFUNC,TBLLANCTOFUTURO.IDCLI,TBLCADASTRO.NOME As Cliente,'
      + ' TBLUSER.LOGIN As Funcionario,TBLTIPOPAGTOF.DESCRICAO FROM TBLLANCTOFUTURO '
      + ' LEFT OUTER JOIN TBLCADASTRO ON TBLLANCTOFUTURO.IDCLI=TBLCADASTRO.IDCAD '
      + ' INNER JOIN TBLUSER ON TBLLANCTOFUTURO.IDFUNC=TBLUSER.IDCAD '
      + ' INNER JOIN TBLTIPOPAGTOF ON TBLLANCTOFUTURO.IDTIPOPAGTO=TBLTIPOPAGTOF.IDTIPO '
      + ' WHERE TBLLANCTOFUTURO.IDFUNC=''' + IntToStr(ClassFuncPeriodo.ID) + ''' and TBLLANCTOFUTURO.VCTO=:ParamData');
    //  + ' and TBLLANCTOFUTURO.IDCLI=:ParamCli');
      ibLanctoF.Open;

      ibLanctoF.Close;
      ibLanctoF.ParamByName('ParamData').Value := dtpPeriodoIni.DateTime;
      ibLanctoF.ParamByName('ParamData').Value := dtpPeriodoFinal.DateTime;
    //  ibLanctoF.ParamByName('ParamCli').Value  := IDCli.ID;
      ibLanctoF.Open;
   //   (ibLanctoF.FieldByName('VALOR') as TFloatField).DisplayFormat   := CasasDecimais('Combustiveis');

    {   while not ibLanctoF.Eof do begin//enquanto nao for fim de registro

          if ValorGeral = 0 Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeral := StrtoFloat(StringReplace(FloattoStr(ibLanctoF.FieldByName('VALOR').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            Total := StringReplace(FloattoStr(ibLanctoF.FieldByName('VALOR').AsFloat),ThousandSeparator,'',[rfReplaceAll]);
            //atribui a variavel o valor separando por ponto
            ValorGeral := ValorGeral + StrtoFloat(StringReplace(Total,ThousandSeparator,'',[rfReplaceAll])); }

      //    end;{if}

       //   ibLanctoF.Next;//vai para o pproximo registro pro looping nao ficar infinito.

   //     end;{while}

       //  := FormatFloat(CasasDecimais('Combustiveis'),ValorGeral);

      Application.CreateForm(TfrmRelLanctoFuturosCliente, frmRelLanctoFuturosCliente);

    TRY

      with frmRelLanctoFuturosCliente do begin

        frmRelLanctoFuturosCliente.qrpLctoFCli.DataSet := ibLanctoF;


        //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
        qrdbCodCli.DataSet      := ibLanctoF;
        qrdbCodCli.DataField    := ibLanctoF.FieldByName('CODCLI').FieldName;

        qrdbCliente.DataSet     := ibLanctoF;
        qrdbCliente.DataField   := ibLanctoF.FieldByName('Cliente').FieldName;

        qrdbFunc.DataSet     := ibLanctoF;
        qrdbFunc.DataField   := ibLanctoF.FieldByName('Funcionario').FieldName;

        qrdbEmissao.DataSet     := ibLanctoF;
        qrdbEmissao.DataField   := ibLanctoF.FieldByName('EMISSAO').FieldName;

        qrdbVcto.DataSet        := ibLanctoF;
        qrdbVcto.DataField      := ibLanctoF.FieldByName('VCTO').FieldName;

        qrdbTipoPagto.DataSet   := ibLanctoF;
        qrdbTipoPagto.DataField := ibLanctoF.FieldByName('DESCRICAO').FieldName;

        qrdbValor.DataSet       := ibLanctoF;
        qrdbValor.DataField     := ibLanctoF.FieldByName('VALOR').FieldName;
        //(ibLanctoF.FieldByName('VALOR') as TFloatField).DisplayFormat   := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO

      {  qrdbTotal.DataSet       := ibLanctoF;
        qrdbTotal.DataField     := ibLanctoF.FieldByName('VALOR').FieldName;}


        (ibLanctoF.FieldByName('VALOR') as TFloatField).DisplayFormat   := CasasDecimais('Combustiveis'); //CRIA UMA MASCARA PARA O CAMPO

        qrpLctoFCli.Preview;

      end; {if}


      EXCEPT
        on E : Exception do begin
           frmRelLanctoFuturosCliente.Release;
           MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
        end;
      END;
    //////////////////////////////////////////////////////////////


    //end{if combo cliente}

  end;{with}

end;

end.
