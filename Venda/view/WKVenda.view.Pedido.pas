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
  WKVenda.view.selConsultaPedido, UITypes, WKVenda.view.selConsultaProduto,
  WKVenda.Controller.Produto;

type
  TfrmPedido = class(TfrmTemplateConsulta)
    pnlDadosFundo: TPanel;
    pnlDados: TPanel;
    pnlBottomGrid: TPanel;
    pcCabPedido: TPageControl;
    tbsPedido: TTabSheet;
    pnlDadosTop: TPanel;
    pnlEdtCliente: TPanel;
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
    pnlBtnIncItem: TPanel;
    btnIncItem: TSpeedButton;
    pnlTopItem: TPanel;
    Bevel1: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    Panel5: TPanel;
    edtIdProduto: TEdit;
    Panel6: TPanel;
    btnSelProduto: TSpeedButton;
    Label10: TLabel;
    pnlBtnCancelarEditItem: TPanel;
    btnCancelarEditItem: TSpeedButton;
    edtDescricaoProd: TEdit;
    edtQuantidade: TEdit;
    edtValorUnitario: TEdit;
    edtValorTotalItem: TEdit;
    Label8: TLabel;
    pnlBtnNovoPedido: TPanel;
    btnNovoPedido: TSpeedButton;
    pnlBtnGravarCab: TPanel;
    btnGravarCab: TSpeedButton;
    pnlBtnCancelarIncPed: TPanel;
    btnCancelarIncPed: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure edtIdClienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
    procedure btnSelProdutoClick(Sender: TObject);
    procedure btnIncItemClick(Sender: TObject);
    procedure edtIdClienteChange(Sender: TObject);
    procedure btnCancelarEditItemClick(Sender: TObject);
    procedure edtIdProdutoExit(Sender: TObject);
    procedure btnNovoPedidoClick(Sender: TObject);
    procedure btnGravarCabClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarIncPedClick(Sender: TObject);
  private
    FClienteController : TClienteController;
    FPedidoController  : TPedidoController;
    FProdutoController : TProdutoController;
    procedure criarClienteController;
    procedure criarPedidoController;
    procedure criarProdutoController;

  public

  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

{ TfrmPedido }

procedure TfrmPedido.btnCancelarEditItemClick(Sender: TObject);
begin
  inherited;
  btnIncItem.Enabled := True;
  btnCancelarEditItem.Enabled := False;
end;

procedure TfrmPedido.btnCancelarIncPedClick(Sender: TObject);
begin
  inherited;
  FPedidoController.setObject(0);
  FPedidoController.Listar('AND 1=0');

  FClienteController.setObject(0);
  FClienteController.Listar('AND 1=0');

  btnCancelarIncPed.Enabled := False;
  btnNovoPedido.Enabled := True;
  btnGravarCab.Enabled := False;

  edtIdCliente.Clear;
  pnlEdtCliente.Enabled := False;
end;

procedure TfrmPedido.btnGravarCabClick(Sender: TObject);
const
  MSG_CONFIRMA = 'Deseja gerar um novo pedido para o cliente %s? ';
begin
  inherited;

  if(FClienteController.IsLoaded)then
  Begin
    if(MessageDlg(Format(MSG_CONFIRMA, [edtNomeCliente.Text]), TMsgDlgType.mtConfirmation, [mbyes, mbNo], 0) = mrYes)then
    Begin
//      if edtIdCliente.Text = EmptyStr then
//      Begin
//        MessageDlg('Cliente não informado!', mtInformation, [mbOK],0);
//        edtIdCliente.SetFocus;
//        Exit;
//      End;

      FPedidoController
        .Id(0).DataEmissao(now)
        .IdCliente(StrToInt(edtIdCliente.Text))
        .ValorTotal(0)
        .RecordObject;

      btnNovoPedido.Enabled := True;
      btnGravarCab.Enabled := False;
      btnCancelarIncPed.Enabled := False;
    End;
  End
  Else
  Begin
    MessageDlg('Nenhum cliente informado', mtInformation, [mbOk],0);
    if(edtIdCliente.CanFocus)then
      edtIdCliente.SetFocus;
  End;
