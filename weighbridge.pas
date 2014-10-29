unit weighbridge;

{$mode objfpc}

interface

uses
  Globals, Classes, SysUtils, synaser, strutils;

var
  RSerial: TBlockSerial;

  function ReadWeighBridge:  string;



implementation

function ReadWeighBridge: string;
var
  sWeighreading: string;
  sParity: char;
  iBauds, iBitsData, iBitsStop: integer;
  bSoftFlow, bHardFlow: boolean;

begin
  iBauds:= StrToInt(ConfigData[dcBauds]);
  iBitsData:= StrToInt(ConfigData[dcDataBit]);
  iBitsStop:= StrToInt(ConfigData[dcBitStop]);
  bSoftFlow:= False;
  bHardFlow:= False;


  case ConfigData[dcParity][1] of
    'P': sParity:= 'E';
    'I': sParity:= 'O';
    'N': sParity:= 'N';
    'M': sParity:= 'M';
    'E': sParity:= 'S';
  end;
  case ConfigData[dcControl][1] of
    'H': bHardFlow:= True;
    'X': bSoftFlow:= True;
  end;

  RSerial:=TBlockserial.Create;

  try
    RSerial.RaiseExcept:=false;
    RSerial.Connect(ConfigData[dcPortCom]);
    RSerial.Config(iBauds,iBitsData,sParity,iBitsStop,bSoftFlow,bHardFlow);
    RSerial.ConvertLineEnd:= True;
    RSerial.SendString('$');
//    Sleep(1000);
    sWeighreading:= RSerial.Recvstring(1000);
  finally
    result:= 'No Data';
    RSerial.ExceptCheck;
    RSerial.Free;
  end;
  result:= MidStr(sWeighreading,
                      LastDelimiter(' ',sWeighreading),
                      Length(sWeighreading)-LastDelimiter(' ',sWeighreading)+1);
end;


end.

