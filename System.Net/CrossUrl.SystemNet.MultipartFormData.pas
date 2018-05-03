unit CrossUrl.SystemNet.MultipartFormData;

interface

uses
  System.Net.Mime,
  CrossUrl.HttpClient;

type
  TcuMultipartFormDataSysNet = class(TInterfacedObject, IcuMultipartFormData)
  private
    FFormData: TMultipartFormData;
  public
    function GetCore: TMultipartFormData;
    constructor Create;
    procedure AddField(const AField: string; const AValue: string);
    procedure AddFile(const AFieldName: string; const AFilePath: string);
    destructor Destroy; override;
  end;

implementation

{ TcuMultipartFormData }

procedure TcuMultipartFormDataSysNet.AddField(const AField, AValue: string);
begin
  FFormData.AddField(AField, AValue);
end;

procedure TcuMultipartFormDataSysNet.AddFile(const AFieldName, AFilePath: string);
begin
  FFormData.AddFile(AFieldName, AFilePath);
end;

constructor TcuMultipartFormDataSysNet.Create;
begin
  FFormData := TMultipartFormData.Create;
end;

destructor TcuMultipartFormDataSysNet.Destroy;
begin
  FFormData.Free;
  inherited;
end;

function TcuMultipartFormDataSysNet.GetCore: TMultipartFormData;
begin
  Result := FFormData;
end;

end.

