unit WKVenda.view.template.selConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UDMConnection;

type
  TfrmTemplateConsulta = class(TForm)
    pnlPrincipal: TPanel;
    Bevel3: TBevel;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    PnlBtnConfirma: TPanel;
    btnConfirma: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    pnlGrid: TPanel;
    dbgLista: TDBGrid;
    dsGrid: TDataSource;
    TimerCharBusca: TTimer;
    edtGridBusca: TEdit;
    lblBusca: TLabel;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbgListaTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure edtGridBuscaChange(Sender: TObject);
    procedure dbgListaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TimerCharBuscaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    VKEY : word;

  protected
    FGridZebrado : Boolean;
    FSQLBase     : String;
    FColFieldSel : String;
    FOrderBy     : String;
    FDirection   : String;
    FStrBusca    : String;
    FSQLWhereMontado  : String;

    function fnSQLWhereMontado: String;
    procedure Buscar; virtual; abstract;
  public
    property SQLBase     : String read FSQLBase write FSQLBase;
    property ColFieldSel : String read FColFieldSel write FColFieldSel;
    property OrderBy     : String read FOrderBy write FOrderBy;
    property Direction   : String read FDirection write FDirection;
    property StrBusca    : String read FStrBusca;
    property SQLMontado  : String read FSQLWhereMontado;
  end;

var
  frmTemplateConsulta: TfrmTemplateConsulta;

const
  LABEL_BUSCA = 'Filtrar por %s | "%%" para TODOS:';

implementation

{$R *.dfm}

procedure TfrmTemplateConsulta.btnConfirmaClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmTemplateConsulta.dbgListaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if(Column.Field.FieldName = ColFieldSel)then
    Column.Title.Font.Style := [fsBold]
  Else
    Column.Title.Font.Style := [];

  if not(gdSelected in State) then
  begin
    if Odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
      (Sender as TDBGrid).Canvas.Brush.Color := clWhite
    else
      (Sender as TDBGrid).Canvas.Brush.Color := $00F1F2F3; // leve cinza

    // Aplicando preto para a cor da fonte
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;

    (Sender as TDBGrid).Canvas.FillRect(Rect);
    (Sender as TDBGrid).Canvas.TextOut(Rect.Left + 2, Rect.Top, Column.Field.DisplayText);
  end;

end;

procedure TfrmTemplateConsulta.dbgListaTitleClick(Column: TColumn);
begin
  if(Column.Field <> nil) then
  begin
    if(OrderBy <> Column.Field.FieldName)then
      FDirection := ''
    else
    if Direction = '' then
      FDirection := ' DESC'
    else
      FDirection := '';

    FOrderBy := Column.Field.FieldName;

    FColFieldSel := Column.Field.FieldName;
    lblBusca.Caption := Column.Title.Caption;
    lblBusca.Caption := format(LABEL_BUSCA, [Column.Title.Caption]);
    edtGridBusca.SetFocus;
  end;

end;

procedure TfrmTemplateConsulta.edtGridBuscaChange(Sender: TObject);
begin
  FStrBusca := edtGridBusca.Text;
  if(Trim(StrBusca) = EmptyStr)then
    TimerCharBusca.Enabled := False;

  if((Length(Trim(StrBusca)) = 1) or ((VKey = VK_BACK) AND (StrBusca = EmptyStr)))then
    TimerCharBusca.Enabled := True;

  FSQLWhereMontado := fnSQLWhereMontado;

  if(Length(Trim(StrBusca)) >= 5)then
  Begin

    TimerCharBusca.Enabled := False;
    TimerCharBusca.Enabled := True;
    FStrBusca := EmptyStr;
    buscar;
  End;
end;

function TfrmTemplateConsulta.fnSQLWhereMontado: String;
const
  WHERE_ = 'AND %s LIKE %s';

begin
  Try
    Result := Format(WHERE_,[ColFieldSel, QuotedStr(edtGridBusca.Text + '%') ]);
  Finally
    //
  End;
end;

procedure TfrmTemplateConsulta.FormCreate(Sender: TObject);
begin
  TimerCharBusca.Enabled := False;
end;

procedure TfrmTemplateConsulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  VKEY := Key;

  if(Key = VK_F4) AND (ssAlt in Shift)then
    Key := 0;

end;

procedure TfrmTemplateConsulta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(VKEY = 13)then
    Perform(WM_NEXTDLGCTL, 0, 0);

end;

procedure TfrmTemplateConsulta.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  VKEY := 0;
end;

procedure TfrmTemplateConsulta.FormShow(Sender: TObject);
begin
  if(edtGridBusca.CanFocus)then
    edtGridBusca.SetFocus;
end;

procedure TfrmTemplateConsulta.SpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTemplateConsulta.TimerCharBuscaTimer(Sender: TObject);
begin
  Buscar;
end;

end.
