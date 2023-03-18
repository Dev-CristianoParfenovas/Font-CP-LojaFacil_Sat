unit untGrupoSubGrupoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,classComboBox,IBQuery,DB, StdCtrls,
  ComObj, Buttons;

type
  TfrmGrupoSubGrupoEstoque = class(TForm)
    cboGrupo: TComboBox;
    cboSubGrupo: TComboBox;
    lbl_Grupo: TLabel;
    lbl_SubGrupo: TLabel;
    ibeaVisualizar: TSpeedButton;
    ibeaSair: TSpeedButton;
    ckGeral: TCheckBox;
    ckZeroNegativo: TCheckBox;
    procedure ibeaSairClick(Sender: TObject);
    procedure Commit(IBQueryExec : TIBQuery);
    procedure SELECTGrupo;
    procedure SELECTSubGrupo;
    procedure cboGrupoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ibeaVisualizarClick(Sender: TObject);
    procedure ckGeralCheck(Sender: TObject);
    procedure ckZeroNegativoCheck(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupoSubGrupoEstoque: TfrmGrupoSubGrupoEstoque;

implementation

uses untdmModule, untGrupoSubGrupEstoqueRelat, funcPosto;

{$R *.dfm}

procedure TfrmGrupoSubGrupoEstoque.ibeaSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmGrupoSubGrupoEstoque.Commit(IBQueryExec : TIBQuery);

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

procedure TfrmGrupoSubGrupoEstoque.SELECTGrupo;

var
ClassGrupo  : TClasseCombo;
begin

  with dmModule do begin

    Commit(ibGrupo);
    ibGrupo.Close;
    ibGrupo.SQL.Clear;
    ibGrupo.SQL.Add('SELECT * FROM TBLGRUPO');
    ibGrupo.Open;

    cboGrupo.Clear; //LIMPA O COMBOBOX
    while not ibGrupo.Eof do begin
      ClassGrupo     := TClasseCombo.Create;
      ClassGrupo.ID  := ibGrupo.FieldByName('IDGRUPO').AsInteger;
      cboGrupo.Items.AddObject(ibGrupo.FieldByName('NOME').AsString,ClassGrupo);
      ibGrupo.Next;
    end;{while}
  end;{with}

end;


procedure TfrmGrupoSubGrupoEstoque.SELECTSubGrupo;

var
ClassSubgrupo : TClasseCombo;
begin

  with dmModule do begin

    Commit(ibSubgrupo);
    ibSubgrupo.Close;
    ibSubgrupo.SQL.Clear;
    ibSubgrupo.SQL.Add('SELECT * FROM TBLSUBGRUPO');
    ibSubgrupo.Open;

    cboSubgrupo.Clear; //LIMPA O COMBOBOX
    while not ibSubgrupo.Eof do begin
      ClassSubgrupo     := TClasseCombo.Create;
      ClassSubgrupo.ID  := ibSubgrupo.FieldByName('IDSUB').AsInteger;
      cboSubgrupo.Items.AddObject(ibSubgrupo.FieldByName('NOMESUBGRUPO').AsString,ClassSubgrupo);
      ibSubgrupo.Next;
    end;
  end;

end;

procedure TfrmGrupoSubGrupoEstoque.cboGrupoChange(Sender: TObject);

var
ClassGrupoConsulta,ClassSubgrupo : TClasseCombo;
StringGrupo : String;
begin

  cboSubGrupo.Enabled := True;

  with dmModule do begin

    if cboGrupo.ItemIndex <> -1 Then begin//SE HOUVER REGISTRO NO COMBO
      ClassGrupoConsulta   := TClasseCombo( cboGrupo.Items.Objects[cboGrupo.ItemIndex] );//ATRIBUI A CLASSE COMBO NA VARIAVEL
      StringGrupo          := ' IDGRUPO=''' + InttoStr( ClassGrupoConsulta.ID ) + '''';//ATRIBUI O ID DO FIELD NA VARIAVEL STRING.

      //TRAZ NO COMBO SOMENTE OS COMBUSTIVEIS DO CADASTRO DE PRODUTOS REFERENTE AO ESTOQUE SELECIONADO.
      Commit(ibSubgrupo);
      ibSubgrupo.Close;
      ibSubgrupo.SQL.Clear;
      ibSubgrupo.SQL.Add('SELECT * FROM TBLSUBGRUPO WHERE ' + StringGrupo);
      ibSubgrupo.Open;

      cboSubgrupo.Clear;// LIMPA O COMBO
      while not ibSubgrupo.Eof do begin
        ClassSubgrupo    := TClasseCombo.Create;
        ClassSubgrupo.ID := ibSubgrupo.FieldByName('IDSUB').AsInteger;
        cboSubgrupo.Items.AddObject(ibSubgrupo.FieldByName('NOMESUBGRUPO').AsString,ClassSubgrupo);
        ibSubgrupo.Next;

      end;{while}

    end;{if}

  end;{with}

end;


procedure TfrmGrupoSubGrupoEstoque.FormShow(Sender: TObject);
begin

ckGeral.Checked := False;
ckZeroNegativo.Checked := False;
cboSubGrupo.Enabled := False;

  with dmModule do begin

    SELECTGrupo;
    SELECTSubGrupo;

  end;//with
  
end;

procedure TfrmGrupoSubGrupoEstoque.ibeaVisualizarClick(Sender: TObject);

  var
IDClassGrupo,IDClassSubGrupo : TClasseCombo;
NomeGrupo,NomeSubGrupo : String;

ConfirmaRelatorioExcel : Integer;
Excel : Variant;
Linha,Coluna:Integer;

begin

  with dmModule do begin

    if (cboGrupo.Text <> '')and(ckGeral.Checked = True)or(ckZeroNegativo.Checked = True) Then begin

      if (cboGrupo.Text <> '')and(cboSubGrupo.Text = '')Then begin

        if (cboGrupo.ItemIndex <> - 1) Then begin

        IDClassGrupo := TClasseCombo(cboGrupo.Items.Objects[cboGrupo.ItemIndex]);


          if ckGeral.Checked Then begin

          Commit(ibProdutos);
          ibProdutos.Close;
          ibProdutos.SQL.Clear;
          ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,TBLENTRADAESTOQUEPROD.QUANTIDADE As QtdeEstoque,'
          + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.DATAULTIMAENTR,TBLGRUPO.NOME As Grupo,'
          + 'TBLENTRADAESTOQUEPROD.VLRTOTAL FROM CADPRODUTOS '
          + 'INNER JOIN TBLENTRADAESTOQUEPROD ON CADPRODUTOS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
          + 'LEFT OUTER JOIN TBLGRUPO ON CADPRODUTOS.IDGRUPO=TBLGRUPO.IDGRUPO WHERE CADPRODUTOS.IDGRUPO=''' + IntToStr(IDClassGrupo.ID) + '''ORDER BY CADPRODUTOS.NOME');
          ibProdutos.Open;

          end;

          if ckZeroNegativo.Checked then begin

          Commit(ibProdutos);
          ibProdutos.Close;
          ibProdutos.SQL.Clear;
          ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,TBLENTRADAESTOQUEPROD.QUANTIDADE As QtdeEstoque,'
          + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.DATAULTIMAENTR,TBLGRUPO.NOME As Grupo,'
          + 'TBLENTRADAESTOQUEPROD.VLRTOTAL FROM CADPRODUTOS '
          + 'INNER JOIN TBLENTRADAESTOQUEPROD ON CADPRODUTOS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
          + 'LEFT OUTER JOIN TBLGRUPO ON CADPRODUTOS.IDGRUPO=TBLGRUPO.IDGRUPO WHERE CADPRODUTOS.IDGRUPO=''' + IntToStr(IDClassGrupo.ID) + ''' and TBLENTRADAESTOQUEPROD.QUANTIDADE <=0 ORDER BY CADPRODUTOS.NOME');
          ibProdutos.Open;

          end;


        end;//if

       Application.CreateForm(TfrmGrupoSubGrupoEstoqueRelat, frmGrupoSubGrupoEstoqueRelat);

        TRY

          with frmGrupoSubGrupoEstoqueRelat do begin

            frmGrupoSubGrupoEstoqueRelat.qrpRelEstoqueGrupoSubGrupo.DataSet := ibProdutos;


            //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
            qrdbDescricao.DataSet    := ibProdutos;
            qrdbDescricao.DataField  := ibProdutos.FieldByName('NOME').FieldName;

            qrdbQtdeMinima.DataSet     := ibProdutos;
            qrdbQtdeMinima.DataField   := ibProdutos.FieldByName('ESTOQUEMIN').FieldName;

            qrdbQtde.DataSet        := ibProdutos;
            qrdbQtde.DataField      := ibProdutos.FieldByName('QtdeEstoque').FieldName;

            qrdbVlrUnit.DataSet       := ibProdutos;
            qrdbVlrUnit.DataField     := ibProdutos.FieldByName('VALORVENDAA').FieldName;
            (ibProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbVlrCusto.DataSet       := ibProdutos;
            qrdbVlrCusto.DataField     := ibProdutos.FieldByName('VALORCUSTO').FieldName;
            (ibProdutos.FieldByName('VALORCUSTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbTotal.DataSet    := ibProdutos;
            qrdbTotal.DataField  := ibProdutos.FieldByName('VLRTOTAL').FieldName;
            (ibProdutos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbLucroVenda.DataSet        := ibProdutos;
            qrdbLucroVenda.DataField      := ibProdutos.FieldByName('LUCROVENDA').FieldName;

            qrdbVctoLote.DataSet        := ibProdutos;
            qrdbVctoLote.DataField      := ibProdutos.FieldByName('VCTOLOTE').FieldName;

            qrdbDtUltEntr.DataSet        := ibProdutos;
            qrdbDtUltEntr.DataField      := ibProdutos.FieldByName('DATAULTIMAENTR').FieldName;

            if cboGrupo.Text <> '' Then begin

              NomeGrupo := cboGrupo.Text;

            end else begin

              NomeGrupo := '';

            end;

            if cboSubGrupo.Text <> '' Then begin

              NomeSubGrupo := cboSubGrupo.Text;

            end else begin

              NomeSubGrupo := '';

            end;

            frmGrupoSubGrupoEstoqueRelat.qrl_NomeGrupo.Caption := NomeGrupo;
            frmGrupoSubGrupoEstoqueRelat.qrl_NomeSubGrupo.Caption := NomeSubGrupo;

    ConfirmaRelatorioExcel := Application.MessageBox('Deseja Emitir Relatório para o Excel?','Relatório para Excel',+MB_YESNO+MB_ICONQUESTION);

    if ConfirmaRelatorioExcel = 6 Then begin

        Excel := CreateOleObject('Excel.Application');
        Excel.Visible :=True;
        Excel.Workbooks.Add;
        Excel.Caption := 'Relatorio de Estoque por Grupo e SubGrupo: '+'Grupo: '+cboGrupo.Text+' SubGrupo: '+cboSubGrupo.Text;
        Excel.Cells[1,1] := 'Nome';
        Excel.Cells[1,3] := 'Estoque Min.';
        Excel.Cells[1,5] := 'Qtde Estoque';
        Excel.Cells[1,7] := ' Valor Venda';
        Excel.Cells[1,9] := ' Valor Custo';
        Excel.Cells[1,11] := ' Valor Total';
        Excel.Cells[1,13] := ' LucroVenda(%)';
        Excel.Cells[1,15] := ' Vcto Lote';
        Excel.Cells[1,17] := ' Última Entrada';
       { for Coluna := 1 to ibCadastro.FieldCount - 1 do
        begin
        Excel.Cells[1,Coluna] := ibCadastro.Fields[Coluna].DisplayName;
        end;}
        Linha := 2;
        ibProdutos.First;
        while not ibProdutos.Eof do
        begin
        for Coluna := 1 to ibProdutos.FieldCount - 1 do
        begin          //
        Excel.Cells[Linha,1] := ibProdutos.FieldByName('NOME').AsString;//ibEntrProdEstoque.Fields[Coluna].AsString;
        Excel.Cells[Linha,3] := FloatToStr(ibProdutos.FieldByName('ESTOQUEMIN').AsFloat);
        Excel.Cells[Linha,5] := FloatToStr(ibProdutos.FieldByName('QtdeEstoque').AsFloat);
        Excel.Cells[Linha,7] := FormatFloat(',0.00',ibProdutos.FieldByName('VALORVENDAA').AsFloat);
        Excel.Cells[Linha,9] := FormatFloat(',0.00',ibProdutos.FieldByName('VALORCUSTO').AsFloat);//FloatToStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat);
        Excel.Cells[Linha,11] := FormatFloat(',0.00',ibProdutos.FieldByName('VLRTOTAL').AsFloat);
        Excel.Cells[Linha,13] := ibProdutos.FieldByName('LUCROVENDA').AsString;
        Excel.Cells[Linha,15] := FormatDateTime('dd/mm/yyyy',ibProdutos.FieldByName('VCTOLOTE').AsDateTime);
        Excel.Cells[Linha,17] := FormatDateTime('dd/mm/yyyy',ibProdutos.FieldByName('DATAULTIMAENTR').AsDateTime);
        end;
        Inc(Linha);
        ibProdutos.Next;
        end;
        Excel.Columns.AutoFit;
        //Excel.WorkBooks[1].Save;
        //Excel.WorkBooks[1].Close; }

      end;
            

            qrpRelEstoqueGrupoSubGrupo.Preview;

          end; {if}


        EXCEPT
          on E : Exception do begin
             frmGrupoSubGrupoEstoqueRelat.Release;
             MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
          end;
        END;
      //////////////////////////////////////////////////////////////

      end;//if

      if (cboSubGrupo.Text <> '')and(cboGrupo.Text <> '')Then begin

        if (cboGrupo.ItemIndex <> - 1)and(cboSubGrupo.ItemIndex <> - 1) Then begin

        IDClassSubGrupo := TClasseCombo(cboSubGrupo.Items.Objects[cboSubGrupo.ItemIndex]);
        IDClassGrupo := TClasseCombo(cboGrupo.Items.Objects[cboGrupo.ItemIndex]);


          if ckGeral.Checked Then begin

          Commit(ibProdutos);
          ibProdutos.Close;
          ibProdutos.SQL.Clear;
          ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,TBLENTRADAESTOQUEPROD.QUANTIDADE As QtdeEstoque,'
          + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.DATAULTIMAENTR,TBLGRUPO.NOME As Grupo,'
          + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLSUBGRUPO.NOMESUBGRUPO FROM CADPRODUTOS '
          + 'INNER JOIN TBLENTRADAESTOQUEPROD ON CADPRODUTOS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
          + 'LEFT OUTER JOIN TBLGRUPO ON CADPRODUTOS.IDGRUPO=TBLGRUPO.IDGRUPO '
          + 'LEFT OUTER JOIN TBLSUBGRUPO ON CADPRODUTOS.IDSUBGRUPO=TBLSUBGRUPO.IDSUB WHERE CADPRODUTOS.IDGRUPO=''' + IntToStr(IDClassGrupo.ID) + '''and CADPRODUTOS.IDSUBGRUPO=''' + IntToStr(IDClassSubGrupo.ID) + '''ORDER BY CADPRODUTOS.NOME');
          ibProdutos.Open;

          end;

          if ckZeroNegativo.Checked Then begin

          Commit(ibProdutos);
          ibProdutos.Close;
          ibProdutos.SQL.Clear;
          ibProdutos.SQL.Add('SELECT CADPRODUTOS.*,TBLENTRADAESTOQUEPROD.QUANTIDADE As QtdeEstoque,'
          + 'TBLENTRADAESTOQUEPROD.ESTOQUEMIN,TBLENTRADAESTOQUEPROD.DATAULTIMAENTR,TBLGRUPO.NOME As Grupo,'
          + 'TBLENTRADAESTOQUEPROD.VLRTOTAL,TBLSUBGRUPO.NOMESUBGRUPO FROM CADPRODUTOS '
          + 'INNER JOIN TBLENTRADAESTOQUEPROD ON CADPRODUTOS.IDPROD=TBLENTRADAESTOQUEPROD.IDPROD '
          + 'LEFT OUTER JOIN TBLGRUPO ON CADPRODUTOS.IDGRUPO=TBLGRUPO.IDGRUPO '
          + 'LEFT OUTER JOIN TBLSUBGRUPO ON CADPRODUTOS.IDSUBGRUPO=TBLSUBGRUPO.IDSUB WHERE CADPRODUTOS.IDGRUPO=''' + IntToStr(IDClassGrupo.ID) + '''and CADPRODUTOS.IDSUBGRUPO=''' + IntToStr(IDClassSubGrupo.ID) + '''and TBLENTRADAESTOQUEPROD.QUANTIDADE <=0 ORDER BY CADPRODUTOS.NOME');
          ibProdutos.Open;

          end;

       Application.CreateForm(TfrmGrupoSubGrupoEstoqueRelat, frmGrupoSubGrupoEstoqueRelat);

        TRY

          with frmGrupoSubGrupoEstoqueRelat do begin

            frmGrupoSubGrupoEstoqueRelat.qrpRelEstoqueGrupoSubGrupo.DataSet := ibProdutos;


            //ATRIBUI OS NOMES DOS CAMPOS AOS QRDBTEXT DO QUICKREPORT
            qrdbDescricao.DataSet    := ibProdutos;
            qrdbDescricao.DataField  := ibProdutos.FieldByName('NOME').FieldName;

            qrdbQtdeMinima.DataSet     := ibProdutos;
            qrdbQtdeMinima.DataField   := ibProdutos.FieldByName('ESTOQUEMIN').FieldName;

            qrdbQtde.DataSet        := ibProdutos;
            qrdbQtde.DataField      := ibProdutos.FieldByName('QtdeEstoque').FieldName;

            qrdbVlrUnit.DataSet       := ibProdutos;
            qrdbVlrUnit.DataField     := ibProdutos.FieldByName('VALORVENDAA').FieldName;
            (ibProdutos.FieldByName('VALORVENDAA') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbVlrCusto.DataSet       := ibProdutos;
            qrdbVlrCusto.DataField     := ibProdutos.FieldByName('VALORCUSTO').FieldName;
            (ibProdutos.FieldByName('VALORCUSTO') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbTotal.DataSet    := ibProdutos;
            qrdbTotal.DataField  := ibProdutos.FieldByName('VLRTOTAL').FieldName;
            (ibProdutos.FieldByName('VLRTOTAL') as TFloatField).DisplayFormat := CasasDecimais('Produtos'); //CRIA UMA MASCARA PARA O CAMPO

            qrdbLucroVenda.DataSet        := ibProdutos;
            qrdbLucroVenda.DataField      := ibProdutos.FieldByName('LUCROVENDA').FieldName;

            qrdbVctoLote.DataSet        := ibProdutos;
            qrdbVctoLote.DataField      := ibProdutos.FieldByName('VCTOLOTE').FieldName;

            qrdbDtUltEntr.DataSet        := ibProdutos;
            qrdbDtUltEntr.DataField      := ibProdutos.FieldByName('DATAULTIMAENTR').FieldName;
            
            if cboGrupo.Text <> '' Then begin

              NomeGrupo := cboGrupo.Text;

            end else begin

              NomeGrupo := '';

            end;

            if cboSubGrupo.Text <> '' Then begin

              NomeSubGrupo := cboSubGrupo.Text;

            end else begin

              NomeSubGrupo := '';

            end;

            frmGrupoSubGrupoEstoqueRelat.qrl_NomeGrupo.Caption := NomeGrupo;
            frmGrupoSubGrupoEstoqueRelat.qrl_NomeSubGrupo.Caption := NomeSubGrupo;

    ConfirmaRelatorioExcel := Application.MessageBox('Deseja Emitir Relatório para o Excel?','Relatório para Excel',+MB_YESNO+MB_ICONQUESTION);

    if ConfirmaRelatorioExcel = 6 Then begin

        Excel := CreateOleObject('Excel.Application');
        Excel.Visible :=True;
        Excel.Workbooks.Add;
        Excel.Caption := 'Relatorio de Estoque por Grupo e SubGrupo: '+'Grupo: '+cboGrupo.Text+' SubGrupo: '+cboSubGrupo.Text;
        Excel.Cells[1,1] := 'Nome';
        Excel.Cells[1,3] := 'Estoque Min.';
        Excel.Cells[1,5] := 'Qtde Estoque';
        Excel.Cells[1,7] := ' Valor Venda';
        Excel.Cells[1,9] := ' Valor Custo';
        Excel.Cells[1,11] := ' Valor Total';
        Excel.Cells[1,13] := ' LucroVenda(%)';
        Excel.Cells[1,15] := ' Vcto Lote';
        Excel.Cells[1,17] := ' Última Entrada';
       { for Coluna := 1 to ibCadastro.FieldCount - 1 do
        begin
        Excel.Cells[1,Coluna] := ibCadastro.Fields[Coluna].DisplayName;
        end;}
        Linha := 2;
        ibProdutos.First;
        while not ibProdutos.Eof do
        begin
        for Coluna := 1 to ibProdutos.FieldCount - 1 do
        begin          //
        Excel.Cells[Linha,1] := ibProdutos.FieldByName('NOME').AsString;//ibEntrProdEstoque.Fields[Coluna].AsString;
        Excel.Cells[Linha,3] := FloatToStr(ibProdutos.FieldByName('ESTOQUEMIN').AsFloat);
        Excel.Cells[Linha,5] := FloatToStr(ibProdutos.FieldByName('QtdeEstoque').AsFloat);
        Excel.Cells[Linha,7] := FormatFloat(',0.00',ibProdutos.FieldByName('VALORVENDAA').AsFloat);
        Excel.Cells[Linha,9] := FormatFloat(',0.00',ibProdutos.FieldByName('VALORCUSTO').AsFloat);//FloatToStr(ibEntrProdEstoque.FieldByName('VALORVENDAA').AsFloat);
        Excel.Cells[Linha,11] := FormatFloat(',0.00',ibProdutos.FieldByName('VLRTOTAL').AsFloat);
        Excel.Cells[Linha,13] := ibProdutos.FieldByName('LUCROVENDA').AsString;
        Excel.Cells[Linha,15] := FormatDateTime('dd/mm/yyyy',ibProdutos.FieldByName('VCTOLOTE').AsDateTime);
        Excel.Cells[Linha,17] := FormatDateTime('dd/mm/yyyy',ibProdutos.FieldByName('DATAULTIMAENTR').AsDateTime);
        end;
        Inc(Linha);
        ibProdutos.Next;
        end;
        Excel.Columns.AutoFit;
        //Excel.WorkBooks[1].Save;
        //Excel.WorkBooks[1].Close; }

      end;
            

            qrpRelEstoqueGrupoSubGrupo.Preview;

          end; {if}


        EXCEPT
          on E : Exception do begin
             frmGrupoSubGrupoEstoqueRelat.Release;
             MessageDlg('Ocorreu um erro ao tentar mostrar o Formulário: ' + E.Message,mtError,[mbOk],0);
          end;
        END;
      //////////////////////////////////////////////////////////////


        end;//if

      end;//if


     // end;//if cbogrupo

    end;//ckgeral/zeranegativo

  end;//with


end;

procedure TfrmGrupoSubGrupoEstoque.ckGeralCheck(Sender: TObject);
begin

  if ckGeral.Checked Then begin

    ckZeroNegativo.Checked := False;

  end;

end;

procedure TfrmGrupoSubGrupoEstoque.ckZeroNegativoCheck(Sender: TObject);
begin

  if ckZeroNegativo.Checked Then begin

    ckGeral.Checked := False;

  end;

end;

end.
