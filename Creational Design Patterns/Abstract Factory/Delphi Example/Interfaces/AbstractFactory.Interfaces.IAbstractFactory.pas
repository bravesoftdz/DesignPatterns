unit AbstractFactory.Interfaces.IAbstractFactory;

interface

uses
  AbstractFactory.Interfaces.IAbstractProductA,
  AbstractFactory.Interfaces.IAbstractProductB;

// The Abstract Factory interface declares a set of methods that return
// different abstract products. These products are called a family and are
// related by a high-level theme or concept. Products of one family are
// usually able to collaborate among themselves. A family of products may
// have several variants, but the products of one variant are incompatible
// with products of another.

// A interface Abstract Factory declara um conjunto de m�todos que retorna diferentes
// tipos de produtos abstratos.
// Estes produtos s�o chamados de familia e s�o relacionados em uma camada superior
// Produtos da mesma familia s�o frequentemente capazes de colaborar entre si.
// Uma familia de produtos pode ter muitas varia��es, mas os produtos de uma varia��o � incompativel
// com os produtos de uma outra.

type
  IAbstractFactory = interface
    ['{54F6B347-C70C-40DC-B3D5-37E49C2A4095}']
    function CreateProductA: IAbstractProductA;
    function CreateProductB: IAbstractProductB;
  end;

implementation

end.
