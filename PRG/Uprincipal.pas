unit Uprincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Menus, ShellAPI, ExtCtrls, AdvToolBtn,
  WinSkinData, RxGIF;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    Mapas1: TMenuItem;
    sair1: TMenuItem;
    Informaes1: TMenuItem;
    Ajuda1: TMenuItem;
    Image1: TImage;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbMeso: TRxDBLookupCombo;
    cbmuni: TRxDBLookupCombo;
    cbGrupo: TRxDBLookupCombo;
    Button1: TButton;
    cbItem: TRxDBLookupCombo;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Button2: TButton;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Atendimentodeguaeesgoto1: TMenuItem;
    Enfermeirospormil1: TMenuItem;
    Investimentossobredespesas1: TMenuItem;
    Leitospormil1: TMenuItem;
    LeitosdoSUSpormiljpg1: TMenuItem;
    localizacaodamesorregio1: TMenuItem;
    Localizacaodosmunicpios1: TMenuItem;
    Mdicospormil1: TMenuItem;
    ParticipaodossetoresnoPIB1: TMenuItem;
    ParticipaonoFPM1: TMenuItem;
    ParticipaonoPIBdaMesoregio1: TMenuItem;
    ParticipaodogovernonoPIBmunicipal1: TMenuItem;
    ValordoPIBmunicipal1: TMenuItem;
    Rendapercapita1: TMenuItem;
    ParticipaodostorprimrionoPIBmunicipal1: TMenuItem;
    ParticipaodosetorsecondrionoPIBmunicipal1: TMenuItem;
    ParticipaodosetortercirionoPIBmunicipal1: TMenuItem;
    Populaoresidentecommaisde10anos1: TMenuItem;
    Populaoresidente1: TMenuItem;
    Proporodepessoascomaltaebaixaescolaridade1: TMenuItem;
    Razodedependncia1: TMenuItem;
    axadeindependncia1: TMenuItem;
    Button3: TButton;
    Button4: TButton;
    SkinData1: TSkinData;
    abelas1: TMenuItem;
    Anexos1: TMenuItem;
    Apresentao1: TMenuItem;
    Equipe1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure CBMesoChange(Sender: TObject);
    procedure cbgrupoChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sair1Click(Sender: TObject);
    //procedure Mapas1Click(Sender: TObject);
    procedure AdvToolButton1Click(Sender: TObject);
    procedure AdvToolButton2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure Atendimentodeguaeesgoto1Click(Sender: TObject);
    procedure Enfermeirospormil1Click(Sender: TObject);
    procedure Investimentossobredespesas1Click(Sender: TObject);
    procedure Leitospormil1Click(Sender: TObject);
    procedure LeitosdoSUSpormiljpg1Click(Sender: TObject);
    procedure localizacaodamesorregio1Click(Sender: TObject);
    procedure Localizacaodosmunicpios1Click(Sender: TObject);
    procedure Mdicospormil1Click(Sender: TObject);
    procedure ParticipaodossetoresnoPIB1Click(Sender: TObject);
    procedure ParticipaonoFPM1Click(Sender: TObject);
    procedure ParticipaonoPIBdaMesoregio1Click(Sender: TObject);
    procedure ParticipaodogovernonoPIBmunicipal1Click(Sender: TObject);
    procedure ValordoPIBmunicipal1Click(Sender: TObject);
    procedure Rendapercapita1Click(Sender: TObject);
    procedure ParticipaodostorprimrionoPIBmunicipal1Click(Sender: TObject);
    procedure ParticipaodosetorsecondrionoPIBmunicipal1Click(
      Sender: TObject);
    procedure ParticipaodosetortercirionoPIBmunicipal1Click(
      Sender: TObject);
    procedure Populaoresidentecommaisde10anos1Click(Sender: TObject);
    procedure Populaoresidente1Click(Sender: TObject);
    procedure Proporodepessoascomaltaebaixaescolaridade1Click(
      Sender: TObject);
    procedure Razodedependncia1Click(Sender: TObject);
    procedure axadeindependncia1Click(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure Anexos1Click(Sender: TObject);
    procedure Informaes1Click(Sender: TObject);
    procedure Apresentao1Click(Sender: TObject);
    procedure Equipe1Click(Sender: TObject);

  private
    { Private declarations }
    procedure abreTabelas();
    procedure AbreMunicipio();
    procedure AbreIndicador();
    procedure imprimir_IndicaMuni();
    procedure montaquery_IndicaMuni();

    procedure apagaGrupos();
    procedure fechaTabelas();

    procedure montaquery_Municipios();
    procedure imprimir_Municipios();

    procedure abreMapas(NomeMapa:String);
    
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  DiretorioMapas:String;

implementation

uses UDM, Usobre;

{$R *.dfm}

procedure TForm1.apagaGrupos();
begin
  GroupBox1.Visible:=false;
  GroupBox2.Visible:=false;
  GroupBox1.top := 0;
  GroupBox2.top := 0;

  GroupBox1.left := 200;
  GroupBox2.left := 200;

 // GroupBox1.Align:=alRight;
 // GroupBox2.Align:=alRight;
  cbMeso.DisplayValue:='';
  cbmuni.DisplayValue:='';
  cbGrupo.DisplayValue:='';
  RxDBLookupCombo1.DisplayValue:='';
  RxDBLookupCombo3.DisplayValue:='';
end;



procedure TForm1.abreTabelas();
begin
  dm.qMeso.open;
  dm.qGrupo.Open;
end;

procedure TForm1.AbreMunicipio();
begin
  if dm.qMuni.active then dm.qMuni.close;
  dm.qMuni.Parameters[0].Value:=dm.qMesoMeso.asString;
  dm.qMuni.open;
end;

procedure TForm1.AbreIndicador();
begin
  if dm.qItem.active then dm.qItem.close;
  dm.qItem.Parameters[0].Value:=dm.qGrupogrupo_indicador.asString;
  dm.qItem.open;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  abreTabelas();
  apagaGrupos();
  DiretorioMapas:='';
  AdvToolButton1Click(self);
end;

procedure TForm1.CBMesoChange(Sender: TObject);
begin
  if CBMeso.DisplayValue='' then
  begin
    dm.qMuni.close;
  end
  else
  begin
    AbreMunicipio();
  end;

  if CBMeso.DisplayValue='Metropolitana de São Paulo' then
    DiretorioMapas:='metro_SP'
  else if CBMeso.DisplayValue='Sertão Pernambucano' then
    DiretorioMapas:='sertao_PE'
  else if CBMeso.DisplayValue='Sul Goiano' then
    DiretorioMapas:='sul_GO'
  else if CBMeso.DisplayValue='Vale do Itajaí' then
    DiretorioMapas:='vale_itajai';

end;

procedure TForm1.cbgrupoChange(Sender: TObject);
begin
  if cbgrupo.DisplayValue = '' then
  begin
    dm.qItem.Close;
  end
  else
  begin
    AbreIndicador();
  end;

end;


procedure TForm1.montaquery_IndicaMuni();
var i:integer;
begin
  if dm.qRelIndicaMuni.Active then dm.qRelIndicaMuni.Active:=false;
  with dm.qRelIndicaMuni.SQL do
  begin
    clear;
    add('SELECT');
    add('DescIndica.ID_indica as ID,');
    add('DescIndica.Grupo_indicador,');
    add('DescIndica.Indicador,');
    add('Indica_linha.meso,');
    add('Indica_linha.no_munic,');
    add('Indica_linha.valor,');
    add('DescIndica.nome_campo,');
    add('Indica_linha.Porte,');
    if cbMeso.KeyValue = Null then
      add('(Select Indica_linha.valor from Indica_linha where Indica_linha.ID_indica = DescIndica.ID_indica and Indica_linha.meso like '+QuotedStr('xxx')+' and Indica_linha.cd_munic = 0) AS ValorMeso')
    else
      add('(Select Indica_linha.valor from Indica_linha where Indica_linha.ID_indica = DescIndica.ID_indica and Indica_linha.meso like '+QuotedStr(cbMeso.KeyValue)+' and Indica_linha.cd_munic = 0) AS ValorMeso');
    add('FROM');
    add('DescIndica');
    add('INNER JOIN Indica_linha ON DescIndica.ID_indica = Indica_linha.ID_indica');
    add('WHERE');
    if CBGrupo.DisplayValue<>'' then
    begin
      add('DescIndica.Grupo_indicador like '+QuotedStr(cbGrupo.KeyValue));
      add('AND');
    end;
    if cbItem.DisplayValue<>'' then
    begin
      add('DescIndica.Indicador like '+QuotedStr(cbItem.KeyValue));
      add('AND');
    end;
    if cbMeso.DisplayValue<>'' then
    begin
      add('Indica_linha.meso like '+QuotedStr(cbMeso.KeyValue));
      add('AND');
    end;
    if cbMuni.DisplayValue<>'' then
    begin
      add('Indica_linha.no_munic like '+QuotedStr(cbMuni.KeyValue));
      add('AND');
    end
    else
    begin
      add('Indica_linha.cd_munic = 0');
      add('and');
    end;
    delete(count-1);
    add('order by Indica_linha.meso,Indica_linha.no_munic,DescIndica.Grupo_indicador,DescIndica.Indicador')
  end;
  for i:=0 to dm.qRelIndicaMuni.Parameters.Count-1 do
  begin
    dm.qRelIndicaMuni.Parameters[i].Value:=0;
  end;
  dm.qRelIndicaMuni.Active:=true;
end;



procedure TForm1.montaquery_Municipios();
var i:integer;
begin
  if dm.qRelMunicipios.Active then dm.qRelMunicipios.Active:=false;
  with dm.qRelMunicipios.SQL do
  begin
    clear;
    add('SELECT');
    add('DescIndica.ID_indica as ID,');
    add('DescIndica.Grupo_indicador,');
    add('DescIndica.Indicador,');
    add('Indica_linha.meso,');
    add('Indica_linha.no_munic,');
    add('Indica_linha.valor,');
    add('DescIndica.nome_campo,');
    add('Indica_linha.Porte,');
    if RxDBLookupCombo1.DisplayValue<>'' then
      add('(Select Indica_linha.valor from Indica_linha where Indica_linha.ID_Indica = DescIndica.ID_indica and Indica_linha.meso like '+QuotedStr(RxDBLookupCombo1.KeyValue)+' and Indica_linha.cd_munic = 0) as ValorMeso' )
    else
      add('(Select Indica_linha.valor from Indica_linha where Indica_linha.ID_Indica = DescIndica.ID_indica and Indica_linha.meso like '+QuotedStr('XXXX')+' and Indica_linha.cd_munic = 0) as ValorMeso' );
    add('FROM');
    add('DescIndica');
    add('INNER JOIN Indica_linha ON DescIndica.ID_indica = Indica_linha.ID_indica');
    add('WHERE');

    if RxDBLookupCombo3.DisplayValue<>'' then
    begin
      add('DescIndica.Grupo_indicador like '+QuotedStr(RxDBLookupCombo3.KeyValue));
      add('AND');
    end;
    if RxDBLookupCombo4.DisplayValue<>'' then
    begin
      //add('DescIndica.ID_Indica = '+QuotedStr(RxDBLookupCombo4.KeyValue));
      add('DescIndica.ID_Indica = '+RxDBLookupCombo4.KeyValue);
      add('AND');
    end;
    if RxDBLookupCombo1.DisplayValue<>'' then
    begin
      add('Indica_linha.meso like '+QuotedStr(RxDBLookupCombo1.KeyValue));
      add('AND');
      add('Indica_linha.cd_munic <> 0');
      add('AND');
    end
    else
    begin
      add('Indica_linha.cd_munic = 0');
      add('and');
    end;
    if RxDBLookupCombo2.DisplayValue<>'' then
    begin
      add('Indica_linha.no_munic like '+QuotedStr(RxDBLookupCombo2.KeyValue));
      add('AND');
    end;
    delete(count-1);
    add('order by DescIndica.Grupo_indicador,Indica_linha.ID_Indica, Indica_linha.meso, Indica_linha.no_munic')
  end;
  for i:=0 to dm.qRelMunicipios.Parameters.Count-1 do
  begin
    dm.qRelMunicipios.Parameters[i].Value:=0;
  end;
  dm.qRelMunicipios.Active:=true;
end;


procedure TForm1.imprimir_IndicaMuni();
var
HTML:TStringList;
quebraGrupo,quebraIndicador,quebraMuni,flip:boolean;
oldGrupo,OldMuni,formato,Titulo:String;

begin
  html := TStringList.create();
  HTML.Add(form1.Memo1.Lines.GetText);



  dm.qRelIndicaMuni.first;

  oldGrupo:=dm.qRelIndicaMuniGrupo_indicador.asString;
  oldMuni:=dm.qRelIndicaMunino_munic.asString;
  //Oldzona:=dm.qRelIndicaMuniZona.asString;
  //OldQuali:=dm.qRelIndicaMuniQualificador.asString;

  quebraGrupo:=true;
  quebraIndicador:=true;
  quebraMuni:=true;
  while not dm.qRelIndicaMuni.eof do
  begin

  if quebraMuni then
  begin
    HTML.Add('<table width="100%">');
    HTML.Add('<tr>');
    HTML.Add('  <td class="titulo_noBold">Mesorregião:</td>');
    HTML.Add('  <td class="titulo1">'+dm.qRelIndicaMunimeso.asString+'</td>');
    HTML.Add('</tr>');
    HTML.Add('<tr>');
    HTML.Add('  <td class="titulo_noBold">Munic&iacute;pio:</td>');
    HTML.Add('  <td class="titulo1">'+dm.qRelIndicaMunino_munic.asString+'</td>');
    HTML.Add('</tr>');
    HTML.Add('<tr>');
    HTML.Add('  <td class="titulo_noBold">Porte:</td>');
    HTML.Add('  <td class="titulo1">'+dm.qRelIndicaMuniPorte.asString+'</td>');
    HTML.Add('</tr>');
    HTML.Add('</table>');
    oldMuni:=dm.qRelIndicaMunino_munic.asString;
    quebraMuni:=false;
  end;




    if quebraGrupo then
    begin

      html.add('<table width="100%">');
      html.add('<tr class="titulo1">');
      html.add('<td>'+dm.qRelIndicaMuniGrupo_indicador.asString+'</td>');
      html.add('</tr>');
      html.add('<tr>');
      html.add('<td>');
      oldGrupo:=dm.qRelIndicaMuniGrupo_indicador.asString;
      quebraGrupo:=false;
    end;
    if quebraIndicador then
    begin
      flip:=false;
      html.add('<table width="100%">');
      //html.add('<tr class="titulo1">');
            Titulo := dm.qRelIndicaMuniIndicador.asString;


      //html.add('<td colspan="2">'+Titulo+'</td>');
      //html.add('<td>'+dm.qRelIndicaMuniFonte.asString+'</td>');

      //html.add('</tr>');
      //html.add('<td></td>');
      html.add('<tr class="titulo1">');
      html.add('<td width="60%" colspan="2">Variável</td>');
      if cbMuni.DisplayValue<>'' then
        html.add('<td width="20%" align="right">Valor</td>');

      HTML.Add('<td width="20%" align="right">Valor Mesorregião</td>');
      html.add('</tr>');
      quebraIndicador:=false;
    end;


    if flip then
      html.add('<tr class="zebra">')
    else
      html.add('<tr>');

      flip:= not flip;
      html.add('<td><A HREF="'+dm.qRelIndicaMuninome_campo.asString+'.html" onClick="popup= window.open('+QuotedStr(dm.qRelIndicaMuninome_campo.asString+'.html')+' , '+quotedstr('dicionário')+', '+QuotedStr('height=300,width=550,scrollbars=yes,resizable=yes')+'); return false" target="_blank"><img src="img/Ajuda2.gif" alt="ajuda" border="0"/></a></td>');
      //formato:=form1.buscaFormato(dm.qRelIndicaMuniTipo.asString);
      html.add('<td>'+dm.qRelIndicaMuniIndicador.asString+'</td>');
      //html.add('<td align="right">'+formatfloat(formato,dm.qRelIndicaMuniValor.asFloat)+'</td>');

      html.add('<td align="right">'+dm.qRelIndicaMuniValor.asString+'</td>');
      if cbMuni.DisplayValue<>'' then
        html.add('<td align="right">'+dm.qRelIndicaMuniValorMeso.AsString+'</td>');
      html.add('</tr>');

      dm.qRelIndicaMuni.Next;

      if (dm.qRelIndicaMuni.eof)
          or (oldGrupo<>dm.qRelIndicaMuniGrupo_indicador.asString)
            or (oldMuni<>dm.qRelIndicaMunino_munic.asString)  then
      begin
        html.add('</table>');
        quebraIndicador:=true;
      end;




      if (oldGrupo<>dm.qRelIndicaMuniGrupo_indicador.asString)
         or (dm.qRelIndicaMuni.eof)
           or (oldMuni<>dm.qRelIndicaMunino_munic.asString) then
      begin
        html.add('</td>');
        html.add('</tr>');
        html.add('</table>');
        html.add('<br />');

        quebraIndicador:=true;
        quebraGrupo:=true;
      end;

      if (oldMuni<>dm.qRelIndicaMunino_munic.asString) then
      begin
        quebraMuni:=true;
      end;
  end;
  html.add('<br />');
  HTML.Add('<table width="100%" border="0" align="center">');
  HTML.Add('<tr>');
  HTML.Add('<td> ');
  HTML.Add('<img src="img/rodape.gif" alt="cenpec" />');
  HTML.Add('</td>');
  HTML.Add('</tr>');
  HTML.Add('</table>');
  html.add('</body>');

  try
    html.SaveToFile(dire+'\HTML\relatorio.html');
  except
    exit;
  end;

  try
    shellexecute(handle,'open',pchar(dire+'\HTML\relatorio.html'),nil,nil,SW_SHOW);
  except
    exit;
  end;


end;

procedure TForm1.imprimir_Municipios();
var
HTML:TStringList;
quebraGrupo,quebraIndicador,quebraMuni,flip:boolean;
oldGrupo,OldMuni,oldIndica,formato,Titulo:String;

begin
  html := TStringList.create();
  HTML.Add(form1.Memo1.Lines.GetText);



  dm.qRelMunicipios.first;

  oldGrupo:=dm.qRelMunicipiosGrupo_indicador.asString;
  oldIndica:=dm.qRelMunicipiosIndicador.asString;
  oldMuni:=dm.qRelMunicipiosno_munic.asString;
  //Oldzona:=dm.qRelMunicipiosZona.asString;
  //OldQuali:=dm.qRelMunicipiosQualificador.asString;

  quebraGrupo:=true;
  quebraIndicador:=true;
  quebraMuni:=true;

  while not  dm.qRelMunicipios.eof do
  begin
    if quebraGrupo then
    begin
      HTML.add('<table width="100%">');
      html.add('<tr class="titulo1">');
      HTML.Add('  <td class="titulo_noBold">Grupo do Indicador</td>');
      HTML.Add('  <td class="titulo1">'+dm.qRelMunicipiosGrupo_indicador.asString+'</td>');
      html.add('</tr>');
      oldGrupo:=dm.qRelMunicipiosGrupo_indicador.asString;
      quebraGrupo:=false;
    end;

    if quebraIndicador then
    begin
      html.add('<tr class="titulo1">');
      HTML.Add('  <td class="titulo_noBold">Indicador</td>');
      HTML.Add('  <td class="titulo1"><A HREF="'+dm.qRelMunicipiosnome_campo.asString+'.html" onClick="popup= window.open('+QuotedStr(dm.qRelMunicipiosnome_campo.asString+'.html')+' , '+quotedstr('dicionário')+', '+QuotedStr('height=300,width=550,scrollbars=yes,resizable=yes')+'); return false" target="_blank">'+dm.qRelMunicipiosIndicador.asString+'</a></td>');
      html.add('</tr>');
      html.add('<tr>');
      html.add('<td colspan="2">');
      HTML.Add('<table width="100%">');

      html.add('<tr>');
      if RxDBLookupCombo1.DisplayValue = '' then
      begin
        HTML.Add('  <td width="50%" class="titulo_noBold">Mesorregião</td>');
        //HTML.Add('  <td width="20%" class="titulo_noBold">Porte</td>');
        //HTML.Add('  <td width="15%" class="titulo_noBold" align="right">Valor</td>');
        HTML.Add('  <td width="15%" class="titulo_noBold" align="right">Valor Mesorregião</td>');
      end
      else
      begin
        HTML.Add('  <td width="30%" class="titulo_noBold">Mesorregião</td>');
        HTML.Add('  <td width="46%" class="titulo_noBold">Porte</td>');
        HTML.Add('  <td width="12%" class="titulo_noBold" align="right">Valor</td>');
        HTML.Add('  <td width="12%" class="titulo_noBold" align="right">Valor Mesorregião</td>');
      end;
      html.add('</tr>');
      quebraIndicador:=false;
      oldIndica:=dm.qRelMunicipiosIndicador.asString;
    end;

      if flip then
        html.add('<tr class="zebra">')
      else
        html.add('<tr>');

      flip:= not flip;

      if RxDBLookupCombo1.DisplayValue = '' then
      begin
        html.add('<td>'+dm.qRelMunicipiosmeso.asString+'</td>');
        //html.add('<td>'+dm.qRelMunicipiosPorte.asString+'</td>');
        html.add('<td align="right">'+dm.qRelMunicipiosvalor.asString+'</td>');
        //html.add('<td align="right">'+dm.qRelMunicipiosValorMeso.asString+'</td>');
      end
      else
      begin
        html.add('<td>'+dm.qRelMunicipiosno_munic.asString+'</td>');
        html.add('<td>'+dm.qRelMunicipiosPorte.asString+'</td>');
        html.add('<td align="right">'+dm.qRelMunicipiosvalor.asString+'</td>');
        html.add('<td align="right">'+dm.qRelMunicipiosValorMeso.asString+'</td>');
      end;

      html.add('</tr>');




    dm.qRelMunicipios.Next;

    if (oldIndica<>dm.qRelMunicipiosIndicador.asString) or (dm.qRelMunicipios.eof) then
    begin
      HTML.Add('</td>');
      HTML.Add('</tr>');
      HTML.Add('</table>');
      quebraIndicador:=true;
    end;

    if (oldGrupo<>dm.qRelMunicipiosGrupo_indicador.asString) or (dm.qRelMunicipios.eof) then
    begin
      HTML.add('</table>');
      quebraGrupo:=true;
    end;
  end;
  html.add('<br />');
  HTML.Add('<table width="100%" border="0" align="center">');
  HTML.Add('<tr>');
  HTML.Add('<td> ');
  HTML.Add('<img src="img/rodape.gif" alt="cenpec" />');
  HTML.Add('</td>');
  HTML.Add('</tr>');
  HTML.Add('</table>');
  html.add('</body>');




  try
    html.SaveToFile(dire+'\HTML\relatorio.html');
  except
    exit;
  end;

  try
    shellexecute(handle,'open',pchar(dire+'\HTML\relatorio.html'),nil,nil,SW_SHOW);
  except
    exit;
  end;


end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  screen.Cursor:=crsqlwait;
  if cbmeso.DisplayValue = '' then
  begin
    Showmessage('Selecione a Mesorregião.');
    screen.Cursor:=crDefault;
    exit;
  end;
  montaquery_IndicaMuni();
  imprimir_IndicaMuni();
screen.Cursor:=crDefault;
end;

procedure TForm1.sair1Click(Sender: TObject);
begin
close;
end;

//procedure TForm1.Mapas1Click(Sender: TObject);
//var monta:String;
//montaPlay:Tstringlist;
//begin
    {montaPlay:=TStringlist.create();
    montaPLay.LoadFromFile(dire+'PowerPointExe\playlist.txt');
    montaPlay[0]:=dire+'PowerPointExe\RegMetropolitana.ppt';
    montaPLay.SaveToFile(dire+'PowerPointExe\playlist.txt');
    montaPlay.free;

    monta:=' /L '+dire+'PowerPointExe\playlist.txt';
    shellexecute(handle,'open',pchar(dire+'PowerPointExe\pptview.exe'),pchar(monta),nil,SW_SHOW);}

//end;

procedure TForm1.AdvToolButton1Click(Sender: TObject);
begin
  apagaGrupos();
  GroupBox1.Visible:=true;
  abreTabelas();
end;

procedure TForm1.AdvToolButton2Click(Sender: TObject);
begin
  apagaGrupos();
  GroupBox2.Visible:=true;
  abreTabelas();
end;

procedure TForm1.fechaTabelas();
begin
  dm.qMeso.close;
  dm.qGrupo.close;
  dm.qMuni.close;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  fechaTabelas();
end;

procedure TForm1.RxDBLookupCombo3Change(Sender: TObject);
begin
  if RxDBLookupCombo3.DisplayValue = '' then
  begin
    dm.qItem.Close;
  end
  else
  begin
    AbreIndicador();
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
screen.Cursor:=crsqlwait;
  {if RxDBLookupCombo1.DisplayValue = '' then
  begin
    Showmessage('Selecione a mesorregião.');
    screen.Cursor:=crDefault;
    exit;
  end;}
  montaquery_Municipios();
  imprimir_Municipios();
  screen.Cursor:=crDefault;
end;

procedure TForm1.abreMapas(NomeMapa:String);
begin
  if GroupBox1.Visible then
  begin
    if cbMeso.DisplayValue = '' then
    begin
      showMessage('Selecione a Mesorregião');
      exit;
    end;
  end
  else if GroupBox2.Visible then
  begin
    if RxDBLookupCombo1.DisplayValue = '' then
    begin
      showMessage('Selecione a Mesorregião');
      exit;
    end;
  end
  else
  begin
      showMessage('Selecione um dos botões');
      exit;
  end;
  try
    shellexecute(handle,'open',pchar(dire+'\Mapas\'+DiretorioMapas+'\'+NomeMapa),nil,nil,SW_SHOW);
  except

    //showMessage('Erro: Mapa da Mesoregião selecionada não encontrado')
  end;
end;

procedure TForm1.RxDBLookupCombo1Change(Sender: TObject);
begin
  if RxDBLookupCombo1.DisplayValue='Metropolitana de São Paulo' then
    DiretorioMapas:='metro_SP'
  else if RxDBLookupCombo1.DisplayValue='Sertão Pernambucano' then
    DiretorioMapas:='sertao_PE'
  else if RxDBLookupCombo1.DisplayValue='Sul Goiano' then
    DiretorioMapas:='sul_GO'
  else if RxDBLookupCombo1.DisplayValue='Vale do Itajaí' then
    DiretorioMapas:='vale_itajai';

end;

procedure TForm1.Atendimentodeguaeesgoto1Click(Sender: TObject);
begin
  abreMapas('Atendiemtnoaguaesgotolixo.jpg');
end;

procedure TForm1.Enfermeirospormil1Click(Sender: TObject);
begin
  abremapas('Enfermeirospormil.jpg');
end;

procedure TForm1.Investimentossobredespesas1Click(Sender: TObject);
begin
abreMapas('Investimentossobredespesas.jpg');
end;

procedure TForm1.Leitospormil1Click(Sender: TObject);
begin
abreMapas('Leitospormil.jpg');
end;

procedure TForm1.LeitosdoSUSpormiljpg1Click(Sender: TObject);
begin
abreMapas('LeitosSUSpormil.jpg');
end;

procedure TForm1.localizacaodamesorregio1Click(Sender: TObject);
begin
abremapas('localizacaodamesorregiao.jpg');
end;

procedure TForm1.Localizacaodosmunicpios1Click(Sender: TObject);
begin
abremapas('localizacaodosmunicipios.jpg')
end;

procedure TForm1.Mdicospormil1Click(Sender: TObject);
begin
abremapas('Medicospormil.jpg')
end;

procedure TForm1.ParticipaodossetoresnoPIB1Click(Sender: TObject);
begin
abreMapas('ParticipacaodossetoresnoPIB.jpg')
end;

procedure TForm1.ParticipaonoFPM1Click(Sender: TObject);
begin
abremapas('ParticipacaonoFPM.jpg');
end;

procedure TForm1.ParticipaonoPIBdaMesoregio1Click(Sender: TObject);
begin
abremapas('participacaonoPIBdameso.jpg');
end;

procedure TForm1.ParticipaodogovernonoPIBmunicipal1Click(Sender: TObject);
begin
  abremapas('PIBgoverno.jpg') ;
end;

procedure TForm1.ValordoPIBmunicipal1Click(Sender: TObject);
begin
abremapas('PIBmunicipal.jpg')
end;

procedure TForm1.Rendapercapita1Click(Sender: TObject);
begin
  abremapas('PIBpercapita.jpg')
end;

procedure TForm1.ParticipaodostorprimrionoPIBmunicipal1Click(
  Sender: TObject);
begin
abremapas('PIBprimario.jpg')
end;

procedure TForm1.ParticipaodosetorsecondrionoPIBmunicipal1Click(
  Sender: TObject);
begin
abremapas('PIBsecundario.jpg')
end;

procedure TForm1.ParticipaodosetortercirionoPIBmunicipal1Click(
  Sender: TObject);
begin
abremapas('PIBterciario.jpg')
end;

procedure TForm1.Populaoresidentecommaisde10anos1Click(Sender: TObject);
begin
abremapas('Populacaomaisde10anos.jpg')
end;

procedure TForm1.Populaoresidente1Click(Sender: TObject);
begin
abremapas('Populacaoresidente.jpg')
end;

procedure TForm1.Proporodepessoascomaltaebaixaescolaridade1Click(
  Sender: TObject);
begin
abremapas('Rzdealtaebaixaescolaridade.jpg')
end;

procedure TForm1.Razodedependncia1Click(Sender: TObject);
begin
abremapas('Rzdedependencia.jpg')
end;

procedure TForm1.axadeindependncia1Click(Sender: TObject);
begin
abremapas('Txdeindependencia.jpg');
end;

procedure TForm1.Ajuda1Click(Sender: TObject);
begin
  fsobre:=tfsobre.create(self);
  fsobre.showmodal;
  fsobre.free;
end;

procedure TForm1.Anexos1Click(Sender: TObject);
begin

    if (ShellExecute(handle,'open',pchar(dire+'\html\tabelasanexo.pdf'),nil,nil,SW_SHOW) <= 32) then
    begin
      showMessage('Erro: Adobe reader não encontrado. Faça o download do adobe reader no site da adobe a seguir.');
      shellexecute(handle,'open',pchar('http://www.adobe.com'),nil,nil,SW_SHOW);
    end;
end;

procedure TForm1.Informaes1Click(Sender: TObject);
begin

try
    shellexecute(handle,'open',pchar(dire+'\html\info.htm'),nil,nil,SW_SHOW);
  except

    //showMessage('Erro: Mapa da Mesoregião selecionada não encontrado')
  end;

end;

procedure TForm1.Apresentao1Click(Sender: TObject);
begin
  try
    shellexecute(handle,'open',pchar(dire+'\html\apresenta.html'),nil,nil,SW_SHOW);
  except

    //showMessage('Erro: Mapa da Mesoregião selecionada não encontrado')
  end;
end;

procedure TForm1.Equipe1Click(Sender: TObject);
begin
try
    shellexecute(handle,'open',pchar(dire+'\html\equipe.html'),nil,nil,SW_SHOW);
  except

    //showMessage('Erro: Mapa da Mesoregião selecionada não encontrado')
  end;
end;

end.
