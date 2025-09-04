unit WKVenda.Controller.Cliente;

interface

uses WKVenda.Model.Cliente, System.SysUtils, DB;

type

  TClienteController = class
  private
    FModel : TModelCliente;
    constructor Create;
  public
    destructor Destroy; override;
    class function New : TClienteController;

    function setObject(const AId : Integer) : TClienteController;

    function Id : Integer; overload;
    function Id(AValue : Integer) : TClienteController; overload;

    function Nome : String; overload;
    function Nome(AValue : String) : TClienteController; overload;

    function Cidade : String; overload;
    function Cidade(AValue : String) : TClienteController; overload;

    function UF : String; overload;
    function UF(AValue : String) : TClienteController; overload;

    function DataSource(AValue : TDataSource) : TClienteController;
    function Listar(const AFiltro : String) : TClienteController;

  end;

implementation

{ TClienteController }

function TClienteController.Cidade: String;
begin
  Result := FModel.Cidade;
end;

function TClienteController.Cidade(AValue: String): TClienteController;
begin
  Result := Self;
  FModel.Cidade(AValue);
end;

constructor TClienteController.Create;
begin
  FModel := TModelCliente.New;
end;

function TClienteController.DataSource(AValue: TDataSource): TClienteController;
begin
  Result := Self;
  FModel.DataSource(AValue);
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

function TClienteController.Id(AValue: Integer): TClienteController;
begin
  Result := Self;
  FModel.Id(AValue);
end;

function TClienteController.Listar(const AFiltro: String): TClienteController;
begin
  Result := Self;
  FModel.Listar(AFiltro);
end;

class function TClienteController.New: TClienteController;
begin
  Result := Self.Create;
end;

function TClienteController.Nome(AValue: String): TClienteController;
begin
  Result := Self;
  FModel.Nome(AValue);
end;

function TClienteController.Nome: String;
begin
  Result := FModel.Nome;
end;

function TClienteController.Id: Integer;
begin
  Result := FModel.Id;
end;

function TClienteController.setObject(const AId : Integer): TClienteController;
begin
  Result := Self;
  FModel.setObject(AId);
end;

function TClienteController.UF(AValue: String): TClienteController;
begin
  Result := Self;
  FModel.UF(AValue);
end;

function TClienteController.UF: String;
begin
  Result := FModel.UF;
end;

end.
