unit UControl;

interface
uses
System.SysUtils, Vcl.StdCtrls,
Uni, UModel;

type TControl = class
  public
   // Fun��es de Produtos
  function gravarProduto(qry: TUniQuery; produto: TProduto; out erro: string): Boolean;
  function alterarProduto(qry:TUniQuery; produto: TProduto; out erro: string):Boolean;
  function excluirProduto(qry:TUniQuery; produto: TProduto; out erro: string):Boolean;
  procedure CarregaDadosProduto(qry:TUniQuery; id:Integer; out valor: Currency; out quantidade: Integer);
   // Fun��es de Pedidos
  function NovoPedido(spPedido:TUniStoredProc): string;
  function valorTotalPedido(qry: TUniQuery; idPedido: Integer): Currency;
  function gravarPedido(qry: TUniQuery; pedido: TPedido; out erro: string): Boolean;
  function cancelarPedido(qry: TUniQuery; id:Integer; out erro: string): Boolean;
  function CarregarDadosPedido(qry:TUniQuery; pedido: TPedido; out erro: string): Boolean;
  // Fun��es de Itens
  function valorItemPedido(key, qtd:Integer; query:TUniQuery): Currency;
  function gravarItemPedido(item: TItemPedido; qry:TUniQuery): Boolean;
  function alterarItem(qry:TUniQuery; item: TItemPedido; tipo: string; out erro: string):Boolean;
  function excluirItem(qry:TUniQuery; item: TItemPedido; tipo: string; out erro: string):Boolean;
  // Fun��es de Clientes
  function gravarCliente(cliente: TCliente; qry: TUniQuery): Boolean;
  function alterarCliente(qry:TUniQuery; cliente: TCliente; out erro: string):Boolean;
  function excluirCliente(qry:TUniQuery; cliente: TCliente; out erro: string):Boolean;
  procedure CarregaDadosClienteById(qry:TUniQuery; id:Integer; out cpf: string; out email:string);
  procedure CarregaDadosClienteByNome(qry:TUniQuery; nome:string; out id: Integer;  out cpf: string; out email:string);
  // Fun��es de Parcelas
  function gravarParcelas(qry:TUniQuery; parcela: TParcela): Boolean;
  function getQuantidadeParcela(qry: TUniQuery; lst: TListBox; id:Integer):Integer;
  // Fun��es de Notas
  function gerarNota(qry: TUniQuery; id: Integer; out erro: string):Boolean;
end;

implementation

{ Control }

function TControl.alterarCliente(qry: TUniQuery; cliente: TCliente; out erro: string): Boolean;
begin
  Result := False;
  try
    qry.SQL.Text :=
    ' UPDATE CLIENTE SET '+
    '   NOME = :NOME,    '+
    '   CPF = :CPF,      '+
    '   EMAIL = :EMAIL   '+
    ' WHERE ID = :ID     ';
    qry.ParamByName('NOME').AsString := cliente.Nome;
    qry.ParamByName('CPF').AsString := cliente.Cpf;
    qry.ParamByName('EMAIL').AsString := cliente.Email;
    qry.ParamByName('ID').AsInteger := cliente.Id;
    qry.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      erro := e.Message;
    end;
  end;
end;

function TControl.alterarItem(qry: TUniQuery; item: TItemPedido;
 tipo: string; out erro: string): Boolean;
 var
 quantidade: Integer;
 condicao: string;
