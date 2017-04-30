{$mode objfpc}{$H+}

uses
    Sysutils, Math, character, regexpr;

var
  RegexObj: TRegExpr;


    
begin

    
    RegexObj := TRegExpr.Create;
    RegexObj.Expression := '[+]';
    WriteLn( RegexObj.Exec('9+5') );
    RegexObj.Free;

end.