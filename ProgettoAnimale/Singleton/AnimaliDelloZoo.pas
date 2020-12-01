unit AnimaliDelloZoo;

interface

uses
  System.Generics.Collections, {TArray}
  System.Generics.Defaults,
  Animale;

type
  { TAnimaliDelloZoo }
  TAnimaliDelloZoo = class
  strict private
    FAnimaliZoo: TList<TAnimale>;

  private
    class Var FInstance: TAnimaliDelloZoo;
    class constructor ClassCreate;
    class destructor ClassDestroy;

    { Internal }
  protected

  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    procedure Clear;

    procedure Add(const AAnimale: TAnimale);
    procedure Remove(const AAnimale: TAnimale);
    function PrintAll(): String;

    property AnimaliZoo: TList<TAnimale> read FAnimaliZoo write FAnimaliZoo;
    class property Instance: TAnimaliDelloZoo read FInstance;

  end;

implementation

{ TAnimaliDelloZoo }
class constructor TAnimaliDelloZoo.ClassCreate;
begin
  FInstance := TAnimaliDelloZoo.Create;
end;

class destructor TAnimaliDelloZoo.ClassDestroy;
begin
  FInstance.Free;
end;

constructor TAnimaliDelloZoo.Create;
begin
  inherited Create;
  FAnimaliZoo := TObjectList<TAnimale>.Create(true);
end;

destructor TAnimaliDelloZoo.Destroy();
begin
  FAnimaliZoo.Free;
  inherited Destroy;
end;

procedure TAnimaliDelloZoo.Clear;
begin
  FAnimaliZoo.Clear;
end;

procedure TAnimaliDelloZoo.Add(const AAnimale: TAnimale);
begin
  FAnimaliZoo.Add(AAnimale);
end;

procedure TAnimaliDelloZoo.Remove(const AAnimale: TAnimale);
begin
  FAnimaliZoo.Remove(AAnimale);
end;

function TAnimaliDelloZoo.PrintAll: String;
var
  LItem: TAnimale;
  LElencoAnimali: String;
begin
  LElencoAnimali := '';
  for LItem in FInstance.FAnimaliZoo do
    begin
      LElencoAnimali := LElencoAnimali + LItem.Tipo + '-';
    end;
  delete(LElencoAnimali, length(LElencoAnimali), 1);
  Result := LElencoAnimali;
end;

end.
