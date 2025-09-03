unit UDMConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  IniFiles, Dialogs;

type
  TDMConnection = class(TDataModule)
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDCon: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FServer     : String;
    FDBName     : String;
    FUsuarioDB  : String;
    FLibPath    : String;
    FPorta      : word;
    FDBPassword   : String;

    procedure setConnection;
    procedure LerIni;
  public

  end;

var
  DMConnection: TDMConnection;

implementation

uses
  Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMConnection.DataModuleCreate(Sender: TObject);
begin
  setConnection;
end;

procedure TDMConnection.LerIni;
begin
  var WKVendaIni : TIniFile;

  var lcIniPath : String;

  lcIniPath := ExtractFilePath(Application.ExeName) + 'WKVenda.ini';

  Try
    Try
      WKVendaIni := TIniFile.Create(lcIniPath);

      if not FileExists(lcIniPath)then
      Begin
        WKVendaIni.WriteString ('GERAL', 'SERVERNAME', '');
        WKVendaIni.WriteString ('GERAL', 'DBNAME', '');
        WKVendaIni.WriteString ('GERAL', 'DBUSER', '');
        WKVendaIni.WriteInteger('GERAL', 'PORTA', 0);
        WKVendaIni.WriteString('GERAL', 'DBPASSWORD', '');
        WKVendaIni.WriteString ('LIB', 'LIBDB', '');

      End
    Except on E:Exception do
      raise Exception.Create(Format('Erro ao carregar arquivo de configuração: %s', [e.Message]));
    End;

    FServer     := WKVendaIni.ReadString('GERAL', 'SERVERNAME', '');
    FDBName     := WKVendaIni.ReadString('GERAL', 'DBNAME', '');
    FUsuarioDB  := WKVendaIni.ReadString('GERAL', 'DBUSER', '');
    FPorta      := WKVendaIni.ReadInteger('GERAL', 'PORTA', 0);
    FDBPassword := WKVendaIni.ReadString('GERAL', 'PASSWORD', '');

    FLibPath   := WKVendaIni.ReadString('LIB', 'LIBDB', '');


    if(Trim(FServer) = EmptyStr)then
      raise Exception.Create('Arquivo de configuração .INI não foi configurado ou está imcompleto. Verifique!');

  Except on E:Exception do
    Begin
      raise Exception.Create(e.Message);
    End;
  End;
end;

procedure TDMConnection.setConnection;
begin
  Try
    Try
     LerIni;
    Except on E:Exception do
      Begin
        raise Exception.Create(e.Message);
      End;
    End;

    FDCon.Connected := False;
    FDCon.Params.Values['Server'   ] := FServer;
    FDCon.Params.Values['Database' ] := FDBName;
    FDCon.Params.Values['User_Name'] := FUsuarioDB;
    FDCon.Params.Values['Password' ] := FDBPassword;
    FDCon.Params.Values['Port'     ] := FPorta.ToString;

    FDPhysMySQLDriverLink.VendorLib := FLibPath;

    Try
      FDCon.Connected := True;
    Except on E:Exception do
      Begin
        raise Exception.Create(Format('Error ao realizar conexão ao banco de dados: %s', [e.Message]));
      End;
    End;

  Except on E:Exception do
    Begin
      MessageDlg(e.Message, TMsgDlgType.mtError, [mbOk], 0);
      Application.Terminate;
    End;
  End;
end;

end.
