unit WKVenda.entity.PedidoItem;

interface

type

  TPedidoItem = class
    private
    FId: Integer;
    FIdPedido: Integer;
    FIdProduto: Integer;
    FQuantidade: Double;
    FValorUnitario: Double;
    FValorTotal: Double;

    public
      property Id : Integer read FId write FId;
      property IdPedido : Integer read FIdPedido write FIdPedido;
      property IdProduto : Integer read FIdProduto write FIdProduto;
      property Quantidade : Double read FQuantidade write FQuantidade;
      property ValorUnitario : Double read FValorUnitario write FValorUnitario;
      property ValorTotal : Double read FValorTotal write FValorTotal;
  end;

implementation

end.
