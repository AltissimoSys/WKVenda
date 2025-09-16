unit WKVenda.Helper;

interface
uses Vcl.StdCtrls;

type

  TEditHelper = class helper for TCustomEdit
  private

  public
    function floatValue: Double;
  end;

implementation

uses
  System.SysUtils;

{ TEditHelper }

function TEditHelper.floatValue: Double;
begin
  Result := StrToFloatDef(StringReplace(Self.Text, '.','', [rfReplaceAll]),0);
end;

end.
