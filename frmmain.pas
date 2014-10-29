{
 ***************************************************************************
 *                                                                         *
 *   This source is free software; you can redistribute it and/or modify   *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This code is distributed in the hope that it will be useful, but      *
 *   WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU     *
 *   General Public License for more details.                              *
 *                                                                         *
 *   A copy of the GNU General Public License is available on the World    *
 *   Wide Web at <http://www.gnu.org/copyleft/gpl.html>. You can also      *
 *   obtain it by writing to the Free Software Foundation,                 *
 *   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.        *
 *                                                                         *
 ***************************************************************************

procedure TMainForm.DSAddressStateChange(Sender: TObject);
var
  Estado: string;
begin
  case DBA.State of
    dsBlockRead   :Estado:= 'dsBlockRead';
    dsBrowse      :Estado:= 'dsBrowse';
    dsCalcFields  :Estado:= 'dsCalcFields';
    dsCurValue    :Estado:= 'dsCurValue';
    dsEdit        :Estado:= 'dsEdit';
    dsFilter      :Estado:= 'dsFilter';
    dsInactive    :Estado:= 'dsInactive';
    dsInsert      :Estado:= 'dsInsert';
    dsInternalCalc:Estado:= 'dsInternalCalc';
    dsNewValue    :Estado:= 'dsNewValue';
    dsOldValue    :Estado:= 'dsOldValue';
    dsOpening     :Estado:= 'dsOpening';
    dsSetKey      :Estado:= 'dsSetKey';
  end;
  ShowMessage('El estado ha cambiado a: ' + Estado);
end;
 }


unit frmmain;

{$mode objfpc}

interface

uses
  Translations,
  LCLType, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Dbf, Grids, DBGrids, DBCtrls, ExtCtrls, ActnList, Menus,
  StdCtrls,lresources, PrintersDlgs, Printers, Buttons,
  Globals, About, Config, weighbridge;

