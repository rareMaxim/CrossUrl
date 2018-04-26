unit CrossUrl.SystemNet.HttpResponse;

interface

uses
  System.Net.HttpClient,
  CrossUrl.HttpClient;

type
  TcuHttpResponce = class(TInterfacedObject, IcuHttpResponce)
  private
    FHttpResponse: IHTTPResponse;
  public
    constructor Create(AHttpResponse: IHTTPResponse);
  end;

implementation

{ TcuHttpResponce }

constructor TcuHttpResponce.Create(AHttpResponse: IHTTPResponse);
begin
  FHttpResponse := AHttpResponse;
end;

end.

