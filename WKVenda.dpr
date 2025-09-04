program WKVenda;

uses
  Midas,
  Vcl.Forms,
  UITypes,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  WKVenda.view.template.selConsulta in 'lib\WKVenda.view.template.selConsulta.pas' {frmTemplateConsulta},
  WKVenda.view.selConsultaCliente in 'Venda\view\WKVenda.view.selConsultaCliente.pas' {frmConsultaCliente},
  WKVenda.view.selConsultaProduto in 'Venda\view\WKVenda.view.selConsultaProduto.pas' {frmConsultaProduto},
  UDMConnection in 'DB\UDMConnection.pas' {DMConnection: TDataModule},
  Vcl.Dialogs,
  System.SysUtils {DMConnection: TDataModule},
  WKVenda.entity.Cliente in 'Venda\entities\WKVenda.entity.Cliente.pas',
  WKVenda.Controller.Cliente in 'Venda\controller\WKVenda.Controller.Cliente.pas',
  WKVenda.Model.Cliente in 'Venda\model\WKVenda.Model.Cliente.pas' {ModelCliente: TDataModule},
  WKVenda.entity.Produto in 'Venda\entities\WKVenda.entity.Produto.pas',
  WKVenda.Model.Produto in 'Venda\model\WKVenda.Model.Produto.pas' {ModelProduto: TDataModule},
  WKVenda.Controller.Produto in 'Venda\controller\WKVenda.Controller.Produto.pas',
  WKVenda.Utils in 'lib\WKVenda.Utils.pas',
  WKVenda.entity.Pedido in 'Venda\entities\WKVenda.entity.Pedido.pas' {/WKVenda.Model.Pedido in 'Venda\model\WKVenda.Model.Pedido.pas' {ModelPedido: TDataModule},
  WKVenda.Model.Pedido in 'Venda\model\WKVenda.Model.Pedido.pas' {ModelPedido: TDataModule},
  WKVenda.Controller.Pedido in 'Venda\controller\WKVenda.Controller.Pedido.pas',
  WKVenda.entity.PedidoItem in 'Venda\entities\WKVenda.entity.PedidoItem.pas',
  WKVenda.entity.PedidoItemLista in 'Venda\entities\WKVenda.entity.PedidoItemLista.pas',
  WKVenda.Model.Controller.PedidoItemLista in 'Venda\model\WKVenda.Model.Controller.PedidoItemLista.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDMConnection, DMConnection);
  Try
    Application.CreateForm(TDMConnection, DMConnection);
  except on E:Exception do
    Begin
      MessageDlg(e.Message, mtError, [mbOk],0);
      Application.Terminate;
    End;
  End;

  Application.Run;
end.