type
  TDataSetFirst = TAction;
  TDataSetPrior = TAction;
  TDataSetNext = TAction;
  TDataSetLast = TAction;
  TDataSetInsert = TAction;
  TDataSetDelete = TAction;
  TDataSetEdit = TAction;
  TDataSetPost = TAction;
  TDataSetCancel = TAction;
  TDataSetRefresh = TAction;

  { TMainForm }

  TMainForm = class(TForm)
    APrint: TAction;
    BPrint: TBitBtn;
    BNew: TBitBtn;
    E_HSalida: TDBEdit;
    LPeso: TLabel;
    LEHSalida: TLabel;
    MIConfig: TMenuItem;
    MIAbout: TMenuItem;
    MIPrint: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    N3: TMenuItem;
    MIPrintSetup: TMenuItem;
    MIPrintSub: TMenuItem;
    MMain: TMainMenu;
    MFile: TMenuItem;
    ALMain: TActionList;
    ANew: TAction;
    AOpen: TAction;
    AClose: TAction;
    AQuit: TAction;
    MINew: TMenuItem;
    MIOpen: TMenuItem;
    PageSetupDialog1: TPageSetupDialog;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PTop: TPanel;
    DBNavigator1: TDBNavigator;
    GDBA: TDBGrid;
    PBottom: TPanel;
    DBA: TDbf;
    SDDBA: TSaveDialog;
    ODDBA: TOpenDialog;
    DSAddress: TDataSource;
    E_Cli: TDBEdit;
    EMatricula: TDBEdit;
    ECode: TDBEdit;
    EZip: TDBEdit;
    E_HEntrada: TDBEdit;
    EFecha: TDBEdit;
    E_PEntrada: TDBEdit;
    E_PSalida: TDBEdit;
    E_PNeto: TDBEdit;
    EArticulo: TDBEdit;
    ETown: TDBEdit;
    LE_Cli: TLabel;
    LEMatricula: TLabel;
    LEStreet: TLabel;
    LEZip: TLabel;
    LETown: TLabel;
    LE_PEntrada: TLabel;
    LEHEntrada: TLabel;
    LE_PSalida: TLabel;
    LE_PNeto: TLabel;
    LEArticulo: TLabel;
    LEFecha: TLabel;
    MIClose: TMenuItem;
    N1: TMenuItem;
    MIQuit: TMenuItem;
    AFirst: TDataSetFirst;
    APrior: TDataSetPrior;
    ANext: TDataSetNext;
    ALast: TDataSetLast;
    AInsert: TDataSetInsert;
    ADelete: TDataSetDelete;
    AEdit: TDataSetEdit;
    APost: TDataSetPost;
    ACancel: TDataSetCancel;
    ARefresh: TDataSetRefresh;
    Record1: TMenuItem;
    MIFirst: TMenuItem;
    MILAst: TMenuItem;
    MIPrior: TMenuItem;
    MINext: TMenuItem;
    N2: TMenuItem;
    MIEdit: TMenuItem;
    MIDelete: TMenuItem;
    MIPost: TMenuItem;
    MICancel: TMenuItem;
    MIRefresh: TMenuItem;
    MIInsert: TMenuItem;
    procedure ANewExecute(Sender: TObject);
    procedure AOpenExecute(Sender: TObject);
    procedure ACloseExecute(Sender: TObject);
    procedure ACloseUpdate(Sender: TObject);
    procedure APrintExecute(Sender: TObject);
    procedure AQuitExecute(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure BNewClick(Sender: TObject);
    procedure DataOpen(Sender: TObject);
    procedure DBAAfterInsert(DataSet: TDataSet);
    procedure DoDataAction(Sender: TObject);
    procedure EFechaExit(Sender: TObject);
    procedure EMatriculaKeyPress(Sender: TObject; var Key: char);
    procedure E_HEntradaExit(Sender: TObject);
    procedure E_PEntradaExit(Sender: TObject);
    procedure E_PSalidaExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GDBADrawColumnCell(Sender: TObject; const Rect: TRect;
                                 DataCol: Integer; Column: TColumn;
                                 State: TGridDrawState);
    procedure GDBATitleClick(Column: TColumn);
    procedure HaveDataNotEmpty(Sender: TObject);
    procedure InEditMode(Sender: TObject);
    procedure MIAboutClick(Sender: TObject);
    procedure MIConfigClick(Sender: TObject);
//    procedure MIPrintClick(Sender: TObject);
//    procedure N1Click(Sender: TObject);
//    procedure PBottomClick(Sender: TObject);
  private
    procedure CreateTable(AFileName : String);
    procedure OpenTable(AFileName: String);
    procedure CloseTable;
    function  CanExecute: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;


var
  MainForm: TMainForm;

implementation


resourcestring
  rsSaveData = 'Hay datos sin guardar. ¿Guardar ahora?';
  rsMatricula = 'Matrícula';
  rsTitlePrint = 'Revise la Información';
  rsInfoPrint = 'El vehículo se encuentra en transito.'+sLineBreak+
                'No ha introducido peso de salida.'+sLineBreak+
                '¿Desea imprimir el ticket?';
  rsNotAllowed = 'Operación no permitida';
  rsInfoWeightIn ='El peso de entrada debe ser un '+sLineBreak+
                  'valor positivo y mayor que cero.';


{ Action  handlers }

procedure TMainForm.ANewExecute(Sender: TObject);
begin
  With SDDBA do
    If Execute then
      CreateTable(FileName);
end;

procedure TMainForm.ACloseExecute(Sender: TObject);
begin
  CloseTable;
end;

function TMainForm.CanExecute: Boolean;
begin
 result:= true;
  if (DBA.State in dsEditModes) then
    case MessageDlg(rsSaveData,mtWarning,[mbYes,mbNo,mbCancel],0) of
      mrYes   : DBA.Post;
      mrNo    : DBA.Cancel;
      mRCancel: result:= false;
    end;
end;

procedure TMainForm.ACloseUpdate(Sender: TObject);
begin
  (Sender as Taction).Enabled:=Not (DBA.State in dsEditModes);
end;

procedure TMainForm.APrintExecute(Sender: TObject);
begin
  BPrintClick(Sender)
end;

procedure TMainForm.CreateTable(AFileName : String);
begin
  With DBA do
    begin
    Close;
    with FieldDefs do
      begin
      Clear;
      Add(rsMatricula, ftString, 30);
      Add('Fecha',ftDate,10);
      Add('HEntrada',ftString,10);
      Add('HSalida',ftString,10);
      Add('PEntrada',ftInteger,8);
      Add('PSalida',ftInteger,8);
      Add('PNeto',ftInteger,8);
      Add('CodigoP',ftString,6);
      Add('Articulo',ftString,30);
      Add('Cliente',ftString,30);
      Add('CP',ftString,5);
      Add('Provincia',ftString,30);
      end;
    TableLevel:= 25;
    TableName:=AFileName;
    CreateTable;
    Exclusive := true;
    Open;
    AddIndex('Fecha', 'Dtos(Fecha)', [ixExpression, ixDescending]);
    AddIndex('Matricula', 'Matricula', []);
    end;
end;

procedure TMainForm.AOpenExecute(Sender: TObject);
begin
  With ODDBA  do
    if Execute then
      OpenTable(FileName);
end;

procedure TMainForm.OpenTable(AFileName : String);
begin
  With DBA do
    begin
    Close;
    TableName:=AFileName;
    Open;
    AddIndex('Fecha', 'Dtos(Fecha)', [ixExpression, ixDescending]);
    AddIndex('Matricula', 'Matricula', []);
    RegenerateIndexes;
    end;
end;

procedure TMainForm.CloseTable;
begin
  DBA.Close;
end;

procedure TMainForm.AQuitExecute(Sender: TObject);
begin
  Close;
end;

{Procedimiento para imprimir un tickect
 --------------------------------------
 Pensado para un ancho de papel 'A5', y fuente 'Fixedsys'
 Con la siguiente cabecera......

 Bodegas N. S. del Romero, SCoop.
 CIF.: F31022007
 Carretera Tarazona Km 33                                   COMPROBANTE PESADA
 Tfno.: 948 851 411                                        Fecha / Hora Salida
 Centro: CASCANTE
 MATRICULA:              CLI/PROV:
 -----------------------------------------------------------------------------
 CODIGO    ARTICULO                             P. ENTRADA  P. SALIDA  P. NETO
 -----------------------------------------------------------------------------
 }
procedure TMainForm.BPrintClick(Sender: TObject);
const
  ciLEFTMARGIN = 100;
  ciRIGHTMARGIN = 100;
  csCOMPANY = 'Bodegas N. S. del Romero, SCoop.';
  csADRESS = 'Carretera Tarazona Km 33';
  csTLF = 'Tfno.: 948 851 411';
  csCIF = 'CIF.: F31022007';
  csCENTRO = 'Centro: CASCANTE';
  csTIPOTICKET = 'COMPROBANTE PESADA';
  ciXPOSART = 500;
  ciXPOSENTRADA = 1800;
  ciXPOSSALIDA = 2400;
  ciPAGEWIDTH = 3480;
var
  iYPos, iLineHeight, iLineWidth, iVerticalMargin: Integer;
  sSubLine, sLineString: String;
  iRaya, iPageWidth, iPosArt, iPosEntrada,
                  iPosSalida, iLeftMargin, iRightMargin: Integer;
begin
  if not (CanExecute) then exit;
  if E_PNeto.Text='' then
    case MessageDlg(rsTitlePrint, rsInfoPrint, mtWarning,[mbYes,mbNo],0) of
      mrNo: exit;
    end;
  with Printer do
  try
    SetPrinter(ConfigData[dcPrinter]);
    iPageWidth:= Round(ciPageWidth*XDPI/600);
    iLeftMargin:= Round(ciLeftMargin*XDPI/600);
    iRightMargin:= Round(ciRightMargin*XDPI/600);
    iPosArt:= Round(ciXPosArt*XDPI/600);
    iPosEntrada:= Round(ciXPosEntrada*XDPI/600);
    iPosSalida:= Round(ciXPosSalida*XDPI/600);
    E_Cli.Text:='Ancho:' + IntToStr(PageWidth);

    E_Cli.Text:= E_Cli.Text + ' '+ PaperSize.PaperName + '  ';
    E_Cli.Text:=E_Cli.Text + IntToStr(XDPI) + '/' + IntToStr(YDPI);
    BeginDoc;
    Canvas.Font.Name := 'Fixedsys';
    Canvas.Font.Size := 16;
    Canvas.Font.Color := clBlack;
    Canvas.Font.Bold:= True;
    iLineHeight := Round(1.2 * Abs(Canvas.TextHeight('I')));
    iVerticalMargin := 2 * iLineHeight;
    // There we go
    iYPos := iVerticalMargin;
    Canvas.TextOut(iLeftMargin, iYPos, csCOMPANY);
    iYPos := iYPos + iLineHeight;
    Canvas.Font.Size := 10;
    Canvas.Font.Bold:= False;
    Canvas.TextOut(iLeftMargin, iYPos, csCIF);
    iLineHeight := Round(1.2 * Abs(Canvas.TextHeight('I')));
    iYPos := iYPos + iLineHeight;
    Canvas.TextOut(iLeftMargin, iYPos, csADRESS);
    sLineString := csTIPOTICKET;
    iLineWidth := Abs(Canvas.TextWidth(sLineString));
    Canvas.TextOut(iPageWidth - iLineWidth - iRightMargin, iYPos, sLineString);
    iYPos := iYPos + iLineHeight;
    Canvas.TextOut(iLeftMargin, iYPos, csTLF);
    sLineString := EFecha.Text +'  '+ E_HEntrada.Text;
    iLineWidth := Abs(Canvas.TextWidth(sLineString));
    Canvas.TextOut(iPageWidth - iLineWidth - iRightMargin, iYPos, sLineString);
    iYPos := iYPos + iLineHeight;
    Canvas.TextOut(iLeftMargin, iYPos, csCENTRO);
    sLineString := 'MATRICULA: ' + EMatricula.Text;
    sLineString := sLineString + '       CLI/PROV: ' + E_Cli.Text + ' / ' + ETown.Text;
    iYPos := iYPos + iLineHeight;
    Canvas.TextOut(iLeftMargin, iYPos, sLineString);
    iYPos := iYPos + 2 * iLineHeight;
    iRaya := Round((iPageWidth-iLeftMargin-iRightMargin)/Canvas.TextWidth('-'));
    sSubLine := StringOfChar('-', iRaya);
    Canvas.TextOut(iLeftMargin, iYPos, sSubLine);
    iYPos := iYPos + iLineHeight;
    Canvas.TextOut(iLeftMargin, iYPos, 'CODIGO');
    Canvas.TextOut(iPosArt, iYPos, 'ARTICULO');
    Canvas.TextOut(iPosEntrada, iYPos, 'P. ENT.');
    Canvas.TextOut(iPosSalida, iYPos, 'P. SAL.');
    sLineString:= 'P. NETO';
    iLineWidth := Abs(Canvas.TextWidth(sLineString));
    Canvas.TextOut(iPageWidth - iLineWidth - iRightMargin, iYPos, sLineString);
    iYPos := iYPos + iLineHeight;
    Canvas.TextOut(iLeftMargin, iYPos, sSubLine);
    iYPos := iYPos + iLineHeight;
    sLineString := ECode.Text;
    Canvas.TextOut(iLeftMargin, iYPos, sLineString);
    sLineString := EArticulo.Text;
    Canvas.TextOut(iPosArt, iYPos, sLineString);
    sLineString := FormatFloat('#,##0', StrToFloatDef(E_PEntrada.Text,0));
    iLineWidth:= Abs(Canvas.TextWidth(sLineString)) -
                 Abs(Canvas.TextWidth('P. ENT.'));
    Canvas.TextOut(iPosEntrada - iLineWidth, iYPos, sLineString);
    sLineString := FormatFloat('#,##0', StrToFloatDef(E_PSAlida.Text,0));
    iLineWidth:= Abs(Canvas.TextWidth(sLineString)) -
                 Abs(Canvas.TextWidth('P. SAL.'));
    Canvas.TextOut(iPosSalida - iLineWidth, iYPos, sLineString);
    sLineString := FormatFloat('#,##0', StrToFloatDef(E_PNeto.Text,0));
    iLineWidth := Abs(Canvas.TextWidth(sLineString));
    Canvas.TextOut(iPageWidth - iLineWidth - iRightMargin, iYPos, sLineString);
  finally
    EndDoc;
  end;
end;

procedure TMainForm.BNewClick(Sender: TObject);
begin
  if not (CanExecute) then exit;
  DBA.First;
  DBA.Insert;
end;

procedure TMainForm.DataOpen(Sender: TObject);
begin
  With DBA do
    (Sender as Taction).Enabled:=Active;
end;

procedure TMainForm.DoDataAction(Sender: TObject);
begin
  Case (Sender as TAction).Tag of
    0 : DBA.First;
    1 : DBA.Prior;
    2 : DBA.Next;
    3 : DBA.Last;
    4 : DBA.Insert;
    5 : DBA.Delete;
    6 : DBA.Edit;
    7 : DBA.Post;
    8 : DBA.Cancel;
    9 : DBA.Refresh;
  end;
end;

procedure TMainForm.E_PEntradaExit(Sender: TObject);
begin
  if (E_PEntrada.Text = '') or (StrToInt(E_PEntrada.Text) < 0)  then
      begin
        MessageDlg(rsNotAllowed, rsInfoWeightIn, mtWarning,[mbOk],0);
        E_PEntrada.SetFocus;
      end
  else if StrToInt(E_PEntrada.Text) > 0 then
    E_HEntrada.Text:= TimeToStr(Time);
end;

procedure TMainForm.EFechaExit(Sender: TObject);
begin
    if EFecha.Text = '' then
    EFecha.Text:= DateToStr(Date);
end;

procedure TMainForm.E_HEntradaExit(Sender: TObject);
begin
  if E_HEntrada.Text = '' then
    E_HEntrada.Text:= TimeToStr(Time);
end;


procedure TMainForm.E_PSalidaExit(Sender: TObject);
begin
  if E_PSalida.Text = '' then
    begin
      E_PNeto.Text:= '';
    end
  else begin
    if StrToInt(E_PSalida.Text) > 0 then
    begin
      if StrToInt(E_PEntrada.Text) > 0 then
       begin
        E_HSalida.Text:= TimeToStr(Time);
        E_PNeto.Text:= IntToStr(abs(
        StrToInt(E_PEntrada.Text)-StrToInt(E_PSalida.Text)));
       end
      else
      begin
        MessageDlg(rsNotAllowed, rsInfoWeightIn, mtWarning,[mbOk],0);
        E_PEntrada.SetFocus;
      end;
    end;
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=Not (DBA.State in dsEditModes);
  if Not CanClose then
    case MessageDlg(rsSaveData,mtWarning,[mbYes,mbNo,mbCancel],0) of
      mrYes : begin
              DBA.Post;
              CanClose:=True;
              end;
      mrNo  : CanClose:=True;
    end;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DBA.Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ConfigData:= TStringList.Create;
  ConfigData.LoadFromFile('config.ini');
  OpenTable(ConfigData[6]);
  LPeso.Caption:= ReadWeighBridge;
  if LPeso.Caption = '' then
   LPeso.Caption:= '0,0';
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
//    VK_RETURN: Showmessage('FormKeyDown ... pulsada tecla ' + IntToHex(key,1));
    VK_ESCAPE: DBA.Cancel;
    VK_F9:
      begin
        if not (DBA.State in dsEditModes) then
         DBA.Edit;
        LPeso.Caption:= ReadWeighBridge;
        if ActiveControl is TDBEdit then
          case TDBEdit(ActiveControl).Tag of
            10: E_PEntrada.Text:= LPeso.Caption;
            20: E_PSalida.Text:= LPeso.Caption;
          end
      end
  else
    //EMatriculaKeyPress(Sender, char(key));
  end;
end;

procedure TMainForm.GDBADrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if DBA.FieldByName('PSalida').AsString='' then
  GDBA.Canvas.Font.Color:=clRed;
  GDBA.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TMainForm.DBAAfterInsert(DataSet: TDataSet);
begin
  EFecha.Text:= DateToStr(Date);
  EMatricula.SetFocus;
end;

procedure TMainForm.GDBATitleClick(Column: TColumn);
begin
  DBA.IndexName:= Column.FieldName;
end;

procedure TMainForm.HaveDataNotEmpty(Sender: TObject);
begin
  With DBA do
    (Sender as Taction).Enabled:=Active and Not (EOF and BOF);
end;

procedure TMainForm.InEditMode(Sender: TObject);
begin
  With DBA do
    (Sender As Taction).EnAbled:=State in dsEditModes;
end;

procedure TMainForm.MIAboutClick(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

procedure TMainForm.MIConfigClick(Sender: TObject);
begin
  ConfigForm.ShowModal;
end;

procedure TMainForm.EMatriculaKeyPress(Sender: TObject; var Key: char);
begin
  Key:= UpCase(Key);
end;

procedure TranslateResStrings;     //del ejemplo editor en lazreport
begin
    TranslateUnitResourceStrings('LCLStrConsts','.\languages\lclstrconsts.%s.po','es','');
end;


initialization
{$i frmmain.lrs}
TranslateResStrings;

end.