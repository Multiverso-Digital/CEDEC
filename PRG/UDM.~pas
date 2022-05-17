unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB, Forms;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    qMeso: TADOQuery;
    ds_Meso: TDataSource;
    qMuni: TADOQuery;
    ds_muni: TDataSource;
    qGrupo: TADOQuery;
    ds_grupo: TDataSource;
    qMesomeso: TWideStringField;
    qMunino_munic: TWideStringField;
    qGrupoGrupo_indicador: TWideStringField;
    qRelIndicaMuni: TADOQuery;
    qRelMunicipios: TADOQuery;
    qRelIndicaMuniID: TAutoIncField;
    qRelIndicaMuniGrupo_indicador: TWideStringField;
    qRelIndicaMuniIndicador: TWideStringField;
    qRelIndicaMunimeso: TWideStringField;
    qRelIndicaMunino_munic: TWideStringField;
    qRelIndicaMunivalor: TWideStringField;
    qRelIndicaMuninome_campo: TWideStringField;
    qRelIndicaMuniPorte: TWideStringField;
    qRelIndicaMuniValorMeso: TWideStringField;
    qRelMunicipiosID: TAutoIncField;
    qRelMunicipiosGrupo_indicador: TWideStringField;
    qRelMunicipiosIndicador: TWideStringField;
    qRelMunicipiosmeso: TWideStringField;
    qRelMunicipiosno_munic: TWideStringField;
    qRelMunicipiosvalor: TWideStringField;
    qRelMunicipiosnome_campo: TWideStringField;
    qRelMunicipiosPorte: TWideStringField;
    qRelMunicipiosValorMeso: TWideStringField;
    qItem: TADOQuery;
    qItemIndicador: TWideStringField;
    qItemID_indica: TAutoIncField;
    ds_item: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  Dire:string;
implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Dire := ExtractFilePath(Application.ExeName);
  ADOConnection1.close;
  ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+dire+'\dados\indicadores.mdb;Persist Security Info=False;Jet OLEDB:Database Password=190152';
  if not ADOConnection1.Connected then ADOConnection1.Open;
end;

end.