begin
   Result := False;

   if tipo = 'ALTERAR' then
   begin
      try

        qry.SQL.Clear;
        qry.SQL.Text := ' SELECT QUANTIDADE FROM ITEMPEDIDO WHERE ID = :ID ';
        qry.ParamByName('ID').AsInteger := item.Id;
        qry.Open;
        quantidade := 0;
        if qry.FieldByName('QUANTIDADE').AsInteger > item.Quantidade then
        begin
          quantidade := qry.FieldByName('QUANTIDADE').AsInteger - item.Quantidade;
          condicao := 'INC';
        end
        else if qry.FieldByName('QUANTIDADE').AsInteger < item.Quantidade then
        begin
          quantidade := item.Quantidade - qry.FieldByName('QUANTIDADE').AsInteger;
          condicao := 'DEC';
        end;


        qry.SQL.Text :=
        ' UPDATE ITEMPEDIDO SET          '+
        '   QUANTIDADE = :QUANTIDADE,    '+
        '   TOTALITEM = :TOTALITEM,      '+
        '   IDPRODUTO = :IDPRODUTO,      '+
        '   IDPEDIDO = :IDPEDIDO         '+
        ' WHERE ID = :ID                 ';
        qry.ParamByName('QUANTIDADE').AsInteger := item.Quantidade;
        qry.ParamByName('TOTALITEM').AsCurrency := item.TotalItem;
        qry.ParamByName('IDPRODUTO').AsInteger := item.IdProduto;
        qry.ParamByName('IDPEDIDO').AsInteger := item.IdPedido;
        qry.ParamByName('ID').AsInteger := item.Id;
        qry.ExecSQL;

        qry.SQL.Clear;
        qry.SQL.Text :=  ' EXECUTE PROCEDURE SP_ATUALIZA_QUANTIDADE_PRODUTO( :QUANTIDADE, :IDPRODUTO, :CONDICAO) ';
        qry.ParamByName('QUANTIDADE').AsInteger := quantidade;
        qry.ParamByName('IDPRODUTO').AsInteger := item.Id;
        qry.ParamByName('CONDICAO').AsString := condicao;
        qry.ExecSQL ;

        Result := True;
      except
        on E: Exception do
        begin
          erro := e.Message;
        end;
      end;


   end;
   if tipo = 'EXCLUIR' then
   begin
      try
        qry.SQL.Text :=
        ' DELETE FROM ITEMPEDIDO         '+
        ' WHERE ID = :ID                 ';
        qry.ParamByName('ID').AsInteger := item.Id;
        qry.ExecSQL;

        qry.SQL.Clear;
        qry.SQL.Text :=  ' EXECUTE PROCEDURE SP_ATUALIZA_QUANTIDADE_PRODUTO( :QUANTIDADE, :IDPRODUTO, :CONDICAO) ';
        qry.ParamByName('QUANTIDADE').AsInteger := item.Quantidade;
        qry.ParamByName('IDPRODUTO').AsInteger := item.Id;
        qry.ParamByName('CONDICAO').AsString := 'INC';
        qry.ExecSQL ;

        Result := True;
      except
        on E: Exception do
        begin
          erro := e.Message;
        end;
      end;
   end;





end;

function TControl.alterarProduto(qry: TUniQuery; produto: TProduto;
  out erro: string): Boolean;
begin
   Result := False;
  try
    qry.SQL.Text :=
    ' UPDATE PRODUTO SET           '+
    '   DESCRICAO = :DESCRICAO,    '+
    '   VALOR = :VALOR,            '+
    '   QUANTIDADE = :QUANTIDADE   '+
    ' WHERE ID = :ID               ';
    qry.ParamByName('DESCRICAO').AsString := produto.Descricao;
    qry.ParamByName('VALOR').AsCurrency := produto.Valor;
    qry.ParamByName('QUANTIDADE').AsInteger := produto.Quantidade;
    qry.ParamByName('ID').AsInteger := produto.Id;
    qry.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      erro := e.Message;
    end;
  end;
end;

function TControl.cancelarPedido(qry: TUniQuery; id:Integer;
  out erro: string): Boolean;
begin
  Result := False;
  try
    qry.SQL.Text := 'EXECUTE PROCEDURE SP_CANCELAR_PEDIDO(:IDPEDIDO)';
    qry.ParamByName('IDPEDIDO').AsInteger := id;
    qry.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      erro := e.Message;
      Result := False;
    end;
  end;
end;

procedure TControl.CarregaDadosClienteById(qry:TUniQuery; id: Integer; out cpf: string; out email: string);
begin
  qry.SQL.Text :=
  ' select CPF, EMAIL from CLIENTE where ID = '+id.ToString;
  qry.Open;
  cpf := qry.FieldByName('CPF').AsString;
  email := qry.FieldByName('EMAIL').AsString;
end;

procedure TControl.CarregaDadosClienteByNome(qry: TUniQuery; nome: string; out id: Integer; out cpf,
  email: string);
