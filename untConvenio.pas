unit untConvenio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IBEAntialiasButton, Grids, DBGrids, ComCtrls, StdCtrls,
  IBQuery, classComboBox, DB;

type
  TfrmConvenio = class(TForm)
    cboCliente: TComboBox;
    lbl_Cliente: TLabel;
    dtpDtFinal: TDateTimePicker;
    dtpDtInicial: TDateTimePicker;
    lbl_Emissao: TLabel;
    lbl_Vcto: TLabel;
    lbl_edtValor: TLabeledEdit;
    dtpDataPagto: TDateTimePicker;
    lbl_DataPagto: TLabel;
    dbgClienteConvenio: TDBGrid;
    ibeaImprimir: TIBEAntialiasButton;
    ibeabSair: TIBEAntialiasButton;
    Image1: TImage;
    Label3: TLabel;
    ibeaRecibo: TIBEAntialiasButton;
    Label1: TLabel;
    memoHistRecibo: TMemo;
    ibeaServicos: TIBEAntialiasButton;
    procedure Commit(IBQueryExec : TIBQuery);
    procedure ExecSELECTCliente;

    procedure ibeabSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpDtFinalChange(Sender: TObject);
    procedure ibeaImprimirClick(Sender: TObject);
    procedure ibeaReciboClick(Sender: TObject);
    procedure ibeaServicosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  frmConvenio: TfrmConvenio;
  MontaColConvenio : Boolean;
  IDClass : Integer;
  IDCliente : TClasseCombo;
  IDClassClienteConvenio : TClasseCombo;
  IDClienteConv : TClasseCombo;
  StringIDClienteConv : String;
  
implementation

uses untdmModule, funcPosto, untRelConvenio, untRelRecibo, untRecibo,
  untRelServicos;

{$R *.dfm}

procedure TfrmConvenio.Commit(IBQueryExec : TIBQuery);

begin

  with dmModule do begin

    with IBQueryExec do begin
      SQL.Clear;
      SQL.Add('Commit');
      Open;
      Close;
    end;

  end;

end;


procedure TfrmConvenio.ExecSELECTCliente;

begin

  with dmModule do begin

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
      ibCadastro.Next;

    end;{while}

  end;{whit}

end;


procedure TfrmConvenio.ibeabSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConvenio.FormShow(Sender: TObject);
begin

  dtpDtInicial.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDtFinal.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));
  dtpDataPagto.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',Date));

  with dmModule do begin

    ExecSELECTCliente;

    with dbgClienteConvenio do begin

      // monta as colunas abaixo se for verdadeiro
      if MontaColConvenio Then begin

         DataSource := dmModule.dtsAReceber;

        //determina as colunas a serem montadas 0 codigo cliente, 1 razao Social, 2 endereço numero...
        Columns.Insert(0);
        Columns.Insert(1);
        Columns.Insert(2);
        Columns.Insert(3);
        Columns.Insert(4);
        Columns.Insert(5);

        //Parametros da Coluna que exibe o Código do Cadastro
        Columns.Items[0].Title.Caption := 'Código';
        Columns.Items[0].FieldName     := 'CODIGO';
        Columns.Items[0].Width         := 50;
        Columns.Items[0].Alignment     := taLeftJustify;

        //Parametros da Coluna que exibe o Nome do cliente.
        Columns.Items[1].Title.Caption := 'Cliente';
        Columns.Items[1].FieldName     := 'Cliente';
        Columns.Items[1].Width         := 170;
        Columns.Items[1].Alignment     := taLeftJustify;

        // Parametros que exibe o nome fantasia do cliente
        Columns.Items[2].Title.Caption := 'Animal';
        Columns.Items[2].FieldName     := 'NOMEANIMAL';
        Columns.Items[2].Width         := 150;
        Columns.Items[2].Alignment     := taLeftJustify;

        // Parametros que exibe o numero do cliente
        Columns.Items[3].Title.Caption := 'Tipo Venda';
        Columns.Items[3].FieldName     := 'TIPOVENDA';
        Columns.Items[3].Width         := 150;
        Columns.Items[3].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[4].Title.Caption := 'Data';
        Columns.Items[4].FieldName     := 'DTVENCTO';
        Columns.Items[4].Width         := 70;
        Columns.Items[4].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
        Columns.Items[5].Title.Caption := 'Valor';
        Columns.Items[5].FieldName     := 'VLREMITIDO';
        Columns.Items[5].Width         := 110;
        Columns.Items[5].Alignment     := taLeftJustify;

       // Parametros que exibe o compl. do cliente
       { Columns.Items[8].Title.Caption := 'Hora';
        Columns.Items[8].FieldName     := 'HORA';
        Columns.Items[8].Width         := 70;
        Columns.Items[8].Alignment     := taLeftJustify;  }

        MontaColConvenio := False;

      end; {if}

    end; {with do db grid}


  end;{with}

