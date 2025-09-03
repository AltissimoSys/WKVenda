unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, WKVenda.view.selConsultaCliente, WKVenda.view.selConsultaProduto,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    MainMenu: TMainMenu;
    mmCadastro: TMenuItem;
    mmConsulta: TMenuItem;
    Cliente1: TMenuItem;
    Produto1: TMenuItem;
    pnlButtonMenu: TPanel;
    pnlBtnCliente: TPanel;
    btnCliente: TSpeedButton;
    pnlBtnProduto: TPanel;
    btnProduto: TSpeedButton;
    Bevel1: TBevel;
    pnlBtnVenda: TPanel;
    btnVenda: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure btnClienteClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnClienteClick(Sender: TObject);
begin
  Try
    frmConsultaCliente := TfrmConsultaCliente.Create(Self);
    frmConsultaCliente.ShowModal;
  Finally
    FreeAndNil(frmConsultaCliente)
  End;
end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
  Try
    frmConsultaProduto := TfrmConsultaProduto.Create(Self);
    frmConsultaProduto.ShowModal;
  Finally
    FreeAndNil(frmConsultaProduto);
  End;
end;

end.