begin
   qry.SQL.Text :=
  ' select ID, CPF, EMAIL from CLIENTE where NOME = '+QuotedStr(nome);
  qry.Open;
  id := qry.FieldByName('ID').AsInteger;
  cpf := qry.FieldByName('CPF').AsString;
  email := qry.FieldByName('EMAIL').AsString;
end;

procedure TControl.CarregaDadosProduto(qry: TUniQuery; id: Integer;
  out valor: Currency; out quantidade: Integer);
begin
  qry.SQL.Text :=
  ' select VALOR, QUANTIDADE from PRODUTO where ID = '+id.ToString;
  qry.Open;
  valor := qry.FieldByName('VALOR').AsCurrency;
  quantidade := qry.FieldByName('QUANTIDADE').AsInteger;
end;

function TControl.CarregarDadosPedido(qry: TUniQuery; pedido: TPedido;
  out erro: string): Boolean;
begin
  try
    Result := False;
    qry.SQL.Text := 'SELECT * FROM PEDIDO WHERE ID = :ID';
    qry.ParamByName('ID').AsInteger := pedido.Id;
    qry.Open;
    pedido.Referencia := qry.FieldByName('REFERENCIA').AsString;
    pedido.DtEmissao := qry.FieldByName('DTEMISSAO').AsDateTime;
    pedido.TipoOperacao := qry.FieldByName('TIPOPERACAO').AsString;
    pedido.TotalPedido := qry.FieldByName('TOTALPEDIDO').AsCurrency;
    pedido.Status := qry.FieldByName('STATUS').AsString;
    pedido.TipoPagamento := qry.FieldByName('TIPOPAGAMENTO').AsString;
    pedido.NomeCliente := qry.FieldByName('NOMECLIENTE').AsString;
    Result := True;
  except
    on E: Exception do
    begin
      erro := e.Message;
      Result := False;
    end;
  end;
end;

function TControl.excluirCliente(qry: TUniQuery; cliente: TCliente;
  out erro: string): Boolean;
begin
   Result := False;
  try
    qry.SQL.Text :=
    ' DELETE FROM CLIENTE'+
    ' WHERE ID = :ID';
    qry.ParamByName('ID').AsInteger := cliente.Id;
    qry.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      erro := e.Message;
    end;
  end;
end;

function TControl.excluirItem(qry: TUniQuery; item: TItemPedido; tipo: string;
  out erro: string): Boolean;
begin
   Result := False;
  try
    qry.SQL.Text :=
    ' DELETE FROM ITEM'+
    ' WHERE ID = :ID';
    qry.ParamByName('ID').AsInteger := item.Id;
    qry.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      erro := e.Message;
    end;
  end;
end;

function TControl.excluirProduto(qry: TUniQuery; produto: TProduto;
  out erro: string): Boolean;
begin
   Result := False;
  try
    qry.SQL.Text :=
    ' DELETE FROM PRODUTO'+
    ' WHERE ID = :ID';
    qry.ParamByName('ID').AsInteger := produto.Id;
    qry.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      erro := e.Message;
    end;
  end;
end;

function TControl.gerarNota(qry: TUniQuery; id: Integer;
  out erro: string): Boolean;
begin
  Result := False;
  try
    qry.SQL.Text := 'EXECUTE PROCEDURE SP_GERAR_NOTA(:IDPEDIDO)';
    qry.ParamByName('IDPEDIDO').AsInteger := id;
    qry.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      erro := e.Message;
      Result := False;
    end;
  end;

end;

function TControl.getQuantidadeParcela(qry: TUniQuery; lst: TListBox; id:Integer): Integer;
begin
  qry.SQL.Text :=
   ' SELECT VENCIMENTO, VALOR FROM PARCELA WHERE IDPEDIDO = :ID';
  qry.ParamByName('ID').AsInteger := id;
  qry.Open;
  while not qry.Eof do
  begin
    lst.Items.Add('Data: '+qry.FieldByName('VENCIMENTO').AsString+' - Valor: '+ qry.FieldByName('VALOR').AsString);
    qry.Next;
  end;
  qry.SQL.Clear;
  qry.SQL.Text :=
  ' SELECT SUM(QUANTIDADE) as qtd FROM PARCELA WHERE IDPEDIDO = :ID';
  qry.ParamByName('ID').AsInteger := id;
  qry.Open;
  Result := qry.FieldByName('qtd').AsInteger;
