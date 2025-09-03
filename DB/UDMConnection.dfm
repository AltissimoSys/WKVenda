object DMConnection: TDMConnection
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    DriverID = 'MySQL'
    VendorHome = 'D:\Profissional\WKTech-Seletivo\WKTech-Projeto\Win32\Debug'
    VendorLib = 'libmysql.dll'
    Left = 256
    Top = 216
  end
  object FDCon: TFDConnection
    Params.Strings = (
      'Database=AltsSys'
      'User_Name=WKVenda'
      'Password=wkt3ch$#'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 184
    Top = 104
  end
end
