unit WKVenda.Model.Produto;

interface

uses
  System.SysUtils, System.Classes, WKVenda.entity.Produto, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  WKVenda.Utils;

type
  TModelProduto = class(TDataModule)
    cdsProdutos_old: TClientDataSet;
    cdsProdutos: TFDMemTable;

  strict private
    FIsLoaded : Boolean;
    procedure setObject(AFields: TFields); overload;
    procedure criarCDS;

  private
    FProduto: TProduto;
    constructor Create(AValue: TComponent); reintroduce;
    procedure ClearObject;

  public
    destructor Destroy; override;
    class function New : TModelProduto;

    function setObject(const AId: Integer): TModelProduto; overload;

    function Id: Integer; overload;
    function Id(AValue: Integer): TModelProduto; overload;

    function Descricao: String; overload;
    function Descricao(AValue: String): TModelProduto; overload;

    function PrecoVenda : Double; overload;
    function PrecoVenda(AValue : Double) : TModelProduto; overload;

    class function getSQL: String;

    function DataSource(AValue: TDataSource): TModelProduto;
    function Listar(const AFiltro : String) : TModelProduto;

    function IsLoaded : Boolean;

  end;

var
  ModelProduto: TModelProduto;

implementation

uses UDMConnection;

{$R *.dfm}
{ TModelProduto }

procedure TModelProduto.ClearObject;
begin
  FProduto.Id := 0;
  FProduto.Descricao := EmptyStr;
  FProduto.PrecoVenda := 0;
  FIsLoaded := False;
end;

constructor TModelProduto.Create(AValue: TComponent);
begin
  inherited Create(AValue);
  FProduto := TProduto.Create;
  ClearObject;
  criarCDS;
end;

procedure TModelProduto.criarCDS;
begin
  var str : TStringBuilder;
  str := TStringBuilder.Create;
  str.Clear;

  str.Append(getSQL);
  str.AppendLine('AND 1=0');

  cdsProdutos := WKVenda.Utils.CriarDataset(str.ToString);
end;

function TModelProduto.DataSource(AValue: TDataSource): TModelProduto;
begin
  Result := Self;
  AValue.DataSet := cdsProdutos;
end;

function TModelProduto.Descricao(AValue: String): TModelProduto;
begin
  Result := Self;
  FProduto.Descricao := AValue;
end;

destructor TModelProduto.Destroy;
begin
  FreeAndNil(FProduto);
  inherited;
end;

function TModelProduto.Descricao: String;
begin
  Result := FProduto.Descricao;
end;

class function TModelProduto.getSQL: String;
var
  strSQL: TStringBuilder;
begin
  Try
    strSQL := TStringBuilder.Create;

    with strSQL do
    Begin
      AppendLine('select * from Produto');
      AppendLine(' WHERE 1=1');
    End;

    Result := strSQL.toString;
  Finally
    FreeAndNil(strSQL);
  End;
end;

function TModelProduto.Id(AValue: Integer): TModelProduto;
begin
  Result := Self;
  FProduto.Id := AValue;
end;

function TModelProduto.IsLoaded: Boolean;
begin
  Result := FIsLoaded;
end;

function TModelProduto.Listar(const AFiltro: String): TModelProduto;
begin
  Result := Self;

  var strSQL : TStringBuilder;
  Try
    strSQL := TStringBuilder.Create;
    strSQL.Append(getSQL);
    strSQL.AppendLine(AFiltro);

    fillDataset(cdsProdutos, strSQL.ToString);
  Finally
    FreeAndNil(strSQL);
  End;
end;

function TModelProduto.Id: Integer;
begin
  Result := FProduto.Id;
end;

class function TModelProduto.New: TModelProduto;
begin
  Result := Self.Create(Nil);
end;

function TModelProduto.PrecoVenda(AValue: Double): TModelProduto;
begin
  Result := Self;
  FProduto.PrecoVenda := AValue;
end;

function TModelProduto.PrecoVenda: Double;
begin
  Result := FProduto.PrecoVenda;
end;

function TModelProduto.setObject(const AId: Integer): TModelProduto;
begin
  var qry: TFDQuery;
  var str : TStringBuilder;

  Try
    Result := Self;

    str := TStringBuilder.Create;
    str.Append(getSQL);
    str.AppendLine(Format('AND Id = %d', [AId]));

    fillQuery(qry, str.ToString);

    if not qry.isEmpty then
      setObject(qry.Fields)

  Finally
    FreeAndNil(str);
    FreeAndNil(qry);
  End;

end;

procedure TModelProduto.setObject(AFields: TFields);
begin
  FProduto.Id := AFields.FieldByName('Id').AsInteger;
  FProduto.Descricao := AFields.FieldByName('Descricao').AsString;
  FProduto.PrecoVenda := AFields.FieldByName('PrecoVenda').AsFloat;
  FIsLoaded := True;
end;

end.
