unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.StdCtrls, Data.DB, MemDS, DBAccess, Uni,
  UniProvider, InterBaseUniProvider, cxPC, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Samples.Spin, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog,
  cxDBData, Vcl.Menus, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Mask,
  System.IniFiles, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit, frxClass,
  frxPreview, frxDBSet, frxBarcode, dxGDIPlusClasses, math;

type
  TForm1 = class(TForm)
    pnlPrincipal: TPanel;
    pnlTitulo: TPanel;
    con1: TUniConnection;
    intrbsnprvdr1: TInterBaseUniProvider;
    qry1: TUniQuery;
    pgcPrincipal: TPageControl;
    tsProduto: TTabSheet;
    tsPedido: TTabSheet;
    tsItemPedido: TTabSheet;
    txtDescricaoProduto: TEdit;
    txtValorProduto: TEdit;
    lblNumPedido: TLabel;
    cbbProduto: TDBLookupComboBox;
    seQuantidade: TSpinEdit;
    txtTotalItem: TEdit;
    grpItens: TGroupBox;
    txtTotalPedido: TEdit;
    Label2: TLabel;
    btnSalvarProduto: TSpeedButton;
    btnNovoItem: TSpeedButton;
    lbl1: TLabel;
    btnSalvarPedido: TSpeedButton;
    qryGridItens: TUniQuery;
    btnSalvarItens: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    tsCliente: TTabSheet;
    txtClienteCpf: TMaskEdit;
    txtClienteEmail: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    dsGridItens: TDataSource;
    btnSalvarCliente: TSpeedButton;
    mm1: TMainMenu;
    mniNovo1: TMenuItem;
    mniCliente1: TMenuItem;
    mniProduto1: TMenuItem;
    mniPedido1: TMenuItem;
    dsProduto: TDataSource;
    qryProduto: TUniQuery;
    intgrfldGridItensNUMPEDIDO: TIntegerField;
    intgrfldGridItensID: TIntegerField;
    qryGridItensDESCRICAO: TStringField;
    intgrfldGridItensQUANTIDADE: TIntegerField;
    fltfldGridItensTOTALITEM: TFloatField;
    cbbPagamento: TComboBox;
    Label10: TLabel;
    tsInicio: TTabSheet;
    qryProdutoID: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    spPedido: TUniStoredProc;
    btnPedidos: TSpeedButton;
    cbbCliente: TDBLookupComboBox;
    qryCliente: TUniQuery;
    dsCliente: TDataSource;
    qryClienteID: TSmallintField;
    qryClienteNOME: TStringField;
    txtCpf: TMaskEdit;
    txtEmail: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    seProduto: TSpinEdit;
    Label17: TLabel;
    grpTipoPedido: TGroupBox;
    rbEntrada: TRadioButton;
    rbSaida: TRadioButton;
    txtReferencia: TEdit;
    lbl3: TLabel;
    grpParcela: TGroupBox;
    sePagamento: TSpinEdit;
    Label11: TLabel;
    lstPagamento: TListBox;
    btnAlterarCliente: TSpeedButton;
    mniPesquisar1: TMenuItem;
    mniCliente2: TMenuItem;
    grpNomeCliente: TGroupBox;
    mniProduto2: TMenuItem;
    grpProduto: TGroupBox;
    cbbPesquisarProduto: TDBLookupComboBox;
    btnAlterarProduto: TSpeedButton;
    grdItensPedido: TDBGrid;
    btnAlterarItemPedido: TSpeedButton;
    btnAlterarItens: TSpeedButton;
    mniPedido2: TMenuItem;
    btnExcluirItemPedido: TSpeedButton;
    btnPesquisarPedido: TSpeedButton;
    txtNumeroPedido: TEdit;
    frxNota: TfrxReport;
    frdsNota: TfrxDBDataset;
    qryNota: TUniQuery;
    qryNotaID: TIntegerField;
    qryNotaIDPEDIDO: TIntegerField;
    qryNotaVALOR: TFloatField;
    qryNotaTIPO: TStringField;
    qryNotaPAGAMENTO: TStringField;
    qryNotaDATAEMISSAO: TDateField;
    qryNotaNATUREZA: TStringField;
    qryNotaNOMECLIENTE: TStringField;
    qryNotaCPFCLIENTE: TStringField;
    qryNotaEMAILCLIENTE: TStringField;
    frdsItensNota: TfrxDBDataset;
    qryItensNotas: TUniQuery;
    qryItensNotasID: TIntegerField;
    qryItensNotasQUANTIDADE: TIntegerField;
    qryItensNotasTOTALITEM: TFloatField;
    qryItensNotasDESCRICAO: TStringField;
    qryItensNotasVALOR: TFloatField;
    btnExcluirProduto: TSpeedButton;
    btnExcluirCliente: TSpeedButton;
    pnlInicio: TPanel;
    frxBarCodeObject1: TfrxBarCodeObject;
    btnCancelarPedido: TSpeedButton;
    mniSair1: TMenuItem;
    statPrincipal: TStatusBar;
    lblTeste: TLabel;
    qryToatalItens: TUniQuery;
    frdsTotalItens: TfrxDBDataset;
    qryToatalItensVALORTOTAL: TFloatField;
    imgInicio: TImage;
    lbl2: TLabel;
    mniSobre1: TMenuItem;
    mniSistema1: TMenuItem;
    txtClienteNome: TEdit;
    cbbPesquisaCliente: TDBLookupComboBox;
    procedure mniCliente1Click(Sender: TObject);
    procedure mniProduto1Click(Sender: TObject);
    procedure mniPedido1Click(Sender: TObject);
    procedure btnNovoItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbPagamentoExit(Sender: TObject);
    procedure btnSalvarProdutoClick(Sender: TObject);
    procedure txtValorProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure seQuantidadeChange(Sender: TObject);
    procedure btnSalvarItensClick(Sender: TObject);
    procedure btnPedidosClick(Sender: TObject);
    procedure btnSalvarClienteClick(Sender: TObject);
    procedure tsClienteShow(Sender: TObject);
    procedure cbbClienteExit(Sender: TObject);
    procedure tsPedidoShow(Sender: TObject);
    procedure btnSalvarPedidoClick(Sender: TObject);
    procedure sePagamentoChange(Sender: TObject);
    procedure btnAlterarClienteClick(Sender: TObject);
    procedure mniCliente2Click(Sender: TObject);
    procedure cbbPesquisaClienteExit(Sender: TObject);
    procedure cbbPesquisarProdutoExit(Sender: TObject);
    procedure mniProduto2Click(Sender: TObject);
    procedure grdItensPedidoColEnter(Sender: TObject);
    procedure btnAlterarItemPedidoClick(Sender: TObject);
    procedure btnAlterarProdutoClick(Sender: TObject);
    procedure btnAlterarItensClick(Sender: TObject);
    procedure mniPedido2Click(Sender: TObject);
    procedure btnAlterarPedidoClick(Sender: TObject);
    procedure btnExcluirItemPedidoClick(Sender: TObject);
    procedure btnPesquisarPedidoClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure btnExcluirClienteClick(Sender: TObject);
    procedure txtNumeroPedidoExit(Sender: TObject);
    procedure mniNotaPedido1Click(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure mniSair1Click(Sender: TObject);
    procedure cbbPesquisarProdutoEnter(Sender: TObject);
    procedure mniSistema1Click(Sender: TObject);
  private
    FIdItemPedido: Integer;
    FIdParcela: Integer;
    FIdProduto: Integer;
    FIdPedido: Integer;
    FIdCliente: Integer;
    procedure Conectar();
    procedure CriarIni();
    procedure LimparPedido();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
UModel, UControl, USobre;

procedure TForm1.btnAlterarClienteClick(Sender: TObject);
var
cliente: TCliente;
control: TControl;
erro: string;
begin
  cliente:= TCliente.Create;
  control:= TControl.Create;

  cliente.Nome :=  cbbPesquisaCliente.Text;
  cliente.Cpf :=  txtClienteCpf.Text;
  cliente.Email := txtClienteEmail.Text;
  cliente.Id := cbbPesquisaCliente.KeyValue;

  if not control.alterarCliente(qry1, cliente, erro) then
     MessageDlg('Aten��o!'+#13+#10+'N�o foi possivel alterar o cliente!'+
                  #13+#10+'Erro: '+erro, mtError, [mbOK], 0)
  else
   MessageDlg('cliente alterado com sucesso!', mtInformation, [mbOK], 0);

  cbbPesquisaCliente.ListFieldIndex := 0;
  txtClienteCpf.Text := EmptyStr;
  txtClienteEmail.Text := EmptyStr;
  cbbPesquisaCliente.SetFocus;

  FreeAndNil(cliente);
  FreeAndNil(control);
end;

procedure TForm1.btnAlterarItensClick(Sender: TObject);
var
item: TItemPedido;
control: TControl;
erro: string;
valor: Currency;
begin
  try
    item:= TItemPedido.Create;
    control:= TControl.Create;

    item.IdProduto :=  cbbProduto.KeyValue;
    item.IdPedido :=  StrToInt(txtNumeroPedido.Text);
    item.TotalItem := StrToCurrDef(txtTotalItem.Text,0);
    item.Quantidade := seQuantidade.Value;
    item.Id := FIdItemPedido;

    if not control.alterarItem(qry1, item, 'ALTERAR', erro) then
       MessageDlg('Aten��o!'+#13+#10+'N�o foi possivel alterar o item!'+
                    #13+#10+'Erro: '+erro, mtError, [mbOK], 0)
    else
     MessageDlg('item alterado com sucesso!', mtInformation, [mbOK], 0);

    cbbProduto.ListFieldIndex := 0;
    txtClienteCpf.Text := EmptyStr;
    txtClienteEmail.Text := EmptyStr;

    valor := control.valorTotalPedido(qry1, StrToInt(txtNumeroPedido.Text));
    txtTotalPedido.Text :=  CurrToStr(valor);
    qryGridItens.Close;
    qryGridItens.DisableControls;
    qryGridItens.ParamByName('ID').AsInteger :=  StrToIntDef(txtNumeroPedido.Text,0);
    qryGridItens.EnableControls;
    qryGridItens.Open;
    pnlTitulo.Caption := 'PEDIDO';
    pgcPrincipal.ActivePage := tsPedido;
  finally
    FreeAndNil(item);
    FreeAndNil(control);
  end;


end;

procedure TForm1.btnAlterarItemPedidoClick(Sender: TObject);
begin
  lblNumPedido.Caption := txtNumeroPedido.Text;
  cbbProduto.KeyValue := StrToIntDef(grdItensPedido.Columns.Items[2].Field.Text,0);
  seQuantidade.Value := StrToIntDef(grdItensPedido.Columns.Items[4].Field.Text,0);
  txtTotalItem.Text := grdItensPedido.Columns.Items[5].Field.Text;
  FIdItemPedido := StrToInt(grdItensPedido.Columns.Items[0].Field.Text);
  btnAlterarItens.Visible := True;
  pgcPrincipal.ActivePage := tsItemPedido;
end;

procedure TForm1.btnAlterarPedidoClick(Sender: TObject);
var
control: TControl;
pedido: TPedido;
parcela: TParcela;
begin
  pedido:= TPedido.Create;
  parcela:= TParcela.Create;
  control:= TControl.Create;


end;

procedure TForm1.btnAlterarProdutoClick(Sender: TObject);
var
produto: TProduto;
control: TControl;
erro: string;
begin
  produto:= TProduto.Create;
  control:= TControl.Create;

  produto.Descricao :=  cbbPesquisarProduto.Text;
  produto.Valor :=  StrToCurrDef(txtValorProduto.Text,0);
  produto.Quantidade := seProduto.Value;
  produto.Id := cbbPesquisarProduto.KeyValue;

  if not control.alterarProduto(qry1, produto, erro) then
     MessageDlg('Aten��o!'+#13+#10+'N�o foi possivel alterar o produto!'+
                  #13+#10+'Erro: '+erro, mtError, [mbOK], 0)
  else
   MessageDlg('produto alterado com sucesso!', mtInformation, [mbOK], 0);

  cbbPesquisarProduto.ListFieldIndex := 0;
  txtValorProduto.Text := EmptyStr;
  seProduto.Value := 0;
  cbbPesquisarProduto.SetFocus;

  FreeAndNil(produto);
  FreeAndNil(control);
end;


procedure TForm1.btnCancelarPedidoClick(Sender: TObject);
var
control: TControl;
pedido: TPedido;
erro: string;
begin
  control:= TControl.Create;
  pedido:= TPedido.Create;
  try
    pedido.Id := StrToIntDef(txtNumeroPedido.Text,0);

    if MessageDlg('Aten��o!'+#13+#10+'Voc� ir� cancelar este pedido, todos os itens sr�o perdidos. Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if not control.cancelarPedido(qry1,pedido.Id, erro) then
      begin
        MessageDlg('Aten��o!'+#13+#10+'N�o foi possivel cancelar o pedido.'+#13+#10+'Erro: '+erro, mtError, [mbOK], 0);
         Exit;
      end;
    end
    else
    ShowMessage('Pedido cancelado com sucesso!');
  finally
    LimparPedido();
    FreeAndNil(control);
    FreeAndNil(pedido);
  end;
end;

procedure TForm1.btnNovoItemClick(Sender: TObject);
begin
  pnlTitulo.Caption := 'Item';
  lblNumPedido.Caption := txtNumeroPedido.Text;
  btnAlterarItens.Visible := False;
  qryProduto.Open;
  pgcPrincipal.ActivePage := tsItemPedido;
end;

procedure TForm1.btnPedidosClick(Sender: TObject);
var
valor: Currency;
control: TControl;
begin
 try
    control:= TControl.Create;
    valor := control.valorTotalPedido(qry1, StrToInt(txtNumeroPedido.Text));
    txtTotalPedido.Text :=  CurrToStr(valor);
    qryGridItens.Close;
    qryGridItens.DisableControls;
    qryGridItens.ParamByName('ID').AsInteger :=  StrToIntDef(txtNumeroPedido.Text,0);
    qryGridItens.EnableControls;
    qryGridItens.Open;
    pgcPrincipal.ActivePage := tsPedido;
 finally
    FreeAndNil(control);
 end;
end;

procedure TForm1.btnPesquisarPedidoClick(Sender: TObject);
var
control: TControl;
pedido: TPedido;
erro, cpf, email: string;
id: Integer;
begin

  try
     control:= TControl.Create;
     pedido:= TPedido.Create;
     pedido.Id := StrToInt(txtNumeroPedido.Text);
     if control.CarregarDadosPedido(qry1, pedido, erro) then
     begin
       if pedido.Status = 'F' then
       begin
         MessageDlg('Aten��o!'+#13+#10+'O Pedido j� esta finalizado.'+#13+#10+'Ao editar ser� gerada uma nova nota.', mtInformation, [mbOK], 0);
       end;

       txtNumeroPedido.Text := FormatFloat('00000', pedido.Id);
       txtReferencia.Text := pedido.Referencia;
       txtTotalPedido.Text := CurrToStr(control.valorTotalPedido(qry1,pedido.Id));
       control.CarregaDadosClienteByNome(qry1, pedido.NomeCliente, id, cpf, email);
       cbbCliente.KeyValue := id;
       txtCpf.Text := cpf;
       txtEmail.Text := email;
       if pedido.TipoOperacao = 'E' then
         rbEntrada.Checked := True
       else rbSaida.Checked := True;
       if pedido.TipoPagamento = 'A' then
         cbbPagamento.ItemIndex := 0
       else cbbPagamento.ItemIndex := 1;
       qryGridItens.Close;
       qryGridItens.ParamByName('ID').AsInteger := pedido.Id;
       qryGridItens.Open;
       control.getQuantidadeParcela(qry1, lstPagamento, pedido.Id);
     end
     else
     begin
       MessageDlg('Aten��o!'+#13+#10+'N�o foi possivel caregar o pedido selecionado!'+#13+#10+'Erro:'+erro, mtError, [mbOK], 0);
     end;
  finally
    FreeAndNil(control);
    FreeAndNil(pedido);
  end;




end;

procedure TForm1.btnSalvarClienteClick(Sender: TObject);
var
cliente: TCliente;
control: TControl;
begin
  cliente:= TCliente.Create;
  control:= TControl.Create;

  cliente.Nome :=  txtClienteNome.Text;
  cliente.Cpf :=  txtClienteCpf.Text;
  cliente.Email := txtClienteEmail.Text;

  if control.gravarCliente(cliente, qry1) then
     ShowMessage('Cliente gravado com sucesso!');

  txtClienteNome.Text := EmptyStr;
  txtClienteCpf.Text := EmptyStr;
  txtClienteEmail.Text := EmptyStr;
  txtClienteNome.SetFocus;

  FreeAndNil(cliente);
  FreeAndNil(control);
end;

procedure TForm1.btnSalvarItensClick(Sender: TObject);
var
item: TItemPedido;
control: TControl;
begin
  if StrToIntDef(lblNumPedido.Caption,0) > 0 then
  begin
    item:= TItemPedido.Create;
    control:= TControl.Create;

    item.Quantidade := seQuantidade.Value;
    item.TotalItem := StrToCurrDef(txtTotalItem.Text, 0);
    item.IdProduto := cbbProduto.KeyValue;
    item.IdPedido  := StrToIntDef(lblNumPedido.Caption,0);

    if not control.gravarItemPedido(item,qry1) then
    begin
      MessageDlg('Aten��o!'+#13+#10+'Quantidade de produto informado excede ao de produto cadastro!'+#13+#10+'Dispon�vel:'+ IntToStr(item.Quantidade), mtWarning, [mbOK], 0);
    end
    else
     ShowMessage('Item gravado com sucesso!');

     cbbProduto.ListFieldIndex := -1;
    cbbProduto.SetFocus;
    txtTotalItem.Text := EmptyStr;
    seQuantidade.Value := 0;
    FreeAndNil(item);
    FreeAndNil(control);
  end
  else
  begin
    ShowMessage('Aten��o! O pedido n�o foi informado!');
  end;





end;

procedure TForm1.btnSalvarProdutoClick(Sender: TObject);
var
produto: TProduto;
control: TControl;
erro: string;
begin
  try
    produto := TProduto.Create;
    produto.Descricao := txtDescricaoProduto.Text;
    produto.Valor := StrToCurrDef(txtValorProduto.Text,0);
    produto.Quantidade := seProduto.Value;
    control := TControl.Create;
    if not control.gravarProduto(qry1, produto, erro) then
    begin
      MessageBox(0, PChar('Aten��o!'+#13+#10+'Prooduto n�o cadastrado.'+#13+#10+'Erro: '+erro), PChar(''), MB_ICONWARNING or MB_OK);
    end
    else ShowMessage('Produto Inserido com sucesso!');
  finally
    txtDescricaoProduto.Text := EmptyStr;
    txtValorProduto.Text := EmptyStr;
    seProduto.Value := 0;
    txtDescricaoProduto.SetFocus;

    FreeAndNil(produto);
    FreeAndNil(control);
  end;


end;

procedure TForm1.cbbClienteExit(Sender: TObject);
var
control: TControl;
cpf, email: string;
begin
  if not cbbCliente.Text.IsEmpty then
  begin
    control:= TControl.Create;
    control.CarregaDadosClienteById(qry1, cbbCliente.KeyValue, cpf, email);
    txtCpf.Text := cpf;
    txtEmail.Text := email;
    FreeAndNil(control);
  end;
end;

procedure TForm1.cbbPagamentoExit(Sender: TObject);
begin
  if cbbPagamento.ItemIndex > 0 then
  begin
   grpParcela.Visible := True;
  end
  else
  begin
    grpParcela.Visible := False;
  end;
end;

procedure TForm1.cbbPesquisaClienteExit(Sender: TObject);
var
control: TControl;
cpf, email: string;
begin
  if not cbbPesquisaCliente.Text.IsEmpty then
  begin
    control:= TControl.Create;
    control.CarregaDadosClienteById(qry1, cbbPesquisaCliente.KeyValue, cpf, email);
    txtClienteCpf.Text := cpf;
    txtClienteEmail.Text := email;
    FreeAndNil(control);
  end;
end;

procedure TForm1.cbbPesquisarProdutoEnter(Sender: TObject);
begin
  txtValorProduto.Text := '0,00';
  seProduto.Value := 0;
end;

procedure TForm1.cbbPesquisarProdutoExit(Sender: TObject);
var
control: TControl;
valor :Currency;
quantidade: Integer;
begin
  if not cbbPesquisarProduto.Text.IsEmpty then
  begin
    control:= TControl.Create;
    control.CarregaDadosProduto(qry1, cbbPesquisarProduto.KeyValue, valor, quantidade);
    txtValorProduto.Text := CurrToStr(valor);
    txtValorProduto.SetFocus;
    txtValorProduto.SelText;
    seProduto.Value := quantidade;
    FreeAndNil(control);
  end;
end;

procedure TForm1.Conectar;
var
Arquivo: TIniFile;
teste, cabecalho: string;
begin
  try
    cabecalho := 'PEDIDOS';
    arquivo := TIniFile.Create(ExtractFilePath(Application.ExeName)+'db.ini');
    if con1.Connected = False then
    begin
      teste := arquivo.ReadString(cabecalho,'PROVIDER',con1.ProviderName);
      con1.ProviderName := arquivo.ReadString(cabecalho,'PROVIDER',con1.ProviderName);
      con1.Server := arquivo.ReadString(cabecalho,'SERVER',con1.Server);
      con1.Port := StrToInt(arquivo.ReadString(cabecalho,'PORTA',IntToStr(con1.Port)));
      con1.Username := arquivo.ReadString(cabecalho,'USUARIO',con1.Username);
      con1.Password := arquivo.ReadString(cabecalho,'SENHA',con1.Password);
      con1.Database := arquivo.ReadString(cabecalho,'DATABASE',con1.Database);
      con1.SpecificOptions.Values['ClientLibrary'] := ExtractFilePath(Application.ExeName)+'\fbclient.dll';
      con1.Connect;
    end;
  except
   on E: Exception do
    begin
      ShowMessage('Erro ao conectar. Erro: '+e.Message);
    end;

  end;
end;



procedure TForm1.CriarIni;
var
arquivo: TIniFile;
cabecalho, base : string;
begin
  base := ExtractFilePath(Application.ExeName)+'PEDIDOS.GDB';
  lblTeste.Caption := base;
  cabecalho := 'PEDIDOS';
  arquivo := TIniFile.Create(ExtractFilePath(Application.ExeName)+'db.ini');
  arquivo.WriteString(UpperCase(cabecalho),'PROVIDER','InterBase');
  arquivo.WriteString(UpperCase(cabecalho),'SERVER','localhost');
  arquivo.WriteString(UpperCase(cabecalho),'PORTA','3050');
  arquivo.WriteString(UpperCase(cabecalho),'DATABASE',base);
  arquivo.WriteString(UpperCase(cabecalho),'USUARIO','SYSDBA');
  arquivo.WriteString(UpperCase(cabecalho),'SENHA','masterkey');

  FreeAndNil(arquivo);
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  CriarIni();
  Conectar();
  pnlTitulo.Caption := 'SISTEMA DE PEDIDO';
  pgcPrincipal.ActivePage:= tsInicio;
end;

procedure TForm1.grdItensPedidoColEnter(Sender: TObject);
begin
  btnAlterarItemPedido.Enabled := True;
  btnExcluirItemPedido.Enabled := True;
end;

procedure TForm1.LimparPedido;
begin
  lblNumPedido.Caption := EmptyStr;
  txtNumeroPedido.Text := EmptyStr;
  rbEntrada.Checked;
  txtReferencia.Text := EmptyStr;
  qryGridItens.Close;
  cbbPagamento.ItemIndex := 0;
  sePagamento.Value := 1;
  lstPagamento.Items.Clear;
  grpParcela.Visible := False;
  txtTotalPedido.Text := EmptyStr;
end;

procedure TForm1.mniCliente1Click(Sender: TObject);
begin
  pnlTitulo.Caption := 'CLIENTE';
  btnSalvarCliente.Visible := True;
  btnAlterarCliente.Visible := False;
  btnExcluirCliente.Visible := False;
  grpNomeCliente.SendToBack;
  txtClienteNome.BringToFront;
  pgcPrincipal.ActivePage := tsCliente;
end;

procedure TForm1.mniCliente2Click(Sender: TObject);
begin
  pnlTitulo.Caption := 'CLIENTE';
  btnSalvarCliente.Visible := False;
  btnAlterarCliente.Visible := True;
  btnExcluirCliente.Visible := True;
  qryCliente.Open;
  grpNomeCliente.BringToFront;
  txtClienteNome.SendToBack;
  pgcPrincipal.ActivePage := tsCliente;
end;

procedure TForm1.mniNotaPedido1Click(Sender: TObject);
begin
  pnlTitulo.Caption := 'NOTA PEDIDO';

end;

procedure TForm1.mniPedido1Click(Sender: TObject);
var
control: TControl;
begin
  control:= TControl.Create;
  txtNumeroPedido.Text := control.NovoPedido(spPedido);
  txtNumeroPedido.Enabled := False;
  FreeAndNil(control);
  btnPesquisarPedido.Visible := False;
  pnlTitulo.Caption := 'PEDIDO';
  pgcPrincipal.ActivePage:= tsPedido;
end;

procedure TForm1.mniPedido2Click(Sender: TObject);
begin
  pnlTitulo.Caption := 'PEDIDO';
  txtTotalPedido.Text := EmptyStr;
  txtNumeroPedido.Text := EmptyStr;
  txtNumeroPedido.Enabled := True;
  btnPesquisarPedido.Visible := True;
  btnPesquisarPedido.Visible := True;
  LimparPedido();
  pgcPrincipal.ActivePage := tsPedido;

end;

procedure TForm1.mniProduto1Click(Sender: TObject);
begin
  pnlTitulo.Caption := 'PRODUTO';
  grpProduto.SendToBack;
  txtValorProduto.Text := '0,00';
  seProduto.Value := 0;
  btnSalvarProduto.Visible := True;
  btnAlterarProduto.Visible := False;
  btnExcluirProduto.Visible := False;
  pgcPrincipal.ActivePage :=  tsProduto;
end;

procedure TForm1.mniProduto2Click(Sender: TObject);
begin
  grpProduto.Visible := True;
  grpProduto.BringToFront;
  txtValorProduto.Text := '0,00';
  seProduto.Value := 0;
  btnSalvarProduto.Visible := False;
  btnAlterarProduto.Visible := True;
  btnExcluirProduto.Visible := True;
  qryProduto.Open;
  pnlTitulo.Caption := 'PRODUTO';
  pgcPrincipal.ActivePage :=  tsProduto;
end;

procedure TForm1.mniSair1Click(Sender: TObject);
begin
  if MessageDlg('Voc� deseja realmente sair do sistema?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Application.Terminate;
end;

procedure TForm1.mniSistema1Click(Sender: TObject);
var
sobre: TfrmSobre;
begin
  sobre:= TfrmSobre.Create(nil);
  sobre.ShowModal;
  FreeAndNil(sobre);
end;

procedure TForm1.sePagamentoChange(Sender: TObject);
var
data: TDateTime;
valor: string;
I: Integer;
begin
  lstPagamento.Items.Clear;
  data := Now;
  for I := 1 to sePagamento.Value do
  begin
    data := IncMonth(I);
    valor := CurrToStr(SimpleRoundTo(StrToCurr(txtTotalPedido.Text)/sePagamento.Value));
    lstPagamento.Items.Add('Data: '+DateToStr(data)+' - Valor: '+ valor);
  end;
end;

procedure TForm1.seQuantidadeChange(Sender: TObject);
var
control: TControl;
valor: Currency;
begin
  control:= TControl.Create;
  try
  valor := control.valorItemPedido(cbbProduto.KeyValue, seQuantidade.Value, qry1);
  txtTotalItem.Text :=  CurrToStr(valor);
  finally
    FreeAndNil(control);
  end;
end;

procedure TForm1.btnSalvarPedidoClick(Sender: TObject);
var
control: TControl;
pedido: TPedido;
parcela: TParcela;
erro: string;
begin
  control:= TControl.Create;
  pedido:= TPedido.Create;
  parcela:= TParcela.Create;
  try
    pedido.Id := StrToIntDef(txtNumeroPedido.Text,0);
    pedido.NomeCliente := cbbCliente.Text;
    pedido.CpfCliente := txtcpf.Text;
    pedido.EmailCliente := txtEmail.Text;
    pedido.Referencia := txtReferencia.Text;
    pedido.DtEmissao := Now;
    if rbEntrada.Checked then
      pedido.TipoOperacao := 'E'
    else
      pedido.TipoOperacao := 'S';
    pedido.TotalPedido := StrToCurrDef(txtTotalPedido.Text,0);
    if cbbPagamento.ItemIndex = 0 then
      pedido.TipoPagamento := 'A'
    else
     pedido.TipoPagamento := 'P';

    if dsGridItens.DataSet.RecordCount = 0 then
     pedido.Status := 'A'
    else pedido.Status := 'F';

    if not control.gravarPedido(qry1,pedido, erro) then
    begin
      MessageDlg('Aten��o!'+#13+#10+'N�o foi possivel finalizar o pedido.'+#13+#10+'Erro: '+erro, mtError, [mbOK], 0);
       Exit;
    end;

    parcela.IdPedido := pedido.Id;
    parcela.Quantodade := sePagamento.Value;
    parcela.DtVencimento := Now;
    parcela.Valor := pedido.TotalPedido/sePagamento.Value;
    control.gravarParcelas(qry1,parcela);

    if MessageDlg('Aten��o!'+#13+#10+'Gostaria de gerar nota para esse pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
     if not  control.gerarNota(qry1, pedido.Id, erro) then
     begin
       MessageDlg('Aten��o!'+#13+#10+'N�o foi possivel gerar a nota.'+#13+#10+'Erro: '+erro, mtError, [mbOK], 0);
       Exit;
     end
     else
     begin
       qryNota.Close;
       qryNota.ParamByName('ID').AsInteger := pedido.Id;
       qryNota.Open;
       qryNota.Execute;
       qryItensNotas.Close;
       qryItensNotas.ParamByName('ID').AsInteger := pedido.Id;
       qryItensNotas.Open;
       qryItensNotas.Execute;
       qryToatalItens.Close;
       qryToatalItens.ParamByName('ID').AsInteger := pedido.Id;
       qryToatalItens.Open;
       qryToatalItens.Execute;
       frxNota.PrepareReport();
       frxNota.ShowReport();
     end;
    end
    else
     ShowMessage('Pedido finalizado com sucesso!');
  finally
    LimparPedido();
    FreeAndNil(control);
    FreeAndNil(pedido);
    FreeAndNil(parcela);
  end;
end;

procedure TForm1.tsClienteShow(Sender: TObject);
begin
  txtClienteNome.SetFocus;
end;

procedure TForm1.tsPedidoShow(Sender: TObject);
begin
  qryCliente.Close;
  qryCliente.Open;
end;

procedure TForm1.txtNumeroPedidoExit(Sender: TObject);
begin
  btnPesquisarPedido.Click;
end;

procedure TForm1.txtValorProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',']) then key :=#0;
end;

procedure TForm1.btnExcluirClienteClick(Sender: TObject);
var
cliente: TCliente;
control: TControl;
erro: string;
begin
  cliente:= TCliente.Create;
  control:= TControl.Create;

  cliente.Nome :=  cbbPesquisaCliente.Text;
  cliente.Cpf :=  txtClienteCpf.Text;
  cliente.Email := txtClienteEmail.Text;
  cliente.Id := cbbPesquisaCliente.KeyValue;

  if MessageDlg('Aten��o!'+#13+#10+'Esse procedimento ir� excluir o cliente '+cliente.Nome+
    #13+#10+'Voc� deseja continuar?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    if not control.alterarCliente(qry1, cliente, erro) then
       MessageDlg('Aten��o!'+#13+#10+'N�o foi possivel alterar o cliente!'+
                    #13+#10+'Erro: '+erro, mtError, [mbOK], 0)
    else
     MessageDlg('cliente alterado com sucesso!', mtInformation, [mbOK], 0);
  end;
  cbbPesquisaCliente.ListFieldIndex := 0;
  txtClienteCpf.Text := EmptyStr;
  txtClienteEmail.Text := EmptyStr;
  cbbPesquisaCliente.SetFocus;

  FreeAndNil(cliente);
  FreeAndNil(control);
end;

procedure TForm1.btnExcluirItemPedidoClick(Sender: TObject);
var
control: Tcontrol;
item: TItemPedido;
valor: Currency;
erro: string;
begin
  control := Tcontrol.Create;
  item := TItemPedido.Create;

  try
    if MessageDlg('Aten��o!'+#13+#10+'Esse procedimento ir� excluir o item '+grdItensPedido.Columns.Items[3].Field.Text+
    #13+#10+'Voc� deseja continuar?', mtWarning, [mbYes, mbNo], 0) = mrYes then
     begin
       item.Id := StrToInt(grdItensPedido.Columns.Items[0].Field.Text);
        if not control.alterarItem(qry1, item, 'EXCLUIR', erro) then
           MessageDlg('Aten��o!'+#13+#10+'N�o foi possivel excluir o item!'+
                        #13+#10+'Erro: '+erro, mtError, [mbOK], 0)
        else
         MessageDlg('item excluido com sucesso!', mtInformation, [mbOK], 0);

       valor := control.valorTotalPedido(qry1, StrToInt(txtNumeroPedido.Text));
       txtTotalPedido.Text :=  CurrToStr(valor);
       qryGridItens.Close;
       qryGridItens.DisableControls;
       qryGridItens.ParamByName('ID').AsInteger :=  StrToIntDef(txtNumeroPedido.Text,0);
       qryGridItens.EnableControls;
       qryGridItens.Open;
       pnlTitulo.Caption := 'PEDIDO';
     end;
  finally
    FreeAndNil(control);
    FreeAndNil(item);
  end;


end;

procedure TForm1.btnExcluirProdutoClick(Sender: TObject);
var
produto: TProduto;
control: TControl;
erro: string;
begin
  produto:= TProduto.Create;
  control:= TControl.Create;

  produto.Descricao :=  cbbPesquisarProduto.Text;
  produto.Valor :=  StrToCurrDef(txtValorProduto.Text,0);
  produto.Quantidade := seProduto.Value;
  produto.Id := cbbPesquisarProduto.KeyValue;

   if MessageDlg('Aten��o!'+#13+#10+'Voc� ir� excluir permanentemente o produto'+produto.Descricao
    +#13+#10+'Deseja continuar?', mtWarning, [mbYes, mbNo], 0) = mrYes then
   begin
    if not control.excluirProduto(qry1, produto, erro) then
       MessageDlg('Aten��o!'+#13+#10+'N�o foi possivel excluir o produto!'+
                    #13+#10+'Erro: '+erro, mtError, [mbOK], 0)
    else
     MessageDlg('produto excluido com sucesso!', mtInformation, [mbOK], 0);
   end;
  cbbPesquisarProduto.ListFieldIndex := 0;
  txtValorProduto.Text := EmptyStr;
  seProduto.Value := 0;
  cbbPesquisarProduto.SetFocus;

  FreeAndNil(produto);
  FreeAndNil(control);
end;

end.
