object Rest: TRest
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 340
  Width = 291
  object RESTClient: TRESTClient
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Params = <>
    HandleRedirects = True
    Left = 40
    Top = 40
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 40
    Top = 112
  end
  object RESTResponse: TRESTResponse
    Left = 40
    Top = 176
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    Dataset = ClientDataSet
    FieldDefs = <>
    Response = RESTResponse
    Left = 40
    Top = 240
  end
  object FDMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 136
    Top = 112
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 136
    Top = 176
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 136
    Top = 240
  end
end
