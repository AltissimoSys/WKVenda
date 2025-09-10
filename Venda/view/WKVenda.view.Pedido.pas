unit WKVenda.view.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WKVenda.view.template.selConsulta,
  Data.DB, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, System.ImageList, Vcl.ImgList, Vcl.Mask, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  UDMConnection, WKVenda.Controller.Cliente, WKVenda.Controller.Pedido,
  WKVenda.view.selConsultaPedido, UITypes;

type
  TfrmPedido = class(TfrmTemplateConsulta)
    pnlDadosFundo: TPanel;
    pnlDados: TPanel;
    pnlBottomGrid: TPanel;
    pcCabPedido: TPageControl;
    tbsPedido: TTabSheet;
    pnlDadosTop: TPanel;
    Panel2: TPanel;
    edtIdCliente: TEdit;
    Label2: TLabel;
    pnlBtnSelCliente: TPanel;
    btnSelCliente: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    pnlPedidoCab: TPanel;
    Label5: TLabel;
    pnlEdtIdPedido: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    pnlBtnPedido: TPanel;
    btnPedido: TSpeedButton;
    edtNomeCliente: TDBEdit;
    edtCidade: TDBEdit;
    EdtUF: TDBEdit;
    edtIdPedido: TDBEdit;
    edtDataEmissao: TDBEdit;
    edtValorTotal: TDBEdit;
    dsCliente: TDataSource;
    dsPedido: TDataSource;
    FDQuery1: TFDQuery;
    pnlBtnIncItem: TPanel;
    btnIncItem: TSpeedButton;
    pnlTopItem: TPanel;
    Bevel1: TBevel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    Panel5: TPanel;
    Edit1: TEdit;
    Panel6: TPanel;
    btnSelProduto: TSpeedButton;
    edtDescricaoProd: TDBEdit;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    pnlBtnCancelarEditItem: TPanel;
    btnCancelarEditItem: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure edtIdClienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
    procedure btnSelProdutoClick(Sender: TObject);
    procedure btnIncItemClick(Sender: TObject);
  private
    FClienteController : TClienteController;
    FPedidoController  : TPedidoController;
    procedure criarClienteController;
    procedure criarPedidoController;

  public

  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

{ TfrmPedido }

procedure TfrmPedido.btnIncItemClick(Sender: TObject);
begin
  inherited;
  pnlTopItem.Enabled := True;
end;

procedure TfrmPedido.btnPedidoClick(Sender: TObject);
const
  SQL_ = 'AND ped.Id = %s';
var
  lcId : Integer;

begin
  inherited;
  Try
    frmConsultaPedido := TfrmConsultaPedido.create(Self);
    if(frmConsultaPedido.ShowModal = mrOk)then
    Begin
      lcId := frmConsultaPedido.dsGrid.DataSet.FieldByName('Id').AsInteger;
      FPedidoController
          .DataSource(dsPedido, dsGrid).setObject(lcId)
          .Listar(Format(SQL_, [lcId.ToString]));

      edtIdCliente.Text := FPedidoController.IdCliente.ToString;
      edtIdClienteExit(Sender);
    End;
  Finally
    FreeAndNil(frmConsultaPedido);
  End;
end;

procedure TfrmPedido.btnSelProdutoClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPedido.criarClienteController;
begin
  if not Assigned(FClienteController) then
    FClienteController := TClienteController.New;
end;

procedure TfrmPedido.criarPedidoController;
begin
  if not Assigned(FPedidoController) then
    FPedidoController := TPedidoController.New.DataSource(dsPedido, dsGrid) ;
end;

procedure TfrmPedido.edtIdClienteExit(Sender: TObject);
begin
  inherited;

  if(Trim(edtIdCliente.Text) = EmptyStr)then
    Exit;

  FClienteController
      .setObject(StrToIntDef(edtIdCliente.Text,0))
      .DataSource(dsCliente)
      .Listar(Format('AND Id = %d',[ StrToIntDef(edtIdCliente.Text, 0)]));

  if not FClienteController.IsLoaded then
  Begin
    MessageDlg('Cliente não encontrado!', mtWarning, [mbOk], 0);
    edtIdCliente.Text := EmptyStr;
    edtIdCliente.SetFocus;
    Exit;
  End;

  pnlBtnPedido.Visible := True;
  btnIncItem.Enabled := True;
end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  inherited;
  criarClienteController;
  criarPedidoController;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  inherited;
  if(edtIdCliente.CanFocus)then
    edtIdCliente.SetFocus;
end;

end.