end;

function TControl.gravarCliente(cliente: TCliente; qry: TUniQuery): Boolean;
begin
  Result := False;
  try
    qry.SQL.Text :=
    ' INSERT INTO CLIENTE(NOME, CPF, EMAIL) '+
    ' VALUES(:NOME, :CPF, :EMAIL) ';
    qry.ParamByName('NOME').AsString := cliente.Nome;
    qry.ParamByName('CPF').AsString := cliente.Cpf;
    qry.ParamByName('EMAIL').AsString := cliente.Email;
    qry.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TControl.gravarItemPedido(item: TItemPedido; qry: TUniQuery): Boolean;
begin
  Result := False;
  try
    qry.SQL.Text := ' SELECT QUANTIDADE FROM PRODUTO WHERE ID = '+item.IdProduto.ToString;
    qry.Open;
    if qry.FieldByName('QUANTIDADE').AsInteger < item.Quantidade then
    begin
      Result := False;
      item.Quantidade := qry.FieldByName('QUANTIDADE').AsInteger;
      Exit;
    end
    else
    begin
      qry.SQL.Clear;
      qry.SQL.Text :=  ' EXECUTE PROCEDURE SP_ATUALIZA_QUANTIDADE_PRODUTO( :QUANTIDADE, :IDPRODUTO, :CONDICAO) ';
      qry.ParamByName('QUANTIDADE').AsInteger := item.Quantidade;
      qry.ParamByName('IDPRODUTO').AsInteger := item.IdProduto;
      qry.ParamByName('CONDICAO').AsString := 'DEC';
      qry.ExecSQL
    end;
    qry.SQL.Clear;
    qry.SQL.Text :=  ' EXECUTE PROCEDURE SP_NOVO_ITEM( :QUANTIDADE, :TOTALITEM, :IDPRODUTO, :IDPEDIDO) ';
    qry.ParamByName('QUANTIDADE').AsInteger := item.Quantidade;
    qry.ParamByName('TOTALITEM').AsCurrency := item.TotalItem;
    qry.ParamByName('IDPRODUTO').AsInteger := item.IdProduto;
    qry.ParamByName('IDPEDIDO').AsInteger := item.IdPedido;
    qry.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TControl.gravarParcelas(qry: TUniQuery; parcela: TParcela): Boolean;
var
I: Integer;
data: TDateTime;
begin
   Result := False;

   try
     if parcela.Quantodade > 1 then
     begin
       for I := 1 to parcela.Quantodade do
       begin
         parcela.DtVencimento := IncMonth(I);
         qry.SQL.Text := ' EXECUTE PROCEDURE SP_NOVA_PARCELA( :IDPEDIDO, :VENCIMENTO, :QUANTIDADE, :VALOR) ';
         qry.ParamByName('IDPEDIDO').AsInteger := parcela.IdPedido;
         qry.ParamByName('VENCIMENTO').AsDateTime := parcela.DtVencimento;
         qry.ParamByName('QUANTIDADE').AsInteger := I;
         qry.ParamByName('VALOR').AsCurrency := parcela.Valor;
         qry.ExecSQL;
       end;
     end
     else
     begin
       qry.SQL.Text := ' EXECUTE PROCEDURE SP_NOVA_PARCELA( :IDPEDIDO, :VENCIMENTO, :QUANTIDADE, :VALOR) ';
       qry.ParamByName('IDPEDIDO').AsInteger := parcela.IdPedido;
       qry.ParamByName('VENCIMENTO').AsDateTime := parcela.DtVencimento;
       qry.ParamByName('QUANTIDADE').AsInteger := parcela.Quantodade;
       qry.ParamByName('VALOR').AsCurrency := parcela.Valor;
       qry.ExecSQL;
     end;
     Result := True;
   except
     Result := False;
   end;
end;

