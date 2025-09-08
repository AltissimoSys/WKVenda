unit WKVenda.Model.Pedido;

interface

uses
  System.SysUtils, System.Classes, WKVenda.entity.Pedido, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, WKVenda.Utils, UDMConnection,
  WKVenda.Model.Controller.PedidoItemLista;

type
  fnAfterScrollPed = procedure(AIdPedido : Integer) of object;

  TModelPedido = class(TDataModule)
    cdsPedidos: TFDMemTable;
    cdsPedidosItem: TFDMemTable;
    procedure pCdsPedidosAfterScroll(DataSet: TDataSet);
    procedure pCDSPedidosAfterPost(DataSet: TDataSet);
  strict private
    procedure setObject(AFields: TFields); overload;
    procedure criarCDS;
  private
    FPedido : TPedido;

    constructor Create(AValue: TComponent); reintroduce;
    procedure ClearObject;
  public
    destructor Destroy; override;
    class function New: TModelPedido;
    function setObject(const AId: Integer) : TModelPedido; overload;

    function Id : Integer; overload;
    function Id(AValue : Integer) : TModelPedido; overload;

    function DataEmissao : TDateTime; overload;
    function DataEmissao(AValue : TDateTime) : TModelPedido; overload;

    function IdCliente : Integer; overload;
    function IdCliente(AValue : Integer) : TModelPedido; overload;

    function ValorTotal : Double; overload;
    function ValorTotal(AValue : Double) : TModelPedido; overload;

    class function getSQL: String;

    function DataSource(AValue: TDataSource): TModelPedido;

    function Listar(const AFiltro : String) : TModelPedido; overload;
    function Listar(const AIdCliente : Integer) : TModelPedido; overload;

  end;

var
  ModelPedido: TModelPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TModelPedido }

procedure TModelPedido.pCdsPedidosAfterScroll(DataSet: TDataSet);
begin
  cdsPedidosItem := TModelPedidoItemLista.getAll(cdsPedidos.FieldByName('Id').AsInteger);
end;

procedure TModelPedido.pCDSPedidosAfterPost(DataSet: TDataSet);
begin
  cdsPedidosItem := TModelPedidoItemLista.getAll(cdsPedidos.FieldByName('Id').AsInteger);
end;

procedure TModelPedido.ClearObject;
begin
  FPedido.Id          := 0;
  FPedido.DataEmissao := 0;
  FPedido.IdCliente   := 0;
  FPedido.ValorTotal  := 0;
end;

constructor TModelPedido.Create(AValue: TComponent);
begin
  inherited Create(AValue);
  FPedido := TPedido.Create;
  ClearObject;
  criarCDS;
end;

procedure TModelPedido.criarCDS;
begin
  var str : TStringBuilder;
  str := TStringBuilder.Create;
  str.Clear;

  str.Append(getSQL);
  str.AppendLine('AND 1=0');

  cdsPedidos := WKVenda.Utils.CriarDataset(str.ToString);
  cdsPedidos.AfterScroll := pCdsPedidosAfterScroll;
  cdsPedidos.AfterPost   := pCDSPedidosAfterPost;
end;

function TModelPedido.DataEmissao(AValue: TDateTime): TModelPedido;
begin
  Result := Self;
  FPedido.DataEmissao := AValue;
end;

function TModelPedido.DataEmissao: TDateTime;
begin
  Result := FPedido.DataEmissao;
end;

function TModelPedido.DataSource(AValue: TDataSource): TModelPedido;
begin
  Result := Self;
  AValue.DataSet := cdsPedidos;
end;

destructor TModelPedido.Destroy;
begin
  FreeAndNil(FPedido);
  inherited;
end;

class function TModelPedido.getSQL: String;
var
  strSQL: TStringBuilder;
begin
  Try
    strSQL := TStringBuilder.Create;

    with strSQL do
    Begin
      AppendLine('select cli.Nome,');
      AppendLine('	     cli.Cidade,');
      AppendLine('       cli.UF,');
      AppendLine('       ped.*');
      AppendLine('FROM Pedido ped');
      AppendLine('INNER JOIN Cliente cli');
      AppendLine('	ON ped.IdCliente = cli.Id');
      AppendLine('WHERE 1=1');
    End;

    Result := strSQL.toString;
  Finally
    FreeAndNil(strSQL);
  End;
end;

function TModelPedido.Id(AValue: Integer): TModelPedido;
begin
  Result := Self;
  FPedido.Id := AValue;
end;

function TModelPedido.IdCliente(AValue: Integer): TModelPedido;
begin
  Result := Self;
  FPedido.IdCliente := AValue;
end;

function TModelPedido.Listar(const AIdCliente: Integer): TModelPedido;
const
  WHERE_CLI = 'AND IdCliente = %d';
begin
  Result := Self;
  Listar(Format(WHERE_CLI, [AIdCliente.ToString]));
end;

function TModelPedido.IdCliente: Integer;
begin
  Result := IdCliente;
end;

function TModelPedido.Id: Integer;
begin
  Result := FPedido.Id;
end;

function TModelPedido.Listar(const AFiltro: String): TModelPedido;
begin
  Result := Self;

  var strSQL : TStringBuilder;
  Try
    strSQL := TStringBuilder.Create;
    strSQL.Append(getSQL);
    strSQL.AppendLine(AFiltro);

    criarCDS;
    fillDataset(cdsPedidos, strSQL.ToString);
  Finally
    FreeAndNil(strSQL);
  End;
end;

class function TModelPedido.New: TModelPedido;
begin
  Result := Self.Create(Nil);
end;

procedure TModelPedido.setObject(AFields: TFields);
begin
  FPedido.Id          := AFields.FieldByName('Id').AsInteger;
  FPedido.DataEmissao := AFields.FieldByName('DataEmissao').AsDateTime;
  FPedido.IdCliente   := AFields.FieldByName('IdCliente').AsInteger;
  FPedido.ValorTotal  := AFields.FieldByName('ValorTotal').AsFloat;
  FPedido.Itens := TModelPedidoItemLista.getLis(FPedido.Id);
end;

function TModelPedido.setObject(const AId: Integer): TModelPedido;
begin
  var
    qry: TFDQuery;
  Try
    Result := Self;

    qry.Connection := DMConnection.FDCon;
    qry.SQL.Text := getSQL;
    qry.SQL.Add(Format('AND Id = %d', [AId]));

    if not qry.isEmpty then
      setObject(qry.Fields)

  Finally
    FreeAndNil(qry);
  End;
end;

function TModelPedido.ValorTotal(AValue: Double): TModelPedido;
begin
  Result := Self;
  FPedido.ValorTotal := AValue;
end;

function TModelPedido.ValorTotal: Double;
begin
  Result := FPedido.ValorTotal;
end;

end.
