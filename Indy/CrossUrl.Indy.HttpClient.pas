unit CrossUrl.Indy.HttpClient;

interface

uses
  CrossUrl.HttpClient,
  System.Classes,
  IdHTTP;

type
  TcuHttpClientIndy = class(TComponent, IcuHttpClient)
  private
    FHttpClient: TIdHTTP;
  public
    constructor Create(AOwner: TComponent); override;
    function Get(const AURL: string): IcuHttpResponse;
    destructor Destroy; override;
    function Post(const AURL: string; const ASource: IcuMultipartFormData):
      IcuHttpResponse;
  end;

implementation

uses
  CrossUrl.Indy.HttpResponse,
  CrossUrl.Indy.MultipartFormData;
{ TcuHttpClient }

constructor TcuHttpClientIndy.Create(AOwner: TComponent);
begin
  inherited;
  FHttpClient := TIdHTTP.Create(AOwner);
  FHttpClient.HandleRedirects := True;
  FHttpClient.Request.UserAgent := '';
end;

destructor TcuHttpClientIndy.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

function TcuHttpClientIndy.Get(const AUrl: string): IcuHttpResponse;
begin
  FHttpClient.Get(AUrl);
  Result := TcuHttpResponce.Create(FHttpClient.Response);

end;

function TcuHttpClientIndy.Post(const AURL: string; const ASource:
  IcuMultipartFormData): IcuHttpResponse;
begin
  FHttpClient.Post(AURL, (ASource as TcuMultipartFormDataIndy).GetCore);
  Result := TcuHttpResponce.Create(FHttpClient.Response);
end;

end.

