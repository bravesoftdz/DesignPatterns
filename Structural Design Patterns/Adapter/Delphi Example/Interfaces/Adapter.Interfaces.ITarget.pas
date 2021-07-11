unit Adapter.Interfaces.ITarget;

interface

// The Target defines the domain-specific interface used by the client code.

// Define a interface espec�fica do dom�nio usado pelo c�digo do cliente.

type
 ITarget = interface
   function GetRequest : string;
 end;

implementation

end.
