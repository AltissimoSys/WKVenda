unit WKVenda.view.selConsultaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WKVenda.view.template.selConsulta,
  Data.DB, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  WKVenda.Controller.Cliente, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmConsultaCliente = class(TfrmTemplateConsulta)
  protected
    procedure Buscar; override;
    procedure FormCreate(Sender: TObject);
    procedure TimerCharBuscaTimer(Sender: TObject);
    procedure edtGridBuscaChange(Sender: TObject);
  private
    FController : TClienteController;
    procedure criarController;
  public

  end;

var
  frmConsultaCliente: TfrmConsultaCliente;

implementation

{$R *.dfm}

procedure TfrmConsultaCliente.Buscar;
const
  WHERE_ = 'AND %s LIKE %s';

begin
  inherited;

  var strWHERE : TStringBuilder;
  Try
    strWHERE := TStringBuilder.Create;
    strWHERE.Clear;

    strWHERE.AppendLine(Format(WHERE_, [ColFieldSel, QuotedStr(edtGridBusca.Text + '%')]));
    strWHERE.AppendLine(Format('ORDER BY %s', [OrderBy + ' ' + Direction])) ;
    FController.Listar(strWHERE.ToString);
  Finally
    TimerCharBusca.Enabled := False;
  End;
end;

procedure TfrmConsultaCliente.criarController;
begin
  if not Assigned(FController)then
    FController := TClienteController.New.DataSource(dsGrid);
end;

procedure TfrmConsultaCliente.edtGridBuscaChange(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmConsultaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  criarController;
  ColFieldSel := 'Nome';
  lblBusca.Caption := format(LABEL_BUSCA, ['Nome']);
  OrderBy := 'Nome';
  Direction := 'ASC';
end;

procedure TfrmConsultaCliente.TimerCharBuscaTimer(Sender: TObject);
begin
  inherited;
  Buscar;
end;

end.