end;

procedure TfrmPedido.btnIncItemClick(Sender: TObject);
begin
  inherited;
  pnlTopItem.Enabled := True;
  btnIncItem.Enabled := False;
  btnCancelarEditItem.Enabled := True;

  edtIdProduto.SetFocus;
  btnSelProdutoClick(Sender);
end;

procedure TfrmPedido.btnNovoPedidoClick(Sender: TObject);
begin
  inherited;
  pnlEdtCliente.Enabled := True;
  edtIdCliente.SetFocus;
  btnNovoPedido.Enabled := False;
  btnGravarCab.Enabled := True;
  btnCancelarIncPed.Enabled := True;
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
          .DataSource(dsPedido, dsGrid)
          .setObject(lcId)
          .Listar(Format(SQL_, [lcId.ToString]))
          .PedidoItemController.DataSource(dsGrid);

      edtIdCliente.Text := FPedidoController.IdCliente.ToString;
      edtIdClienteExit(Sender);
    End;
  Finally
    FreeAndNil(frmConsultaPedido);
  End;
end;

procedure TfrmPedido.btnSelProdutoClick(Sender: TObject);
begin
  Try
    frmConsultaProduto := TfrmConsultaProduto.Create(Self);
    if(frmConsultaProduto.ShowModal = mrOk)then
    Begin
      edtIdProduto.Text := frmConsultaProduto.dsGrid.DataSet.FieldByName('Id').AsString;
      edtIdProdutoExit(Sender);
    End;

  Finally
    FreeAndNil(frmConsultaProduto);
  End;
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

procedure TfrmPedido.criarProdutoController;
begin
  if not Assigned(FProdutoController) then
    FProdutoController := TProdutoController.New;
end;

procedure TfrmPedido.edtIdClienteChange(Sender: TObject);
begin
  inherited;
  pnlBtnPedido.Visible := Trim(edtIdCliente.Text) = EmptyStr;

end;

procedure TfrmPedido.edtIdClienteExit(Sender: TObject);
begin
  inherited;

  FClienteController
      .DataSource(dsCliente)
      .setObject(StrToIntDef(edtIdCliente.Text,0))
      .Listar(Format('AND Id = %d',[ StrToIntDef(edtIdCliente.Text, 0)]));

  Application.ProcessMessages;

  if not FClienteController.IsLoaded then
  Begin
    if(edtIdCliente.Focused)then
      MessageDlg('Cliente não encontrado!', mtWarning, [mbOk], 0);

    edtIdCliente.Text := EmptyStr;

    if(edtIdCliente.CanFocus)then
      edtIdCliente.SetFocus;

    Exit;
  End;

  btnGravarCab.Enabled := True;
  pnlBtnPedido.Visible := False;
  btnIncItem.Enabled := True;
end;

procedure TfrmPedido.edtIdProdutoExit(Sender: TObject);
begin
  inherited;
  if(Trim(edtIdProduto.Text) = EmptyStr)then
    Exit;

  FProdutoController
    .setObject(StrToIntDef(edtIdProduto.Text,0))
    .Listar(Format('AND Id = %d', [StrToIntDef(edtIdProduto.Text,0)]));

  if not FProdutoController.IsLoaded then
  Begin
    MessageDlg('Produto não encontrado!', mtWarning, [mbOk], 0);

    if(edtIdProduto.CanFocus)then
      edtIdProduto.SetFocus;

    Exit;
  End;

  edtDescricaoProd.Text := FProdutoController.Descricao;
  edtValorUnitario.Text := FormatFloat('####,##0.00', FProdutoController.PrecoVenda);
  edtValorTotalItem.Text := FormatFloat('####,##0.00', FProdutoController.PrecoVenda);
  edtQuantidade.Text := '1';
end;

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPedido := nil;
  Action := caFree;
end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  inherited;
  criarClienteController;
  criarPedidoController;
  criarProdutoController;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  inherited;
  if(edtIdCliente.CanFocus)then
    edtIdCliente.SetFocus;
end;

procedure TfrmPedido.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
