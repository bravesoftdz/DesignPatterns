unit Adapter.Classes.Adaptee;

// The Adaptee contains some useful behavior, but its interface is
// incompatible with the existing client code. The Adaptee needs some
// adaptation before the client code can use it.

// O Adaptee cont�m alguns comportamentos �teis, mas sua interface �
// incompat�vel com o c�digo do cliente existente. O Adaptee precisa de alguma
// adapta��o antes que o c�digo do cliente possa us�-lo.

interface

type
  TAdaptee = class
  public
    function GetSpecificRequest: string;
  end;

implementation

{ TAdaptee }

function TAdaptee.GetSpecificRequest: string;
begin
  Result := 'Specific request.';
end;

end.
