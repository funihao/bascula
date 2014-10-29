unit globals;

{$mode objfpc}

interface

uses
  Classes, SysUtils;

const
  dcPortCom  = 0;
  dcBauds    = 1;
  dcDataBit  = 2;
  dcParity   = 3;
  dcBitStop  = 4;
  dcControl  = 5;
  dcDataFile = 6;
  dcPrinter  = 7;

var
  ConfigData: TStringList;

implementation

end.

