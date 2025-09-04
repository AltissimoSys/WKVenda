unit WKVenda.entity.Pedido;

interface

uses WKVenda.entity.PedidoItemLista;

type

  TPedido = class
  private
    FId: Integer;
    FDataEmissao: TDateTime;
    FIdCliente: Integer;
    FValorTotal: Double;
    FItens: TListaPedidoItem;

  public
    destructor Destroy; override;
    property Id : Integer read FId write FId;
    property DataEmissao : TDateTime read FDataEmissao write FDataEmissao;
    property IdCliente : Integer read FIdCliente write FIdCliente;
    property ValorTotal : Double read FValorTotal write FValorTotal;
    property Itens : TListaPedidoItem read FItens write FItens;

    constructor create;
  end;

implementation

uses
  System.SysUtils;

{ TPedido }

constructor TPedido.create;
begin
  FItens := TListaPedidoItem.Create;
end;

destructor TPedido.Destroy;
begin
  FreeAndNil(FItens);
  inherited;
end;

end.
