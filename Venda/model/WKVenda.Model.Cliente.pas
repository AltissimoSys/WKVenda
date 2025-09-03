unit WKVenda.Model.Cliente;

interface

uses
  System.SysUtils, System.Classes, WKVenda.entity.Cliente, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UDMConnection,
  Datasnap.DBClient, WKVenda.Utils;

type
  TModelCliente = class(TDataModule)
    cdsClientes: TFDMemTable;

  strict private
    procedure setObject(AFields: TFields); overload;
    procedure criarCDS;

  private
    FCliente: TCliente;

    constructor Create(AValue: TComponent); reintroduce;
    procedure ClearObject;
  public
    class function New: TModelCliente;
    function setObject(const AId: Integer): TModelCliente; overload;

    function Id: Integer; overload;
    function Id(AValue: Integer): TModelCliente; overload;

    function Nome: String; overload;
    function Nome(AValue: String): TModelCliente; overload;

    function Cidade: String; overload;
    function Cidade(AValue: String): TModelCliente; overload;

    function UF: String; overload;
    function UF(AValue: String): TModelCliente; overload;

    class function getSQL: String;

    function DataSource(AValue: TDataSource): TModelCliente;

    function Listar(const AFiltro : String) : TModelCliente;
  end;

var
  ModelCliente: TModelCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TModelCliente }

function TModelCliente.Cidade: String;
begin
  Result := FCliente.Cidade;
end;

function TModelCliente.Cidade(AValue: String): TModelCliente;
begin
  Result := Self;
  FCliente.Cidade := AValue;
end;

procedure TModelCliente.ClearObject;
begin
  FCliente.Id := 0;
  FCliente.Nome := EmptyStr;
  FCliente.Cidade := EmptyStr;
  FCliente.UF := EmptyStr;
end;

constructor TModelCliente.Create(AValue: TComponent);
begin
  inherited Create(AValue);
  FCliente := TCliente.Create;
  ClearObject;
  criarCDS;
end;

procedure TModelCliente.criarCDS;
begin
  var str : TStringBuilder;
  str := TStringBuilder.Create;
  str.Clear;

  str.Append(getSQL);
  str.AppendLine('AND 1=0');

  WKVenda.Utils.CriarCDS(cdsClientes, str.ToString);
end;

function TModelCliente.DataSource(AValue: TDataSource): TModelCliente;
begin
  Result := Self;
  AValue.DataSet := cdsClientes;
end;

class function TModelCliente.getSQL: String;
var
  strSQL: TStringBuilder;
begin
  Try
    strSQL := TStringBuilder.Create;

    with strSQL do
    Begin
      AppendLine('select * from Cliente');
      AppendLine(' WHERE 1=1');
    End;

    Result := strSQL.toString;
  Finally
    FreeAndNil(strSQL);
  End;
end;

function TModelCliente.Id: Integer;
begin
  Result := FCliente.Id;
end;

function TModelCliente.Id(AValue: Integer): TModelCliente;
begin
  Result := Self;
  FCliente.Id := AValue;
end;

function TModelCliente.Listar(const AFiltro: String): TModelCliente;
begin
  Result := Self;

  var strSQL : TStringBuilder;
  Try
    strSQL := TStringBuilder.Create;
    strSQL.Append(getSQL);
    strSQL.AppendLine(AFiltro);

    fillCDS(cdsClientes, strSQL.ToString);
  Finally
    FreeAndNil(strSQL);
  End;
end;

class function TModelCliente.New: TModelCliente;
begin
  Result := Self.Create(Nil);
end;

function TModelCliente.Nome(AValue: String): TModelCliente;
begin
  Result := Self;
  FCliente.Nome := AValue;
end;

procedure TModelCliente.setObject(AFields: TFields);
begin
  FCliente.Id := AFields.FieldByName('Id').AsInteger;
  FCliente.Nome := AFields.FieldByName('Nome').AsString;
  FCliente.Cidade := AFields.FieldByName('Cidade').AsString;
  FCliente.UF := AFields.FieldByName('UF').AsString;
end;

function TModelCliente.Nome: String;
begin
  Result := FCliente.Nome;
end;

function TModelCliente.setObject(const AId: Integer): TModelCliente;
begin
  var
    qry: TFDQuery;
  Try
    qry.Connection := DMConnection.FDCon;
    qry.SQL.Text := getSQL;
    qry.SQL.Add(Format('AND Id = %d', [AId]));

    if not qry.isEmpty then
      setObject(qry.Fields)

  Finally
    FreeAndNil(qry);
  End;
end;

function TModelCliente.UF(AValue: String): TModelCliente;
begin
  Result := Self;
  FCliente.UF := AValue;
end;

function TModelCliente.UF: String;
begin
  Result := FCliente.UF;
end;

end.
