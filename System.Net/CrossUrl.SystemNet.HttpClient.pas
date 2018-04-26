unit CrossUrl.SystemNet.HttpClient;

interface

uses
  CrossUrl.HttpClient,
  System.Classes,
  System.Net.HttpClient;

type
  TcuHttpClient = class(TInterfacedObject, IcuHttpClient)
  private
    FHttpClient: THTTPClient;
  public
    constructor Create(AOwner: TComponent); override;
    function Get(const AUrl: string): IcuHttpResponce;
    destructor Destroy; override;
  end;

implementation

{ TcuHttpClient }

constructor TcuHttpClient.Create(AOwner: TComponent);
begin
  inherited Create;
  FHttpClient := THTTPClient.Create;
end;

destructor TcuHttpClient.Destroy;
begin
  FHttpClient.Free;
  inherited Destroy;
end;

function TcuHttpClient.Get(const AUrl: string): IcuHttpResponce;
begin
     FHttpClient.Get(AUrl)
end;

end.

