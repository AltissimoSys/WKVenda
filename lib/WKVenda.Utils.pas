unit WKVenda.Utils;

interface

uses DB, DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UDMConnection,
SysUtils;


procedure CriarCDS( ACDS : TFDMemTable; ASQL : String); overload;
procedure CriarCDS( ACDS : TFDMemTable; AFields : TFields); overload;

procedure fillCDS(var ACDS : TFDMemTable; const ASQL : String);

procedure fillQuery(AQry : TFDQuery; const ASQL : String);

implementation


procedure CriarCDS(ACDS : TFDMemTable; ASQL : String);
Begin
  var qry : TFDQuery;
  Try
    qry := TFDQuery.Create(Nil);
    qry.Connection := DMConnection.FDCon;
    qry.SQL.Text := ASQL;
    qry.Open;

    ACDS.Close;
    ACDS.FieldDefs.Clear;

    var i : Integer;
    for i := 0 to qry.FieldCount-1 do
    Begin
      ACDS.FieldDefs.Add(qry.Fields[i].FieldName, qry.Fields[i].DataType, qry.Fields[i].Size);
    End;

    ACDS.CreateDataSet;
  Finally
    FreeAndNil(qry);
  End;
End;

procedure CriarCDS(ACDS : TFDMemTable; AFields : TFields); overload;
Begin
  ACDS.Close;
  ACDS.FieldDefs.Clear;

  var i : Integer;
  for i := 0 to AFields.Count -1 do
  Begin
    ACDS.FieldDefs.Add(AFields.Fields[i].FieldName, AFields.Fields[i].DataType, AFields.Fields[i].Size);
  End;

  ACDS.CreateDataSet;
End;

procedure fillCDS(var ACDS : TFDMemTable; const ASQL : String);
Begin
  var qry : TFDQuery;

  Try
    ACDS.DisableControls;
    qry := TFDQuery.Create(nil);
    qry.Connection := DMConnection.FDCon;
    fillQuery(qry, ASQL);
    CriarCDS(ACDS, qry.Fields);

    qry.First;
    while not qry.Eof do
    Begin
      ACDS.Append;
      var i : Integer;
      for i := 0 to qry.FieldCount-1 do
      Begin
        ACDS.Fields[i].Value := qry.Fields[i].Value;
      End;
      ACDS.Post;

      qry.Next;
    End;
    ACDS.First;

  Finally
    ACDS.EnableControls;
    FreeAndNil(qry);
  End;
End;

procedure fillQuery(AQry : TFDQuery; const ASQL : String);
Begin
  Try
    AQry.Close;
    AQry.DisableControls;
    AQry.SQL.Text := ASQL;
    AQry.Open;
  Finally
    AQry.EnableControls;
  End;
End;

end.
