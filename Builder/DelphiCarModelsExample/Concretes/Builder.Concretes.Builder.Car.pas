unit Builder.Concretes.Builder.Car;

interface

uses
  Builder.Interfaces.IBuilder, Builder.Interfaces.IEngine,
  Builder.Interfaces.IGPS, Builder.Interfaces.ITripComputer;

// The Concrete Builder classes follow the Builder interface and provide
// specific implementations of the building steps. Your program may have
// several variations of Builders, implemented differently.

// A classe concreta do Builder segue as assinaturas na Interface e prov�
// implementa��es especificas dos passos de cria��o.
// Seu software pode ter diferentes varia��es de Builders, implementados de forma diferente.

type
  TCar = class(TInterfacedObject, IBuilder)
  private
    FEngine: IEngine;
    FGPS: IGPS;
    FSeats: Integer;
    FTripComputer: ITripComputer;
    FEntityName: string;
  public
    function GetDescription: string;

    // Concrete Builders are supposed to provide their own methods for
    // retrieving results. That's because various types of builders may
    // create entirely different products that don't follow the same
    // interface. Therefore, such methods cannot be declared in the base
    // Builder interface (at least in a statically typed programming
    // language).
    //
    // Usually, after returning the end result to the client, a builder
    // instance is expected to be ready to start producing another product.
    // That's why it's a usual practice to call the reset method at the end
    // of the `GetProduct` method body. However, this behavior is not
    // mandatory, and you can make your builders wait for an explicit reset
    // call from the client code before disposing of the previous result.


    //Builders concretos disponibilizam seus m�todos para se recuperar um produto como resultado.
    //Isto porque v�rios tipos de builders podem criar produtos totalmente diferentes que n�o seguem
    //a mesma interface. Portanto, esses m�todos n�o podem ser declarados na mesma Interface base
    // (a n�o ser que voc� n�o esteja em uma linguagem de programa��o fortemente tipada).

    //Geralmente, depois de retornar o resultado para o Client, uma instancia de Builder
    //deve estar pronta para come�ar o processo de produ��o de um novo produto.
    //Isso � o porque de geralmente chamar o metodo Reset(New) em seguida de um GetResult (GetProduct)
    //De qualquer forma este comportamento n�o � obrigat�rio e voc� pode fazer limpar o seu Builder da m�moria
    //instanciando um novo objeto explicitamente

    function GetResult: IBuilder;

    // All production steps work with the same product instance.
    // Todos passos de produ��o funcionam com a mesma instancia de produto
    function SetSeats(ANumberOfSeats: Integer): IBuilder;
    function SetEngine(AEngine: IEngine): IBuilder;
    function SetTripComputer(ATripComputer: ITripComputer): IBuilder;
    function SetGPS(AGPS: IGPS): IBuilder;
    function SetEntityName(Const AValue: string): IBuilder;

    // A fresh builder instance should contain a blank product object, which
    // is used in further assembly.

    // Um nova instancia deve conter um produto limpo, que em seguida
    // ser� usado para uma nova montagem de produto
    class function New: TCar;
  end;

implementation

uses
  Builder.ProductParts.GPS, Builder.ProductParts.TripComputer, System.Classes,
  System.SysUtils;

{ TCar }

function TCar.GetDescription: string;
var
  oList: TStringList;
begin
  oList := TStringList.Create;
  try
    oList.Add('Modelo do carro: ' + FEntityName);

    oList.Add('');

    oList.Add('  N�mero de Acentos: ' + FSeats.ToString);

    if Assigned(FEngine) then
      oList.Add('  Pot�ncia Motor: ' + FEngine.GetPotency)
    else
      oList.Add('  Pot�ncia Motor: N�o Informado');

    if Assigned(FGPS) then
      oList.Add('  Modelo GPS: ' + FGPS.GetModel)
    else
      oList.Add('  Modelo GPS: N�o Informado');

    if Assigned(FTripComputer) then
      oList.Add('  Computador de bordo: ' + FTripComputer.GetModel)
    else
      oList.Add('  Computador de bordo: N�o Informado');

    Result := oList.Text;
  finally
    FreeAndNil(oList);
  end;
end;

function TCar.GetResult: IBuilder;
begin
  Result := Self;
end;

class function TCar.New: TCar;
begin
  Result := Self.Create;
end;

function TCar.SetSeats(ANumberOfSeats: Integer): IBuilder;
begin
  Result := Self;
  FSeats := ANumberOfSeats;
end;

function TCar.SetEngine(AEngine: IEngine): IBuilder;
begin
  Result := Self;
  FEngine := AEngine;
end;

function TCar.SetEntityName(const AValue: string): IBuilder;
begin
  Result := Self;
  FEntityName := AValue;
end;

function TCar.SetGPS(AGPS: IGPS): IBuilder;
begin
  Result := Self;
  FGPS := AGPS
end;

function TCar.SetTripComputer(ATripComputer: ITripComputer): IBuilder;
begin
  Result := Self;
  FTripComputer := ATripComputer;
end;

end.
