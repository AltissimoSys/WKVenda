object ModelProduto: TModelProduto
  Height = 369
  Width = 558
  object cdsProdutos_old: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 128
  end
  object cdsProdutos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 240
    Top = 168
  end
end