end;

procedure TfrmConvenio.FormCreate(Sender: TObject);
begin
 MontaColConvenio := True;
end;

procedure TfrmConvenio.dtpDtFinalChange(Sender: TObject);

var

ValorGeral : Real;
ValorTotal : String;

begin

  with dmModule do begin

    if cboCliente.ItemIndex > - 1 Then begin

      IDClassClienteConvenio := TClasseCombo( cboCliente.Items.Objects[cboCliente.ItemIndex] );

    end;{if}

    Commit(ibAReceber);
    ibAReceber.Close;
    ibAReceber.SQL.Clear;     
    ibAReceber.SQL.Add('SELECT TBLCONTASARECEBER.VLREMITIDO,'
    + 'TBLCONTASARECEBER.EMISSAOCONTA,TBLCONTASARECEBER.DTVENCTO,'
    + 'TBLCONTASARECEBER.TIPOVENDA,TBLCADASTRO.NOME As Cliente,'
    + 'TBLCADDOCUMENTACAO.CODIGO,TBLANIMALCLI.NOMEANIMAL FROM TBLCONTASARECEBER '
    + 'INNER JOIN TBLCADASTRO ON TBLCONTASARECEBER.IDCLI=TBLCADASTRO.IDCAD '
    + 'INNER JOIN TBLCADDOCUMENTACAO ON TBLCONTASARECEBER.IDCLI=TBLCADDOCUMENTACAO.IDCAD '
    + 'LEFT OUTER JOIN TBLANIMALCLI ON TBLCONTASARECEBER.IDANIMAL=TBLANIMALCLI.IDANIMALCLI '
    + 'WHERE (TBLCONTASARECEBER.DTVENCTO between :ParamDataInicial and :ParamDataFinal) and TBLCONTASARECEBER.IDCLI=''' + IntToStr(IDClassClienteConvenio.ID) + ''' and TBLCONTASARECEBER.TIPOVENDA=''Convenio''');
    ibAReceber.Open;

    ibAReceber.Close;
    ibAReceber.ParamByName('ParamDataInicial').Value := dtpDtInicial.DateTime;
    ibAReceber.ParamByName('ParamDataFinal').Value := dtpDtFinal.DateTime;
    ibAReceber.Open;

    (ibAReceber.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat   := CasasDecimais('Produtos');


        while not ibAReceber.Eof do begin//enquanto nao for fim de registro

          if ValorGeral = 0 Then begin//se variavel for igual a zero

            //atribui o vlr do campo abaixo na variavel
            ValorGeral := StrtoFloat(StringReplace(FloattoStr(ibAReceber.FieldByName('VLREMITIDO').AsFloat),ThousandSeparator,'',[rfReplaceAll]));

          end else begin

            //atribui na variavel substituindo o ponto para vlr em branco
            ValorTotal := StringReplace(FloattoStr(ibAReceber.FieldByName('VLREMITIDO').AsFloat),ThousandSeparator,'',[rfReplaceAll]);

            //atribui a variavel o valor separando por ponto
            ValorGeral := ValorGeral + StrtoFloat(StringReplace(ValorTotal,ThousandSeparator,'',[rfReplaceAll]));

          end;{if}

          ibAReceber.Next;//vai para o pproximo registro pro looping nao ficar infinito.

        end;{while}

       lbl_edtValor.Text := FormatFloat(CasasDecimais('Produtos'),ValorGeral);


  end;{with}

end;

procedure TfrmConvenio.ibeaImprimirClick(Sender: TObject);
begin
  with dmModule do begin

    if cboCliente.ItemIndex > - 1 Then begin

      IDClassClienteConvenio := TClasseCombo( cboCliente.Items.Objects[cboCliente.ItemIndex] );

    end;{if}


    ibAReceber.Close;
    ibAReceber.SQL.Clear;
    ibAReceber.SQL.Add('SELECT TBLCONTASARECEBER.VLREMITIDO,'
    + 'TBLCONTASARECEBER.EMISSAOCONTA,TBLCONTASARECEBER.DTVENCTO,'
    + 'TBLCONTASARECEBER.TIPOVENDA,TBLCADASTRO.NOME As Cliente, '
    + 'TBLCADDOCUMENTACAO.CODIGO,TBLANIMALCLI.NOMEANIMAL,'
    + 'CADPRODUTOS.NOME As Produto FROM TBLCONTASARECEBER '
    + 'INNER JOIN TBLCADASTRO ON TBLCONTASARECEBER.IDCLI=TBLCADASTRO.IDCAD '
    + 'INNER JOIN TBLCADDOCUMENTACAO ON TBLCONTASARECEBER.IDCLI=TBLCADDOCUMENTACAO.IDCAD '
    + 'INNER JOIN TBLANIMALCLI ON TBLCONTASARECEBER.IDCLI=TBLANIMALCLI.IDCADCLI '
    + 'INNER JOIN CADPRODUTOS ON TBLCONTASARECEBER.IDPROD=CADPRODUTOS.IDPROD '
    + 'WHERE (TBLCONTASARECEBER.DTVENCTO between :ParamDataInicial and :ParamDataFinal) and TBLCONTASARECEBER.TIPOVENDA=''Convenio'' and TBLCONTASARECEBER.IDCLI=''' + IntToStr(IDClassClienteConvenio.ID) + '''');
    ibAReceber.Open;


    ibAReceber.Close;
    ibAReceber.ParamByName('ParamDataInicial').Value := dtpDtInicial.DateTime;
    ibAReceber.ParamByName('ParamDataFinal').Value := dtpDtFinal.DateTime;
    ibAReceber.Open;


   (ibAReceber.FieldByName('VLREMITIDO') as TFloatField).DisplayFormat   := CasasDecimais('Produtos');

   { Commit(ibBxAgenda);
    ibBxAgenda.Close;
    ibBxAgenda.SQL.Clear;
    ibBxAgenda.SQL.Add('SELECT TBLBXAGENDA.*,TBLCADASTRO.NOME As Cliente,'
    + 'TBLTIPOCOMPROMISSO.NOME As TipoCompromisso  FROM TBLBXAGENDA '
    + 'LEFT OUTER JOIN TBLCADASTRO ON TBLBXAGENDA.IDCLI=TBLCADASTRO.IDCAD '
   // + 'LEFT OUTER JOIN TBLCADDOCUMENTACAO ON TBLCOMPROMISSOAGENDA.IDCLI=TBLCADDOCUMENTACAO.IDCAD '
   // + 'LEFT OUTER JOIN TBLANIMALCLI ON TBLCOMPROMISSOAGENDA.IDANIMAL=TBLANIMALCLI.IDANIMAL '
    + 'INNER JOIN TBLTIPOCOMPROMISSO ON TBLBXAGENDA.IDCOMPROMISSO=TBLTIPOCOMPROMISSO.IDTIPO '
    + 'WHERE (TBLBXAGENDA.DATA between :ParamDataInicial and :ParamDataFinal) and TBLBXAGENDA.TIPOPAGTO=''Convenio'' and TBLBXAGENDA.IDCLI=''' + IntToStr(IDClassClienteConvenio.ID) + '''');
    ibBxAgenda.Open;  }

  {  ibBxAgenda.Close;
    ibBxAgenda.ParamByName('ParamDataInicial').Value := dtpDtInicial.DateTime;
    ibBxAgenda.ParamByName('ParamDataFinal').Value := dtpDtFinal.DateTime;
    ibBxAgenda.Open; }


   //(ibBxAgenda.FieldByName('VALOR') as TFloatField).DisplayFormat   := CasasDecimais('Produtos');

    Application.CreateForm(TfrmRelConvenio, frmRelConvenio);

    TRY

      with frmRelConvenio do begin

        frmRelConvenio.qrpRelConvenio.DataSet := ibAReceber;


        //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
        qrdbCliente.DataSet     := ibAReceber;
        qrdbCliente.DataField   := ibAReceber.FieldByName('Cliente').FieldName;

        qrdbTipoServ.DataSet    := ibAReceber;
        qrdbTipoServ.DataField  := ibAReceber.FieldByName('TIPOVENDA').FieldName;

        qrdbProduto.DataSet     := ibAReceber;
        qrdbProduto.DataField   := ibAReceber.FieldByName('Produto').FieldName;

        qrdbData.DataSet        := ibAReceber;
        qrdbData.DataField      := ibAReceber.FieldByName('DTVENCTO').FieldName;

        qrdbValor.DataSet       := ibAReceber;
        qrdbValor.DataField     := ibAReceber.FieldByName('VLREMITIDO').FieldName;

        frmRelConvenio.qrlDtPagto.Caption := DateToStr(dtpDataPagto.Date);

        qrpRelConvenio.Preview;

      end; {if}


    EXCEPT
      on E : Exception do begin
         frmRelConvenio.Release;
         MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
      end;
    END;
  //////////////////////////////////////////////////////////////



  end;{with}

end;

procedure TfrmConvenio.ibeaReciboClick(Sender: TObject);
begin


    Application.CreateForm(TfrmRelRecibo, frmRelRecibo);


    TRY

      with frmRelRecibo do begin

//        frmRelRecibo.qrpRelatRecibo.DataSet := ibCadastro;

        //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT

        {if cboCliente.ItemIndex <> - 1 Then begin
        qrdbCliente.DataSet    := ibCadastro;
        qrdbCliente.DataField  := ibCadastro.FieldByName('NOME').FieldName;
        end;  }

        qrlValor.Caption := frmConvenio.lbl_edtValor.Text;
        qrlHistRecibo.Caption := frmConvenio.memoHistRecibo.Text;
        qrlNomeCli.Caption := frmConvenio.cboCliente.Text;
        qrlDataRecibo.Caption := DateToStr(frmConvenio.dtpDataPagto.DateTime);

        qrpRelatRecibo.Preview;

      end; {if}

    EXCEPT
      on E : Exception do begin
         frmRelRecibo.Release;
         MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
      end;
    END;
  //////////////////////////////////////////////////////////////

//  end;{with}

end;

procedure TfrmConvenio.ibeaServicosClick(Sender: TObject);
begin

    Application.CreateForm(TfrmRelServicos, frmRelServicos);


    TRY

      with frmRelServicos do begin

//        frmRelRecibo.qrpRelatRecibo.DataSet := ibCadastro;

        //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT

        {if cboCliente.ItemIndex <> - 1 Then begin
        qrdbCliente.DataSet    := ibCadastro;
        qrdbCliente.DataField  := ibCadastro.FieldByName('NOME').FieldName;
        end;  }

        qrlHistServicos.Caption := frmConvenio.memoHistRecibo.Text;
        qrlDataServicos.Caption := DateToStr(frmConvenio.dtpDataPagto.DateTime);
      //  qrlHistServs2.Caption := frmConvenio.memoHistRecibo.Text;
     //   qrlData2.Caption := DateToStr(frmConvenio.dtpDataPagto.DateTime);
        qrpRelatServicos.Preview;

      end; {if}

    EXCEPT
      on E : Exception do begin
         frmRelServicos.Release;
         MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
      end;
    END;
  //////////////////////////////////////////////////////////////

end;

end.
