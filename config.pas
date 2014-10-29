unit config;

{$mode objfpc}

interface

uses
  Globals, Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ComCtrls, StdCtrls, Buttons, PrintersDlgs, Printers, EditBtn,
  ExtCtrls, synaser;

type

  { TConfigForm }

  TConfigForm = class(TForm)
    BOk: TBitBtn;
    BCancel: TBitBtn;
    CBDataBit: TComboBox;
    CBBitStop: TComboBox;
    CBControl: TComboBox;
    CBParity: TComboBox;
    CBPort: TComboBox;
    CBBauds: TComboBox;
    EBdbf: TEditButton;
    EBPrinter: TEditButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ODField: TOpenDialog;
    PSDlg: TPrinterSetupDialog;
    procedure BCancelClick(Sender: TObject);
    procedure BOkClick(Sender: TObject);
    procedure EBdbfButtonClick(Sender: TObject);
    procedure EBPrinterButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  ConfigForm: TConfigForm;
  DataBaseName : String;

implementation

{ TConfigForm }


procedure TConfigForm.EBdbfButtonClick(Sender: TObject);
begin
  With ODField  do
    if Execute then
      DataBaseName:= FileName;
  EBdbf.Text:= DataBaseName;
end;

procedure TConfigForm.EBPrinterButtonClick(Sender: TObject);
begin
  if PSDlg.Execute then
    With Printer do
      EBPrinter.Text:= Printers[PrinterIndex];
end;

procedure TConfigForm.FormCreate(Sender: TObject);
var
  TSPortsComm: TStrings;
begin
  TSPortsComm:= TStringList.Create;
  TSPortsComm.Delimiter:= ',';
  TSPortsComm.DelimitedText:= GetSerialPortNames;
  CBPort.Items:= TSPortsComm;
  with CBPort do ItemIndex:= Items.IndexOf(ConfigData[dcPortCom]);
  with CBBauds do ItemIndex:= Items.IndexOf(ConfigData[dcBauds]);
  with CBDataBit do ItemIndex:= Items.IndexOf(ConfigData[dcDataBit]);
  with CBParity do ItemIndex:= Items.IndexOf(ConfigData[dcParity]);
  with CBBitStop do ItemIndex:= Items.IndexOf(ConfigData[dcBitStop]);
  with CBControl do ItemIndex:= Items.IndexOf(ConfigData[dcControl]);
  EBdbf.Text:= ConfigData[dcDataFile];
  EBPrinter.Text:= ConfigData[dcPrinter];
end;

procedure TConfigForm.FormShow(Sender: TObject);
begin
end;

procedure TConfigForm.BOkClick(Sender: TObject);
begin
  ConfigData[dcPortCom]:= CBPort.Text;
  ConfigData[dcBauds]:= CBBauds.Text;
  ConfigData[dcDataBit]:= CBDataBit.Text;
  ConfigData[dcParity]:= CBParity.Text;
  ConfigData[dcBitStop]:= CBBitStop.Text;
  ConfigData[dcControl]:= CBControl.Text;
  ConfigData[dcDataFile]:= EBdbf.Text;
  ConfigData[dcPrinter]:= EBPrinter.Text;
  ConfigData.SaveToFile('config.ini');
  Close;
end;

procedure TConfigForm.BCancelClick(Sender: TObject);
begin
  FormCreate(Sender);
  Close;
end;

initialization
  {$I config.lrs}

end.

