unit WKVenda.entity.Pedido;

interface

type

  TPedido = class
  private
    FId: Integer;
    FDataEmissao: TDateTime;
    FIdCliente: Integer;
    FValorTotal: Double;

  public
    property Id : Integer read FId write FId;
    property DataEmissao : TDateTime read FDataEmissao write FDataEmissao;
    property IdCliente : Integer read FIdCliente write FIdCliente;
    property ValorTotal : Double read FValorTotal write FValorTotal;
  end;

implementation

end.