function TControl.gravarPedido(qry: TUniQuery; pedido: TPedido; out erro: string): Boolean;
begin
  Result := False;
  try
    qry.SQL.Text :=
    ' EXECUTE PROCEDURE SP_ATUALIZA_PEDIDO(:IDPEDIDO, :REFERENCIA, :DTEMISSAO, :NOMECLIENTE, :TIPOPERACAO, :TOTALPEDIDO, :STATUS, :TIPOPAGAMENTO, :CPFCLIENTE, :EMAILCLIENTE)' ;
    qry.ParamByName('IDPEDIDO').AsInteger := pedido.Id;
    qry.ParamByName('REFERENCIA').AsString := pedido.Referencia;
    qry.ParamByName('DTEMISSAO').AsDate := pedido.DtEmissao;
    qry.ParamByName('NOMECLIENTE').AsString := pedido.NomeCliente;
    qry.ParamByName('TIPOPERACAO').AsString := pedido.TipoOperacao;
    qry.ParamByName('TOTALPEDIDO').AsCurrency := pedido.TotalPedido;
    qry.ParamByName('STATUS').AsString := pedido.Status;
    qry.ParamByName('TIPOPAGAMENTO').AsString := pedido.TipoPagamento;
    qry.ParamByName('CPFCLIENTE').AsString := pedido.CpfCliente;
    qry.ParamByName('EMAILCLIENTE').AsString := pedido.EmailCliente;
    qry.ExecSQL;
    Result := True;
  except
   on E: Exception do
    begin
      erro := e.Message;
      Result := False;
    end;
  end;
end;

function TControl.gravarProduto(qry: TUniQuery; produto: TProduto; out erro: string): Boolean;
begin
  Result := False;
  try
    if produto.Valor <= 0 then
     begin
       Result := False;
       erro := 'Produto '+produto.Descricao+' esta sem valor!';
       Exit;
     end;

     if produto.Quantidade <= 0 then
     begin
       Result := False;
       erro := 'Produto '+produto.Descricao+' esta sem quantidade!';
       Exit;
     end;

    qry.SQL.Text :=
    ' SELECT DESCRICAO FROM PRODUTO '+
    ' WHERE DESCRICAO = :DESCRICAO';
    qry.ParamByName('DESCRICAO').AsString := produto.Descricao;
    qry.Open;
    if not qry.IsEmpty then
    begin
      Result := False;
      erro := 'Produto '+produto.Descricao+' j� cadastrado!';
      Exit;
    end;

    qry.SQL.Text :=
    ' INSERT INTO PRODUTO                      '+
    ' (DESCRICAO, VALOR, QUANTIDADE)           '+
    ' VALUES (:DESCRICAO, :VALOR, :QUANTIDADE) ';

    qry.ParamByName('DESCRICAO').AsString := produto.Descricao;
    qry.ParamByName('VALOR').AsCurrency := produto.Valor;
    qry.ParamByName('QUANTIDADE').AsCurrency := produto.Quantidade;
    qry.ExecSQL;
    Result := True
  except
    on E: Exception do
    begin
      erro := e.Message;
      Result := False;
    end;
  end;
end;

function TControl.NovoPedido(spPedido:TUniStoredProc): string;
begin
  spPedido.StoredProcName := 'SP_CRIAR_PEDIDO';
  spPedido.Prepare;
  spPedido.ExecProc;
  if spPedido.ParamByName('NUMEROPEDIDO').AsInteger = 0 then
    Result := FormatFloat('00000',1)
  else
    Result := FormatFloat('00000',spPedido.ParamByName('NUMEROPEDIDO').AsInteger);
end;


function TControl.valorItemPedido(key, qtd:Integer; query: TUniQuery): Currency;
begin
  query.SQL.Text :=
  ' SELECT VALOR FROM PRODUTO WHERE ID = '+IntToStr(key);
  query.Open;
  Result := (query.FieldByName('VALOR').AsCurrency)*qtd;
end;

function TControl.valorTotalPedido(qry: TUniQuery; idPedido: Integer): Currency;
begin
  Result := 0;
  try
    qry.SQL.Text :=
    ' select sum(TOTALITEM) as TOTALITEM from ITEMPEDIDO where IDPEDIDO = '+idPedido.ToString;
    qry.Open;
    Result := qry.FieldByName('TOTALITEM').AsCurrency;
  except
    Result := 0;
  end;
end;

end.
