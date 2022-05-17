object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 249
  Top = 106
  Height = 366
  Width = 449
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\@Projetos_em_and' +
      'amento\CEDEC\PRG\dados\indicadores.mdb;Persist Security Info=Fal' +
      'se;Jet OLEDB:Database Password=190152'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 16
  end
  object qMeso: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select meso from Indica_linha group by Meso')
    Left = 24
    Top = 96
    object qMesomeso: TWideStringField
      FieldName = 'meso'
      Size = 255
    end
  end
  object ds_Meso: TDataSource
    DataSet = qMeso
    Left = 16
    Top = 160
  end
  object qMuni: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = '@meso'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select no_munic'
      'from Indica_linha'
      'where '
      'meso = @meso and no_munic <> '#39#39
      'group by no_munic'
      '')
    Left = 104
    Top = 96
    object qMunino_munic: TWideStringField
      FieldName = 'no_munic'
      Size = 255
    end
  end
  object ds_muni: TDataSource
    DataSet = qMuni
    Left = 104
    Top = 168
  end
  object qGrupo: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Grupo_indicador from DescIndica group by Grupo_indicador')
    Left = 216
    Top = 96
    object qGrupoGrupo_indicador: TWideStringField
      FieldName = 'Grupo_indicador'
      Size = 50
    end
  end
  object ds_grupo: TDataSource
    DataSet = qGrupo
    Left = 208
    Top = 160
  end
  object qRelIndicaMuni: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT'
      '  DescIndica.ID_indica as ID,'
      '  DescIndica.Grupo_indicador,'
      '  DescIndica.Indicador,'
      '  Indica_linha.meso,'
      '  Indica_linha.no_munic,'
      '  Indica_linha.valor,'
      '  DescIndica.nome_campo,'
      '  Indica_linha.Porte,'
      
        '  (Select Indica_linha.valor from Indica_linha where Indica_linh' +
        'a.ID_indica = ID and Indica_linha.meso like '#39'A'#39' and Indica_linha' +
        '.cd_munic = 0) AS ValorMeso'
      'FROM'
      '  DescIndica'
      
        'INNER JOIN Indica_linha ON DescIndica.ID_indica = Indica_linha.I' +
        'D_indica'
      
        'ORDER BY Indica_linha.meso, Indica_linha.no_munic, DescIndica.Gr' +
        'upo_indicador, DescIndica.Descricao'
      ''
      ''
      '')
    Left = 352
    Top = 232
    object qRelIndicaMuniID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qRelIndicaMuniGrupo_indicador: TWideStringField
      FieldName = 'Grupo_indicador'
      Size = 75
    end
    object qRelIndicaMuniIndicador: TWideStringField
      FieldName = 'Indicador'
      Size = 255
    end
    object qRelIndicaMunimeso: TWideStringField
      FieldName = 'meso'
      Size = 255
    end
    object qRelIndicaMunino_munic: TWideStringField
      FieldName = 'no_munic'
      Size = 255
    end
    object qRelIndicaMunivalor: TWideStringField
      FieldName = 'valor'
      Size = 100
    end
    object qRelIndicaMuninome_campo: TWideStringField
      FieldName = 'nome_campo'
      Size = 50
    end
    object qRelIndicaMuniPorte: TWideStringField
      FieldName = 'Porte'
      Size = 255
    end
    object qRelIndicaMuniValorMeso: TWideStringField
      FieldName = 'ValorMeso'
      Size = 100
    end
  end
  object qRelMunicipios: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT'
      'DescIndica.ID_indica as ID,'
      'DescIndica.Grupo_indicador,'
      'DescIndica.Indicador,'
      'Indica_linha.meso,'
      'Indica_linha.no_munic,'
      'Indica_linha.valor,'
      'DescIndica.nome_campo,'
      'Indica_linha.Porte,'
      
        '(Select Indica_linha.valor from Indica_linha where Indica_linha.' +
        'ID_indica = ID and Indica_linha.meso like '#39'A'#39' and Indica_linha.c' +
        'd_munic = 0) AS ValorMeso'
      'FROM'
      'DescIndica'
      
        'INNER JOIN Indica_linha ON DescIndica.ID_indica = Indica_linha.I' +
        'D_indica'
      
        'order by DescIndica.Grupo_indicador,DescIndica.Descricao, Indica' +
        '_linha.meso, Indica_linha.no_munic')
    Left = 352
    Top = 280
    object qRelMunicipiosID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qRelMunicipiosGrupo_indicador: TWideStringField
      FieldName = 'Grupo_indicador'
      Size = 75
    end
    object qRelMunicipiosIndicador: TWideStringField
      FieldName = 'Indicador'
      Size = 255
    end
    object qRelMunicipiosmeso: TWideStringField
      FieldName = 'meso'
      Size = 255
    end
    object qRelMunicipiosno_munic: TWideStringField
      FieldName = 'no_munic'
      Size = 255
    end
    object qRelMunicipiosvalor: TWideStringField
      FieldName = 'valor'
      Size = 100
    end
    object qRelMunicipiosnome_campo: TWideStringField
      FieldName = 'nome_campo'
      Size = 50
    end
    object qRelMunicipiosPorte: TWideStringField
      FieldName = 'Porte'
      Size = 255
    end
    object qRelMunicipiosValorMeso: TWideStringField
      FieldName = 'ValorMeso'
      Size = 100
    end
  end
  object qItem: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = '@grupo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '0'
      end>
    SQL.Strings = (
      
        'select DescIndica.Indicador, DescIndica.ID_indica from DescIndic' +
        'a where grupo_indicador = @grupo'
      'group by DescIndica.Indicador,DescIndica.ID_indica')
    Left = 304
    Top = 104
    object qItemIndicador: TWideStringField
      FieldName = 'Indicador'
      Size = 255
    end
    object qItemID_indica: TAutoIncField
      FieldName = 'ID_indica'
      ReadOnly = True
    end
  end
  object ds_item: TDataSource
    DataSet = qItem
    Left = 312
    Top = 168
  end
end
