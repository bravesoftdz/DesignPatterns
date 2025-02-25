unit FactoryMethod.Creators.ConcreteCreator1;

interface

uses
  FactoryMethod.Creators.Creator, FactoryMethod.Interfaces.IProduct,
  FactoryMethod.Interfaces.IConcreteCreator;

// Concrete Creators override the factory method in order to change the
// resulting product's type.

// Creators concretos subescrevem o factory method em ordem de modificar o tipo do produto resultante

type
  TConcreteCreator1 = class(TCreator, IConcreteCreator)
  public
    // Note that the signature of the method still uses the abstract product
    // type, even though the concrete product is actually returned from the
    // method. This way the Creator can stay independent of concrete product
    // classes.

    // Note que a assinatura do m�todo permanece usando o tipo de produto abstrato, mesmo que o retorno do
    // m�todo � na verdade um produto concreto.
    // Desta forma o Creator pode permanecer independente das classes concretas do produto.
    function FactoryMethod: IProduct; override;
    class function New : TConcreteCreator1;
  end;

implementation

uses
  FactoryMethod.Concretes.ConcreteProduct1;

{ TConcreteCreator1 }

function TConcreteCreator1.FactoryMethod: IProduct;
begin
  Result := TConcreteProduct1.Create;
end;

class function TConcreteCreator1.New: TConcreteCreator1;
begin
  Result := Self.Create;
end;

end.
