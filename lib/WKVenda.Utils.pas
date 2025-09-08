unit WKVenda.Utils;

interface

uses DB, DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UDMConnection,
SysUtils;


function CriarDataset(ASQL : String) : TFDMemTable; overload;

procedure fillDataset(var ADataSet : TFDMemTable; const ASQL : String);
procedure fillQuery(var AQry : TFDQuery; const ASQL : String);

function criarDataset(AFields : TFields) : TFDMemTable; overload;
function getDataSet(const ASQL : String) : TFDMemTable;


implementation


function CriarDataset(ASQL : String) : TFDMemTable;
Begin
  var qry : TFDQuery;
  Try
    qry := TFDQuery.Create(Nil);
    qry.Connection := DMConnection.FDCon;
    qry.SQL.Text := ASQL;
    qry.Open;

    Result := TFDMemTable.Create(Nil);

    Result.FieldDefs.Clear;

    var i : Integer;
    for i := 0 to qry.FieldCount-1 do
    Begin
      Result.FieldDefs.Add(qry.Fields[i].FieldName, qry.Fields[i].DataType, qry.Fields[i].Size);
    End;

    Result.CreateDataSet;
  Finally
    FreeAndNil(qry);
  End;
End;

function criarDataset(AFields : TFields) : TFDMemTable;
Begin
  Try
    Result := TFDMemTable.Create(nil);
    var i : Integer;
    for i := 0 to AFields.Count-1 do
    Begin
      Result.FieldDefs.Add(AFields[i].FieldName, AFields[i].DataType, AFields[i].Size);
    End;

    Result.CreateDataSet;

    //Result.Open;
  Finally
  End;
End;

procedure fillDataset(var ADataSet : TFDMemTable; const ASQL : String);
Begin
  var qry : TFDQuery;

  Try
    ADataSet.DisableControls;

    if(ADataSet.Active)then
      ADataSet.EmptyDataSet;

    fillQuery(qry, ASQL);

    qry.First;
    while not qry.Eof do
    Begin
      ADataSet.Append;
      var i : Integer;
      for i := 0 to qry.FieldCount-1 do
      Begin
        ADataSet.Fields[i].Value := qry.Fields[i].Value;
      End;
      ADataSet.Post;

      qry.Next;
    End;
    ADataSet.First;

  Finally
    ADataSet.EnableControls;
    FreeAndNil(qry);
  End;
End;

procedure fillQuery(var AQry : TFDQuery; const ASQL : String);
Begin
  Try
    AQry := TFDQuery.Create(nil);
    AQry.Connection := DMConnection.FDCon;
    AQry.Close;
    AQry.DisableControls;
    AQry.SQL.Text := ASQL;
    AQry.Open;
  Finally
    AQry.EnableControls;
  End;
End;

function getDataSet(const ASQL : String) : TFDMemTable;
Begin
  var qry : TFDQuery;
  Try
    fillQuery(qry, ASQL);

    Result := criarDataset(qry.Fields);

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
