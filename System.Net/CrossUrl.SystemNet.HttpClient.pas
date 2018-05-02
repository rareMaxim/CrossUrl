unit CrossUrl.SystemNet.HttpClient;

interface

uses
  CrossUrl.HttpClient,
  System.Classes,
  System.Net.HttpClient;

type
  TcuHttpClientSysNet = class(TComponent, IcuHttpClient)
  private
    FHttpClient: THTTPClient;
  public
    constructor Create(AOwner: TComponent); override;
    function Get(const AUrl: string): IcuHttpResponce;
    destructor Destroy; override;
  end;

implementation

uses
  CrossUrl.SystemNet.HttpResponse;

{ TcuHttpClient }

constructor TcuHttpClientSysNet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHttpClient := THTTPClient.Create;
end;

destructor TcuHttpClientSysNet.Destroy;
begin
  FHttpClient.Free;
  inherited Destroy;
end;

function TcuHttpClientSysNet.Get(const AUrl: string): IcuHttpResponce;
begin
  Result := TcuHttpResponce.Create(FHttpClient.Get(AUrl));
end;

end.

