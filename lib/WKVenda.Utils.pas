unit WKVenda.Utils;

interface

uses DB, DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UDMConnection,
SysUtils;


procedure CriarCDS(ACDS : TFDMemTable; ASQL : String); overload;
procedure CriarCDS(ACDS : TFDMemTable; AFields : TFields); overload;

procedure fillCDS(var ACDS : TFDMemTable; const ASQL : String);
procedure fillQuery(AQry : TFDQuery; const ASQL : String);

function criarDataset(AFields : TFields) : TDataSet;
function getDataSet(const ASQL : String) : TDataSet;


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

function criarDataset(AFields : TFields) : TDataSet;
Begin
  Try
    Result.Close;
    var i : Integer;
    for i := 0 to AFields.Count-1 do
    Begin
      Result.FieldDefs.Add(AFields[i].FieldName, AFields[i].DataType, AFields[i].Size);
    End;
    Result.Open;
  Finally
  End;
End;

procedure fillCDS(var ACDS : TFDMemTable; const ASQL : String);
Begin
  var qry : TFDQuery;

  Try
    ACDS.DisableControls;
    ACDS.EmptyDataSet;
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
    AQry := TFDQuery.Create(nil);
    AQry.Close;
    AQry.DisableControls;
    AQry.SQL.Text := ASQL;
    AQry.Open;
  Finally
    AQry.EnableControls;
  End;
End;

function getDataSet(const ASQL : String) : TDataSet;
Begin
  var qry : TFDQuery;
  Try
    Result := TDataSet.Create(nil);
    fillQuery(qry, ASQL);

    criarDataset(qry.Fields);

    qry.First;
    while not qry.Eof do
    Begin
      Result.Append;
      var i : word;
      for i := 0 to qry.Fieldcount-1 do
      Begin
        Result.Fields[i].Value := qry.Fields[i].Value;
      End;
      Result.Post;
      qry.Next;
    End;
  Finally
    FreeAndNil(qry);
  End;
End;

end.
