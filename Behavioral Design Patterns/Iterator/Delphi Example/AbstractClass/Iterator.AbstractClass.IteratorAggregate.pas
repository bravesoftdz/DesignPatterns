unit Iterator.AbstractClass.IteratorAggregate;

interface

type
  TIteratorAggregate = class(TInterfacedObject, IEnumerable)
  public
    // Returns an Iterator or another IteratorAggregate for the implementing object.
    // Retorna um Iterator ou outro IteratorAggregate para o objeto de implementa��o.
    function GetEnumerator: IEnumerator; virtual; abstract;
  end;

implementation

end.
