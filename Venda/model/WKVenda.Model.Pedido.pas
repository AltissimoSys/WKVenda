unit WKVenda.Model.Pedido;

interface

uses
  System.SysUtils, System.Classes, WKVenda.entity.Pedido, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, WKVenda.Utils, UDMConnection,
  WKVenda.Model.Controller.PedidoItemLista, WKVenda.Controller.PedidoItem,
  Variants;

type
  fnAfterScrollPed = procedure(AIdPedido : Integer) of object;

  TModelPedido = class(TDataModule)
    cdsPedidos: TFDMemTable;
    procedure pCdsPedidosAfterScroll(DataSet: TDataSet);
    procedure pCDSPedidosAfterPost(DataSet: TDataSet);
    procedure pCdsPedidosItemAfterPost(DataSet: TDataSet);
  strict private
    FPedidoItemController : TPedidoItemController;
    FIsLoaded : Boolean;

    procedure setObject(AFields: TFields); overload;
    procedure criarCDS;
    procedure criarCDSItens;
  private
    FPedido : TPedido;
    FDataSource : TDataSource;
    FDataSourceItem : TDataSource;
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

    function Item : TPedidoItemController;

    class function getSQL: String;

    function DataSource(AValue: TDataSource; AItem : TDataSource): TModelPedido;

    function Listar(const AFiltro : String) : TModelPedido; overload;
    function Listar(const AIdCliente : Integer) : TModelPedido; overload;

    class function getSQLInsUpd : String;
    function RecordObject : TModelPedido;

    function IsLoaded : Boolean;

  end;

var
  ModelPedido: TModelPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TModelPedido }

procedure TModelPedido.pCdsPedidosAfterScroll(DataSet: TDataSet);
begin
  {var dts := TModelPedidoItemLista.getAll(cdsPedidos.FieldByName('Id').AsInteger);

  if(cdsPedidosItem.Active)then
    cdsPedidosItem.EmptyDataSet;

  dts.First;
  while not dts.Eof do
  Begin
    cdsPedidosItem.Append;
    var i : word;
    for i := 0 to dts.FieldCount-1 do
    Begin
      cdsPedidosItem.FieldByName(dts.Fields[i].FieldName).Value := dts.Fields[i].Value;
    End;
    cdsPedidosItem.Post;

    dts.Next;
  End;
  }
end;

procedure TModelPedido.pCDSPedidosAfterPost(DataSet: TDataSet);
begin
  {var dts := TModelPedidoItemLista.getAll(cdsPedidos.FieldByName('Id').AsInteger);


  cdsPedidosItem.EmptyDataSet;
  dts.First;
  while not dts.Eof do
  Begin
    cdsPedidosItem.Append;
    var i : word;
    for i := 0 to dts.FieldCount-1 do
    Begin
      cdsPedidosItem.FieldByName(dts.Fields[i].FieldName).Value := dts.Fields[i].Value;
    End;
    cdsPedidosItem.Post;

    dts.Next;
  End;
  }

  {TFloatField(DataSet.FieldByName('ValorTotal')).DisplayFormat := '####,##0.00'; }

  FPedidoItemController.Listar(DataSet.FieldByName('Id').AsInteger);
end;

procedure TModelPedido.pCdsPedidosItemAfterPost(DataSet: TDataSet);
begin
  TFloatField(DataSet.FieldByName('Quantidade')).DisplayFormat    := '####,##0.00';
  TFloatField(DataSet.FieldByName('ValorUnitario')).DisplayFormat := '####,##0.00';
  TFloatField(DataSet.FieldByName('ValorTotal')).DisplayFormat    := '####,##0.00';
end;

function TModelPedido.Item: TPedidoItemController;
begin
  Result := FPedidoItemController;
end;

