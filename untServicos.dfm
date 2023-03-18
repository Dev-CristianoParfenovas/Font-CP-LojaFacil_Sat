object frmVendasLoja: TfrmVendasLoja
  Left = 0
  Top = 5
  BorderIcons = [biMinimize]
  BorderStyle = bsNone
  Caption = 'CP SISTEMMAS'
  ClientHeight = 608
  ClientWidth = 1022
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgFundoCx: TImage
    Left = 0
    Top = 0
    Width = 1022
    Height = 608
    Align = alClient
    Stretch = True
    ExplicitWidth = 1016
    ExplicitHeight = 579
  end
  object lbl_edtSubTotal: TLabel
    Left = 695
    Top = 433
    Width = 161
    Height = 78
    Caption = '0,00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -64
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_edtInformacao: TLabel
    Left = 238
    Top = 3
    Width = 251
    Height = 45
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -29
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object lbl_CancelaItem: TLabel
    Left = 385
    Top = 214
    Width = 144
    Height = 19
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_TotalVendido: TLabel
    Left = 698
    Top = 402
    Width = 211
    Height = 32
    Caption = 'Total a Pagar:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_NomeProd: TLabel
    Left = 246
    Top = 110
    Width = 458
    Height = 23
    AutoSize = False
    Caption = '     '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_X: TLabel
    Left = 290
    Top = 7
    Width = 16
    Height = 24
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object lbl_edtIgual: TLabel
    Left = 332
    Top = 7
    Width = 13
    Height = 24
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object lbl_Sangria: TLabel
    Left = 539
    Top = 523
    Width = 189
    Height = 21
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_NomeFuncComissao: TLabel
    Left = 729
    Top = 61
    Width = 280
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_CodPosVenda: TLabel
    Left = 536
    Top = 520
    Width = 49
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_QtdeEstoque: TLabel
    Left = 468
    Top = 213
    Width = 149
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_IDCli: TLabel
    Left = 730
    Top = 539
    Width = 55
    Height = 13
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object lbl_CodVendaMPV: TLabel
    Left = 679
    Top = 153
    Width = 75
    Height = 20
    AutoSize = False
    Transparent = True
  end
  object Shape4: TShape
    Left = 724
    Top = 2
    Width = 284
    Height = 57
    Pen.Style = psClear
    Shape = stRoundRect
  end
  object Label2: TLabel
    Left = 729
    Top = 35
    Width = 59
    Height = 13
    Caption = 'Operador:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_Func: TLabel
    Left = 791
    Top = 34
    Width = 82
    Height = 16
    AutoSize = False
    Caption = '.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_Data: TLabel
    Left = 763
    Top = 8
    Width = 88
    Height = 13
    AutoSize = False
    Caption = '.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_Dt: TLabel
    Left = 729
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Data:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_Cupom: TLabel
    Left = 877
    Top = 34
    Width = 61
    Height = 16
    Caption = 'Cupom N'#186
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_CodVenda: TLabel
    Left = 942
    Top = 34
    Width = 60
    Height = 20
    AutoSize = False
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Shape5: TShape
    Left = 7
    Top = 241
    Width = 650
    Height = 360
    Shape = stRoundRect
  end
  object Shape2: TShape
    Left = 684
    Top = 166
    Width = 328
    Height = 43
    Pen.Style = psClear
    Shape = stRoundRect
  end
  object Shape3: TShape
    Left = 684
    Top = 238
    Width = 328
    Height = 42
    Pen.Style = psClear
    Shape = stRoundRect
  end
  object Shape1: TShape
    Left = 684
    Top = 309
    Width = 328
    Height = 43
    Pen.Style = psClear
    Shape = stRoundRect
  end
  object shapeImgEmpresa: TShape
    Left = 7
    Top = 4
    Width = 225
    Height = 232
    Shape = stRoundRect
  end
  object imgLogoCli: TImage
    Left = 17
    Top = 16
    Width = 205
    Height = 210
    Picture.Data = {
      0954474946496D616765474946383961CD003300F70000371963E0DEEB5A4C92
      CD251CACA5C7857BAD2C1F77C6C2D6DB3229F8F8FB42318270639B938AB6BBB5
      D1811C3DE46C65191576BDB6D3D8D5E5EFEEF3CD25214C3B88EB949065599965
      1D4C1F0B6A9C94BD7B71A5A6313F38257A271370E0DEE8E92511B02229B1ABCB
      FAECEC8A7FB1E3635CFFFFFFD0CDE0F9DAD84B3B84A49DBFE1524B29176C7469
      A361529552438CE77A74E7E5EFF2B7B34126742A1872E04B423F2D7EC4BED7D0
      261B6C609DF7F6F926116D5B1C51211473D3D0DF952035DB251A2F1B747A6DA6
      DE443ACCC7DDB8B2CF8276AB978EBAEFA6A2CB707556488E897EB0E0D2DE3321
      78EBE9F093213EC0BBD5A59DC4E7D1D6C8251F3A297C9187B55E5193EB8F8973
      66A2665A96F3F2F712147C4D3F886A5C9CE4E1EDFAE6E5E6756FB3AEC9E62717
      DC3B31AFA8CA7F1F3FFEF8F8220F6BFFF7FFD5D1E39D2139181478C8C4DB7F73
      AA471A5AEE5042A594BD998FBB57488ED6261D4735838E84B4511A57A8A1C5C0
      24281F167441307DF3BDBA8B1F3B4E3F86B5AECE30186DE62714E9827DF1AFAC
      E43325F07164F16A5DFFE6E6841E44A62234D72718EFEEF5311F74D72319DBD7
      E67A669BDF271AEB27121A167921197B6B5A94FDF1F0F7B5B595213D12157C60
      1C4FF0ABA7421963F29C95FADFDDE97F7AE57670000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000021F90400070000002C
      00000000CD0033000008FF004D081C48B0A0C18308132A5CC8B0A1C38710234A
      9C48B1A2C58B18336ADCC8B1A3C78F20438A1C49B2A4C99328113A11B144C886
      2A0774A49C49B366C60075E8D0F0C0D3030D2B7712D81C4AB4A8C1303678D258
      CA74A9950F46A34A45A9A2A9D5A6741A4DDDCAB5E381AB6097F699D0B5AC5989
      5A52F80C7B75C9D9B77013DE611BD64012420FC058D84329AEDFAE09B2ACA5DB
      349203108C12331A72E5CBDFC7469DD0194C7869243B8080CCD9BC794C26C8A0
      6B9E5854D96A1E00381E715E1D28B4EB935F4B37CDF36780EAD59B19C11818C3
      4F1D1204B41274B2A48071E34B5410D1B2700281E3D097B46990808191E34E04
      EAF0531CBAF136774C44FF69D3DDFBF125CCA1B4310FDD8888814EC814D02081
      A0040D05086427A823429D2A370CF71C7D08F5F65B7007A511C775EC05405023
      1DC8C6541E9A24721B6E9B6D62820636ECC4D3226D902550236CBDF01E428D54
      D093073BB4E8E2063A24A5541A26382140532EBA284002729CD19355397A6142
      1594E5E8620E0215A1404F41302050151E7AA0400303357223535D9005C5924A
      9160501C54AC184488046900A491010E340117945516090F8060C819108338D2
      034F027411049E227E10E1524D54605515080930181558B48045A239F8A183A0
      4B05A1951083759083A28C6AB0610E58082147530A08A1A8108A6C38D80B422C
      BA680B39844704587E90FFA1145341106182226A35E5410B44EC69551C04B5D1
      93157AF264057326A4619512A2AADA025404B5D0266191F001899C9B0172481E
      4BBD20D4063D093162134CD9A00501413445804101A4CBD489054DA053A45E68
      A1C78A4E2E24C28A587CB9A2A6087531980B2F78D041984A58D1541726DC3158
      051700EA810D3990BB14153108E4304F720845294F6D3C8995500B4121E1522C
      4C71216E8F50F007B734B42090063D2D525F2316D340057324345501C955BABB
      945B06C94B6BBD1D3285E442040CB63441710C7644422F3435011B4D41F181D0
      74985080BA2690B694B85C347582093A4CB693CCA646AA551D95DACA9060B25D
      52C6B5D8428248244CF5FF6B02DC3D39F941CE5490D52E538B384850026C3605
      AF9AF3D220A9095D5835B5424D2BED2F53971B9440D54C5DDD54048D706D421B
      60E74C7653B6BEBA94077E47CD5478B1314547A90B7991546597D8F1C8CAB841
      6209DF4B2D4D04031A68C04080383355B809312C52B37004D5BE5407F5116474
      A4F57D4085555060EEF4E64B755ED0E74D397143530D4820740A2618D1545039
      CB5C3653B612C014EC021D21B540945A58437C702FBA6CC10DA9C1D66620F104
      E2D1E06906F1C29F74C61C33314501402B93555E2013C8D12A7B45B08A0D1477
      90CC15CF2034630AC03C07BAA5A88F7DEE630AFCE437BB04D4CF04F75B4AFEF6
      C736D92D055826D0821CFF2863BE847CC00561894424300004312870810DD41C
      8A7266031310E17B4CC9D7417240197179907B03A98355768410133ED020FEEB
      C91112D0C1C5B590062F644AFBDE17BFF9D99029F6635DC3F6E737FF31058826
      90C0049712BE864061014DC8030416F9074C840012C09313031D08418228C20A
      83694217C4B6942E64B0205A681C53A2F045C965CF04097001658C50C6F11184
      0C58BCD80B2E80AC81A08F29715CCA1C6558C71ADE30873468441A92062827A4
      B22980344104AC42052139440A1CF8C10F1031054064E6899C99A4140D12830E
      5066453660C0270D72829C498E0D02D99E2987A300AB3C6E2066ACE412DAE481
      26E0CE966FCC250D76B9FF9419DAF1974D090014A67595649A800483F100191B
      628637581310917CA2364F5823229CE00444A857C468250717B44003245C0819
      AC4287ECA83308A714C80184468326D0A820F12C881F8849030508000BB514C8
      2D5DB83E39C6B09FBD5C0AFDF088C3A634E20391D39900ACD0CE3F9EEF029429
      C0433C814D0542420D94EC5F1016B1882010CA4FCE8BC138196204CAF44B1191
      43A941AAD214257C32A605F1E30F1330CE9DC2B1A7BAFC290DFCE94BA202D356
      73791D16E8EA431A18147A4B1A9D436450556C89010F4D895DD64C108009EE6C
      223A5018AD9C90B60F1EA40556412741E05AA6C1ACF07CF9C4EB3EF5CA57A1DE
      712979C49F09462AD899FF0DE6B02660C304F9C7D02130A2B11802040FD6B094
      0B3CA9271D3341F32E262289F8C12A8DE82C182368152A8DD69550332D42ECAA
      4F7EEE35A834182A6C8B2A5BFDBD6E0102292C6E29B73FE33A0409BF05EE6A5A
      36831E488E0164686A13E4B65C9D3557216910811F065C840640B5270AD08116
      D2FA81950C78C00D104253120753EC0EA4B05888C083072C82FAE4D37ADE6D6D
      785F1B33F2EAD004E6DD097A4D50580D24000A0286701468EAA5879420BEF2DD
      4C219810B11579800E7253AED09AF0DF84B480057421830926D0D4A5C4C08C60
      A983411C8625341294872680144F9B5204655DD0041B684A14121059132415B0
      FB5B1A034C3B81267CB3FF2929C8D843BEE0DB1CCFA1062340A51F7240070558
      4103FF0D40051440E817DC532175D003A117BD682B444020975C744923A06846
      2F5A0EEB32881F181DB282A8A0D2965EB40DA47C01493B810D8C864223FA4C68
      019880018C16410252B068A9BA80D13E30810844DD6915309A005A1000A8194D
      0723EC072228A833706BC089F3E594205A88B6229E9D90044C3BDAD88E3628A7
      3D6D545E3BDBDADEEEB51551D76F835BDA32D1C2B7212D6DA1801B9513687710
      B99D6E6E23CBDAE8D6E9B8DD6D6E7953E40B25006E09FAF29A821B251335E08C
      6216BE024118FCE1119173472821834EAC600C0840C0185610081998A1281388
      8117463E568867440B05FFF06823BC90698E9881125FF802253E6E141274C006
      2FA80017A867728E48E0088A6003165C50C49E17E4032A9E4000EA75044DA5A1
      0E0530020902601D0654610345980003A06E04636B5D533720C1D96A7484028C
      1D0A5C2701B208509C424A800469AFA51634D0860398E0034BF0832290D708E3
      54A10E4240671A8C50858C25800024500471942C1032B4C10F0329421B0840B2
      1830A000D9B33CE68DAEBD25C559205AA0810DBC30993A9041044E8042013C40
      853B4840598B200301F483C40AE4800B5BAD171794D08626B021064B890219C8
      2093CF7940093498DABE52207BE2EB54000A58C23E5F7501A44BCA0FD2E20201
      BC408426B4E1D609A099FF0D2E70016F92B2004D204110A45C874530E08C95BD
      80006CD00826CB010B1D0832E757EA81E46AA1035CE0042A623ECA6205022101
      34200703A10834C005077006D897012710011EA0025E4003583001A45148CFE7
      014E50390170031EE04504D10034C04A1E600558D30201D0041DC01C14D869D2
      B2121E500446B00337400726E2016D40662EC0384DE00554A00026D002017804
      67A005EBC3000EE37A23C879D9E50152F57F5DD32BFB3410AFE26A2670020D88
      2C8AD0045C70036750042D900169E03047C085C6252B4D704A09702331602622
      70001E90036D241051400342E0050AB53E58D0822FA86B4F68025015004DB804
      3B00055C20004D5300C0FF670582D60127600318C4464578063110056750072A
      E0015170027508850481053CA1645440073241331DA03859281062848142F185
      1500056388051900051163033AC130A7E3012F706F704833458050EB5710A4D8
      0493E10226F3872E582AFBE24585E8306C97888B48003B500751504F7410040A
      308909067A4B42076152059DF889A1288A3AC526BFA800A82810084546AD985B
      0D2867B2288645608B27D0894BB04CEE950050D5696F48038A408A8D50041ED0
      05876602559103AFA28223E8044DD00432F18C02C14534480688A8888CE8014B
      100034A0044440071DD00894E8355610036DB0032A908DE4E8014EC8369C2701
      5510074790145DA0033AFF1303507000E227146CE0011570803A73031100057C
      680311900177700112282B71F00129E80411C00629D98F0513315255043BA004
      44090524A33F4290005232012E40077351634DB334CBA4022DB0081380053BA0
      241510053B2004A1B78E1E30014BD0042240033FD80667000522280431D00439
      F07E8F068544D0058C99030520244250078DD098BC32220B402826E005429003
      5D700158F00146B00469D0057E10055DC07D3910013180059F78015D90036D00
      2D2C960339702227B0009C79012D803B44800504A00358E0163A60042EA00203
      7102AD3210B8880534A2023990062450056C900364A00558C0005A400219B821
      73291404F09C69909C692E800517C081E8789E19A10195849EEC19123140062B
      D69EF2F9118E679CF3799F1C9106FA879FFCD99FFE191A0101003B}
    OnClick = imgLogoCliClick
  end
  object Shape6: TShape
    Left = 238
    Top = 166
    Width = 421
    Height = 43
    Pen.Style = psClear
    Shape = stRoundRect
  end
  object lbl_CnpjCpfP: TLabel
    Left = 33
    Top = 558
    Width = 52
    Height = 22
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_edtCnpjCpf: TLabel
    Left = 84
    Top = 558
    Width = 184
    Height = 22
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object lbl_Cliente: TLabel
    Left = 17
    Top = 528
    Width = 155
    Height = 22
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object lbl_CodCliente: TLabel
    Left = 178
    Top = 528
    Width = 52
    Height = 23
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object lbl_edtPacoteFardo: TLabel
    Left = 277
    Top = 558
    Width = 149
    Height = 20
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_TipoPreco: TLabel
    Left = 277
    Top = 528
    Width = 160
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_IDPlacaVeiculo: TLabel
    Left = 391
    Top = 491
    Width = 34
    Height = 13
    AutoSize = False
    Transparent = True
  end
  object Shape7: TShape
    Left = 1040
    Top = 686
    Width = 227
    Height = 45
    Pen.Style = psClear
    Shape = stRoundRect
    Visible = False
  end
  object lbl_IDFuncComissao: TLabel
    Left = 545
    Top = 124
    Width = 55
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object lbl_F4: TLabel
    Left = 32
    Top = 602
    Width = 97
    Height = 16
    Caption = 'F4 - Inicia Venda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F3: TLabel
    Left = 32
    Top = 621
    Width = 112
    Height = 16
    Caption = 'F3 - Finaliza Venda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F6: TLabel
    Left = 32
    Top = 640
    Width = 103
    Height = 16
    Caption = 'F6 - Cancela Item'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_CtrlF6: TLabel
    Left = 32
    Top = 680
    Width = 199
    Height = 16
    Caption = 'CTRL_F6 - Cancela todos os itens'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_CTRLD: TLabel
    Left = 32
    Top = 699
    Width = 223
    Height = 16
    Caption = 'CTRL_D - Cancela '#250'ltimo cupom fiscal'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F8: TLabel
    Left = 320
    Top = 602
    Width = 78
    Height = 16
    Caption = 'F8 - Pre'#231'o(B)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F9: TLabel
    Left = 320
    Top = 621
    Width = 78
    Height = 16
    Caption = 'F9 - Pre'#231'o(C)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F1: TLabel
    Left = 320
    Top = 640
    Width = 165
    Height = 16
    Caption = 'F1 - Limpa campos do caixa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_CTRLN: TLabel
    Left = 320
    Top = 680
    Width = 270
    Height = 16
    Caption = 'CTRL_U - Reimprime '#250'ltimo cupom fiscal(SAT)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_CTRLS: TLabel
    Left = 320
    Top = 699
    Width = 136
    Height = 16
    Caption = 'CTRL_S - Sair do caixa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_Hr: TLabel
    Left = 877
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Hora:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_Relogio: TLabel
    Left = 913
    Top = 8
    Width = 82
    Height = 16
    AutoSize = False
    Caption = '.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F7: TLabel
    Left = 32
    Top = 661
    Width = 137
    Height = 16
    Caption = 'F7 - Pesquisa Produtos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_F10: TLabel
    Left = 320
    Top = 661
    Width = 237
    Height = 16
    Caption = 'F10 - Abre Vendas Pendente(P'#243's Venda)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 500
    Top = 192
    Width = 149
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_TrocaMercadoria: TLabel
    Left = 828
    Top = 145
    Width = 149
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_Orcamento: TLabel
    Left = 272
    Top = 88
    Width = 121
    Height = 18
    AutoSize = False
    Caption = 'Or'#231'amento N'#186':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl_IdOrc: TLabel
    Left = 399
    Top = 88
    Width = 59
    Height = 18
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object ListBoxDadosEmpresa: TListBox
    Left = 365
    Top = 5
    Width = 20
    Height = 20
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvSpace
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 7
    Visible = False
  end
  object listboxCupom: TListBox
    Left = 347
    Top = 6
    Width = 22
    Height = 19
    BevelInner = bvSpace
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
  end
  object lbl_edtIDProdCX: TLabeledEdit
    Left = 393
    Top = 5
    Width = 32
    Height = 21
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvSpace
    BorderStyle = bsNone
    EditLabel.Width = 78
    EditLabel.Height = 13
    EditLabel.Caption = 'lbl_edtIDProdCX'
    EditLabel.Transparent = True
    TabOrder = 8
    Visible = False
  end
  object lbl_edtCodCartao: TLabeledEdit
    Left = 297
    Top = -8
    Width = 24
    Height = 28
    BevelInner = bvSpace
    BorderStyle = bsNone
    Color = clWhite
    Ctl3D = True
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd.Cart'#227'o'
    EditLabel.Color = clWhite
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold, fsUnderline]
    EditLabel.ParentColor = False
    EditLabel.ParentFont = False
    EditLabel.Transparent = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 7
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnExit = lbl_edtCodCartaoExit
  end
  object lbl_edtCodBarras: TLabeledEdit
    Left = 241
    Top = 170
    Width = 233
    Height = 34
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clWhite
    EditLabel.Width = 135
    EditLabel.Height = 25
    EditLabel.Caption = ' C'#243'd.Barras'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    EditLabel.Transparent = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    MaxLength = 13
    ParentFont = False
    TabOrder = 2
    OnChange = lbl_edtCodBarrasChange
    OnEnter = lbl_edtCodBarrasEnter
    OnExit = lbl_edtCodBarrasExit
    OnKeyPress = lbl_edtCodBarrasKeyPress
  end
  object lbl_edtCodProd: TLabeledEdit
    Left = 490
    Top = 170
    Width = 161
    Height = 34
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clWhite
    EditLabel.Width = 47
    EditLabel.Height = 25
    EditLabel.Caption = 'Ref.'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    EditLabel.Transparent = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    MaxLength = 11
    ParentFont = False
    TabOrder = 3
    OnEnter = lbl_edtCodProdEnter
    OnExit = lbl_edtCodProdExit
    OnKeyPress = lbl_edtCodProdKeyPress
  end
  object lbl_edtQtde: TLabeledEdit
    Left = 688
    Top = 241
    Width = 319
    Height = 34
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clWhite
    EditLabel.Width = 57
    EditLabel.Height = 25
    EditLabel.Caption = 'Qtde'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    EditLabel.Transparent = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    MaxLength = 6
    ParentFont = False
    TabOrder = 4
    Text = '0,00'
    OnEnter = lbl_edtQtdeEnter
    OnExit = lbl_edtQtdeExit
    OnKeyPress = lbl_edtQtdeKeyPress
  end
  object lbl_edtVlrTotal: TLabeledEdit
    Left = 689
    Top = 313
    Width = 318
    Height = 34
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clWhite
    EditLabel.Width = 59
    EditLabel.Height = 25
    EditLabel.Caption = 'Total'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    EditLabel.Transparent = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = '0,00'
    OnEnter = lbl_edtVlrTotalEnter
    OnExit = lbl_edtVlrTotalExit
    OnKeyPress = lbl_edtVlrTotalKeyPress
  end
  object lbl_edtFuncComissao: TLabeledEdit
    Left = 316
    Top = 8
    Width = 20
    Height = 28
    BevelInner = bvSpace
    BorderStyle = bsNone
    Color = clWhite
    Ctl3D = True
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = 'Funcion'#225'rio'
    EditLabel.Color = clWhite
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = [fsBold, fsUnderline]
    EditLabel.ParentColor = False
    EditLabel.ParentFont = False
    EditLabel.Transparent = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 8
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 9
    Visible = False
    OnExit = lbl_edtFuncComissaoExit
    OnKeyPress = lbl_edtFuncComissaoKeyPress
  end
  object lbl_edtVlrUnit: TLabeledEdit
    Left = 688
    Top = 170
    Width = 319
    Height = 34
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clWhite
    EditLabel.Width = 135
    EditLabel.Height = 25
    EditLabel.Caption = 'Vlr.Unit'#225'rio'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clBlack
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    EditLabel.Transparent = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = '0,00'
    OnEnter = lbl_edtVlrUnitEnter
    OnExit = lbl_edtVlrUnitExit
    OnKeyPress = lbl_edtVlrUnitKeyPress
  end
  object dbgVendas: TDBGrid
    Left = 23
    Top = 255
    Width = 614
    Height = 271
    Cursor = crHandPoint
    BorderStyle = bsNone
    FixedColor = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgServsCellClick
    OnKeyPress = dbgVendasKeyPress
  end
  object lbl_edtDescontoItem: TLabeledEdit
    Left = 1045
    Top = 689
    Width = 217
    Height = 39
    BevelInner = bvSpace
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 248
    EditLabel.Height = 25
    EditLabel.Caption = 'lbl_edtDescontoItem'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    EditLabel.Transparent = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    Text = '0,00'
    Visible = False
    OnExit = lbl_edtDescontoItemExit
    OnKeyPress = lbl_edtDescontoItemKeyPress
  end
  object ckAtualizaValor: TCheckBox
    Left = 240
    Top = 216
    Width = 136
    Height = 17
    Caption = 'CTRL_B - Atualiza Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = ckAtualizaValorCheck
  end
  object MainMenu1: TMainMenu
    Left = 464
    object Venda1: TMenuItem
      Caption = '&Geral'
      ShortCut = 16471
      Visible = False
      object Venda2: TMenuItem
        Caption = '&Clientes'
        ShortCut = 16451
        OnClick = Venda2Click
      end
      object InstrucoesCaixa1: TMenuItem
        Caption = '&Instrucoes Caixa'
        ShortCut = 16457
        OnClick = InstrucoesCaixa1Click
      end
      object NotaPaulista1: TMenuItem
        Caption = '&Nota Paulista'
        ShortCut = 16462
        OnClick = NotaPaulista1Click
      end
      object LimparClienteCnpj1: TMenuItem
        Caption = '&Limpar Cliente Cnpj'
        ShortCut = 16460
        OnClick = LimparClienteCnpj1Click
      end
      object LeituraX1: TMenuItem
        Caption = '&Leitura X'
        ShortCut = 16472
        OnClick = LeituraX1Click
      end
      object LeituraZ1: TMenuItem
        Caption = '&Leitura Z'
        ShortCut = 16474
        OnClick = LeituraZ1Click
      end
      object CadastrarFormasdePagto1: TMenuItem
        Caption = '&Cadastrar Formas de Pagto.'
        ShortCut = 16464
        OnClick = CadastrarFormasdePagto1Click
      end
      object AtualizaValor1: TMenuItem
        Caption = 'Atualiza Valor'
        ShortCut = 16450
        OnClick = AtualizaValor1Click
      end
      object CancelarItemCaixa1: TMenuItem
        Caption = '&Cancelar Cupom'
        ShortCut = 16452
        OnClick = CancelarItemCaixa1Click
      end
      object FecharCaixa1: TMenuItem
        Caption = '&Fechar Caixa'
        ShortCut = 16454
        OnClick = FecharCaixa1Click
      end
      object VendasTeste1: TMenuItem
        Caption = '&VendasTeste'
        ShortCut = 16499
        OnClick = VendasTeste1Click
      end
      object PacoteFardo1: TMenuItem
        Caption = '&PacoteFardo'
        ShortCut = 16500
        OnClick = PacoteFardo1Click
      end
      object CancelarCupomInteiro1: TMenuItem
        Caption = '&Cancelar Cupom Inteiro'
        ShortCut = 16501
        OnClick = CancelarCupomInteiro1Click
      end
      object LimparCPF1: TMenuItem
        Caption = '&LimparCPF'
        ShortCut = 16465
        OnClick = LimparCPF1Click
      end
      object Sangria1: TMenuItem
        Caption = '&Sangria'
        ShortCut = 16456
        OnClick = Sangria1Click
      end
      object ImprimirResumoVendas1: TMenuItem
        Caption = 'Imprimir Resumo Vendas'
        ShortCut = 16449
      end
      object roca1: TMenuItem
        Caption = '&Teste de Impress'#227'o'
        ShortCut = 16468
        OnClick = roca1Click
      end
      object Sair1: TMenuItem
        Caption = '&Sair'
        ShortCut = 16467
        OnClick = Sair1Click
      end
      object AbrirGaveta1: TMenuItem
        Caption = '&Abrir Gaveta'
        ShortCut = 16455
        OnClick = AbrirGaveta1Click
      end
      object ImprimiUltimoCupom1: TMenuItem
        Caption = '&Imprime Ultimo Cupom'
        ShortCut = 16469
        OnClick = ImprimiUltimoCupom1Click
      end
      object AbreGavetaBematech1: TMenuItem
        Caption = 'Abre Gaveta Bematech'
        ShortCut = 16466
      end
      object AbreGavetaTeste2: TMenuItem
        Caption = 'Encerra Or'#231'amento'
        ShortCut = 16453
        OnClick = AbreGavetaTeste2Click
      end
      object AbrirFuncionarios1: TMenuItem
        Caption = '&Abrir Funcionarios'
        ShortCut = 16461
        OnClick = AbrirFuncionarios1Click
      end
      object Orcamento1: TMenuItem
        Caption = '&Orcamento'
        ShortCut = 16463
        OnClick = Orcamento1Click
      end
    end
  end
  object opDialogImagem: TOpenDialog
    Filter = 
      'Todas Imagens (*.bmp,*.jpg)|*.jpg;*.bmp|Imagens JPEG (*.jpg)|*.j' +
      'pg|Imagens Bitmap (*.bmp)|*.bmp'
    Left = 432
    Top = 6
  end
  object popMnuImagem: TPopupMenu
    Left = 384
    Top = 6
    object popmnuProcurar: TMenuItem
      Caption = '&Procurar'
      ImageIndex = 0
      OnClick = popmnuProcurarClick
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 272
    Top = 48
  end
end
