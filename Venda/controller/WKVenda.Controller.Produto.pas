unit WKVenda.Controller.Produto;

interface

uses WKVenda.Model.Produto, DB;

type
  TProdutoController = class
  private
    FModel : TModelProduto;
    constructor create;

  public
    destructor Destroy; override;
    class function New : TProdutoController;

    function setObject(const AId : Integer) : TProdutoController;

    function Id: Integer; overload;
    function Id(AValue: Integer): TProdutoController; overload;

    function Descricao: String; overload;
    function Descricao(AValue: String): TProdutoController; overload;

    function PrecoVenda : Double; overload;
    function PrecoVenda(AValue : Double) : TProdutoController; overload;

    function DataSource(AValue : TDataSource) : TProdutoController;
    function Listar(const AFiltro : String) : TProdutoController;

  end;

implementation

uses
  System.SysUtils;

{ TProdutoController }

function TProdutoController.Descricao: String;
begin
  Result := FModel.Descricao;
end;

constructor TProdutoController.create;
begin
  FModel := TModelProduto.New;
end;

function TProdutoController.DataSource(AValue: TDataSource): TProdutoController;
begin
  Result := Self;
  FModel.DataSource(AValue);
end;

function TProdutoController.Descricao(AValue: String): TProdutoController;
begin
  Result := Self;
  FModel.Descricao(AValue);
end;

destructor TProdutoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

function TProdutoController.Id(AValue: Integer): TProdutoController;
begin
  Result := Self;
  FModel.Id(AValue);
end;

function TProdutoController.Listar(const AFiltro: String): TProdutoController;
begin
  Result := Self;
  FModel.Listar(AFiltro);
end;

class function TProdutoController.New: TProdutoController;
begin
  Result := Self.create;
end;

function TProdutoController.Id: Integer;
begin
  Result := FModel.Id;
end;

function TProdutoController.PrecoVenda: Double;
begin
  Result := FModel.PrecoVenda;
end;

function TProdutoController.PrecoVenda(AValue: Double): TProdutoController;
begin
  Result := Self;
  FModel.PrecoVenda(AValue);
end;

function TProdutoController.setObject(const AId: Integer): TProdutoController;
begin
  Result := Self;
  FModel.setObject(AId);
end;

end.