function TModelPedido.RecordObject: TModelPedido;
begin
  var qry := TFDQuery.Create(Nil);
  Try
    qry.SQL.Text := getSQLInsUpd;
    qry.Connection := DMConnection.FDCon;

    qry.ParamByName('Id').Value := FPedido.Id;
    qry.ParamByName('DataEmissao').AsDateTime := FPedido.DataEmissao;
    qry.ParamByName('IdCliente'  ).AsInteger  := FPedido.IdCliente;
    qry.ParamByName('ValorTotal' ).AsFloat    := FPedido.ValorTotal;

    Try
      qry.Open;
    Except on E:Exception do
      Begin
        raise Exception.Create('Erro ao gravar pedido: ' + e.Message);
      End;
    End;

    var id := qry.Fields[0].Value;

    setObject(id);

  Finally
    FreeAndNil(qry);
  End;
end;

procedure TModelPedido.ClearObject;
begin
  FIsLoaded := False;
  FPedido.Id          := 0;
  FPedido.DataEmissao := 0;
  FPedido.IdCliente   := 0;
  FPedido.ValorTotal  := 0;
end;

constructor TModelPedido.Create(AValue: TComponent);
begin
  inherited Create(AValue);
  FPedidoItemController := TPedidoItemController.new(0);
  FPedido := TPedido.Create;
  ClearObject;
  criarCDS;
end;

procedure TModelPedido.criarCDS;
begin
  var str : TStringBuilder;
  Try
    str := TStringBuilder.Create;
    str.Clear;

    str.Append(getSQL);
    str.AppendLine('AND 1=0');

    cdsPedidos := WKVenda.Utils.CriarDataset(str.ToString);

    cdsPedidos.AfterScroll := pCdsPedidosAfterScroll;
    cdsPedidos.AfterPost   := pCDSPedidosAfterPost;

    criarCDSItens;
  Finally
    FreeAndNil(str);
  End;
end;

procedure TModelPedido.criarCDSItens;
begin
  var str : TStringBuilder;
  Try
    str := TStringBuilder.Create;
    str.Clear;

    str.Append(TModelPedidoItemLista.getSQL);
    str.AppendLine('AND 1=0');

    {
    cdsPedidosItem := WKVenda.Utils.CriarDataset(str.ToString);
    cdsPedidosItem.AfterPost := pCdsPedidosItemAfterPost;
    }
  Finally
    FreeAndNil(str);
  End;
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

function TModelPedido.DataSource(AValue: TDataSource; AItem : TDataSource): TModelPedido;
begin
  Result := Self;
  AValue.DataSet := cdsPedidos;

  {if Assigned(AItem) then
    AItem.DataSet := cdsPedidosItem; }
end;

destructor TModelPedido.Destroy;
begin
  FreeAndNil(FPedidoItemController);
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

class function TModelPedido.getSQLInsUpd: String;
begin
  var str := TStringBuilder.Create;
  Try
    str.Clear;
    with str do
    Begin
      AppendLine('INSERT INTO Pedido');
      AppendLine('            (');
      AppendLine('             Id,');
      AppendLine('             DataEmissao,');
      AppendLine('             IdCliente,');
      AppendLine('             ValorTotal');
      AppendLine('            )');
      AppendLine('            VALUES');
      AppendLine('            (');
      AppendLine('             :Id,');
      AppendLine('             :DataEmissao,');
      AppendLine('             :IdCliente,');
      AppendLine('             :ValorTotal');
      AppendLine('            )');
      AppendLine('ON DUPLICATE KEY');
      AppendLine('UPDATE DataEmissao = :DataEmissao,');
      AppendLine('       IdCliente = :IdCliente,');
      AppendLine('       ValorTotal = :ValorTotal;');
      AppendLine('SELECT LAST_INSERT_ID();');
    End;
    Result := str.ToString;
  Finally
    FreeAndNil(str);
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

function TModelPedido.IsLoaded: Boolean;
begin
  Result := FIsLoaded;
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
  Result := FPedido.IdCliente;
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
  FIsLoaded := True;
end;

function TModelPedido.setObject(const AId: Integer): TModelPedido;
begin
  var
    qry: TFDQuery;
  Try
    Result := Self;

    ClearObject;

    qry := TFDQuery.Create(nil);
    qry.Connection := DMConnection.FDCon;
    qry.SQL.Text := getSQL;
    qry.SQL.Add(Format('AND ped.Id = %d', [AId]));
    qry.Open;

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
