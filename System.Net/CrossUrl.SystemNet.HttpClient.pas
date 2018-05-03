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
    function Get(const AURL: string): IcuHttpResponse;
    destructor Destroy; override;
    function Post(const AURL: string; const ASource: IcuMultipartFormData):
      IcuHttpResponse;
  end;

implementation

uses
  CrossUrl.SystemNet.HttpResponse,
  CrossUrl.SystemNet.MultipartFormData;

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

function TcuHttpClientSysNet.Get(const AUrl: string): IcuHttpResponse;
begin
  Result := TcuHttpResponce.Create(FHttpClient.Get(AUrl));
end;

function TcuHttpClientSysNet.Post(const AURL: string; const ASource:
  IcuMultipartFormData): IcuHttpResponse;
begin
  Result := TcuHttpResponce.Create(FHttpClient.Post(AURL, (ASource as
    TcuMultipartFormDataSysNet).GetCore));
end;

end.

