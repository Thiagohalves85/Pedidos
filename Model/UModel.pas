unit UModel;

interface

type TProduto = class
  private
    FValor: Currency;
    FDescricao: string;
    FId: Integer;
    FQuantidade: Integer;
    procedure SetDescricao(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetValor(const Value: Currency);
    procedure SetQuantidade(const Value: Integer);
  public
  property Id: Integer read FId write SetId;
  property Descricao: string read FDescricao write SetDescricao;
  property Valor: Currency read FValor write SetValor;
  property Quantidade: Integer read FQuantidade write SetQuantidade;
end;

type TPedido = class
  private
  FNumPedido: Integer;
    FTotalPedido: Currency;
    FIdCliente: Integer;
    FReferencia: string;
    FTipoOperacao: string;
    FDtEmissao: TDateTime;
    FId: Integer;
    FTipoPagamento: string;
    FNomeCliente: string;
    FStatus: string;
    FEmailCliente: string;
    FCpfCliente: string;
    procedure SetId(const Value: Integer);
    procedure SetTipoPagamento(const Value: string);
    procedure SetNomeCliente(const Value: string);
    procedure SetStatus(const Value: string);
    procedure SetCpfCliente(const Value: string);
    procedure SetEmailCliente(const Value: string);
  public
    procedure SetDtEmissao(const Value: TDateTime);
    procedure SetIdCliente(const Value: Integer);
    procedure SetNumPedido(const Value: Integer);
    procedure SetReferencia(const Value: string);
    procedure SetTipoOperacao(const Value: string);
    procedure SetTotalPedido(const Value: Currency);
    property Id: Integer read FId write SetId;
    property Referencia: string read FReferencia write SetReferencia;
    property NumPedido: Integer read FNumPedido write SetNumPedido;
    property DtEmissao: TDateTime read FDtEmissao write SetDtEmissao;
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    property TipoOperacao: string read FTipoOperacao write SetTipoOperacao;
    Property TotalPedido: Currency read FTotalPedido write SetTotalPedido;
    property TipoPagamento: string read FTipoPagamento write SetTipoPagamento;
    property NomeCliente: string read FNomeCliente write SetNomeCliente;
    property CpfCliente: string read FCpfCliente write SetCpfCliente;
    property EmailCliente: string read FEmailCliente write SetEmailCliente;
    property Status: string read FStatus write SetStatus;
end;

type TItemPedido = class
  private
    FTotalItem: Currency;
    FIdProduto: Integer;
    FId: Integer;
    FIdPedido: Integer;
    FQuantidade: Integer;
    procedure SetId(const Value: Integer);
    procedure SetIdPedido(const Value: Integer);
    procedure SetIdProduto(const Value: Integer);
    procedure SetQuantidade(const Value: Integer);
    procedure SetTotalItem(const Value: Currency);
  public
  property Id: Integer read FId write SetId;
  property TotalItem: Currency read FTotalItem write SetTotalItem;
  property Quantidade: Integer read FQuantidade write SetQuantidade;
  property IdProduto: Integer read FIdProduto write SetIdProduto;
  property  IdPedido: Integer read FIdPedido write SetIdPedido;
end;

type TParcela = class
  private
        FValor: Currency;
        FId: Integer;
        FPagamento: string;
        FIdPedido: Integer;
        FDtVencimento: TDateTime;
    FQuantodade: Integer;
        procedure SetDtVencimento(const Value: TDateTime);
        procedure SetId(const Value: Integer);
        procedure SetIdPedido(const Value: Integer);
        procedure SetPagamento(const Value: string);
        procedure SetValor(const Value: Currency);
    procedure SetQuantodade(const Value: Integer);
  public
  property Id: Integer read FId write SetId;
  property IdPedido: Integer read FIdPedido write SetIdPedido;
  property Pagamento: string read FPagamento write SetPagamento;
  property DtVencimento: TDateTime read FDtVencimento write SetDtVencimento;
  property Valor: Currency read FValor write SetValor;
  property Quantodade: Integer read FQuantodade write SetQuantodade;
end;

type TCliente = class
  private
        FEmail: string;
        FCpf: string;
        FId: Integer;
        FNome: string;
        procedure SetCpf(const Value: string);
        procedure SetEmail(const Value: string);
        procedure SetId(const Value: Integer);
        procedure SetNome(const Value: string);
  public
  property Id: Integer read FId write SetId;
  property Nome: string read FNome write SetNome;
  property Cpf: string read FCpf write SetCpf;
  property Email: string read FEmail write SetEmail;
end;


implementation

{ Produto }

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProduto.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TProduto.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

{ Pedido }

procedure TPedido.SetCpfCliente(const Value: string);
begin
  FCpfCliente := Value;
end;

procedure TPedido.SetDtEmissao(const Value: TDateTime);
begin
  FDtEmissao := Value;
end;

procedure TPedido.SetEmailCliente(const Value: string);
begin
  FEmailCliente := Value;
end;

procedure TPedido.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPedido.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TPedido.SetNomeCliente(const Value: string);
begin
  FNomeCliente := Value;
end;

procedure TPedido.SetNumPedido(const Value: Integer);
begin
  FNumPedido := Value;
end;

procedure TPedido.SetReferencia(const Value: string);
begin
  FReferencia := Value;
end;

procedure TPedido.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TPedido.SetTipoOperacao(const Value: string);
begin
  FTipoOperacao := Value;
end;

procedure TPedido.SetTipoPagamento(const Value: string);
begin
  FTipoPagamento := Value;
end;

procedure TPedido.SetTotalPedido(const Value: Currency);
begin
  FTotalPedido := Value;
end;

{ ItemPedido }

procedure TItemPedido.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TItemPedido.SetIdPedido(const Value: Integer);
begin
  FIdPedido := Value;
end;

procedure TItemPedido.SetIdProduto(const Value: Integer);
begin
  FIdProduto := Value;
end;

procedure TItemPedido.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TItemPedido.SetTotalItem(const Value: Currency);
begin
  FTotalItem := Value;
end;

{ ItemPedido.Parcela }

procedure TParcela.SetDtVencimento(const Value: TDateTime);
begin
  FDtVencimento := Value;
end;

procedure TParcela.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TParcela.SetIdPedido(const Value: Integer);
begin
  FIdPedido := Value;
end;

procedure TParcela.SetPagamento(const Value: string);
begin
  FPagamento := Value;
end;

procedure TParcela.SetQuantodade(const Value: Integer);
begin
  FQuantodade := Value;
end;

procedure TParcela.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

{ ItemPedido.Cliente }

procedure TCliente.SetCpf(const Value: string);
begin
  FCpf := Value;
end;

procedure TCliente.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TCliente.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
