unit CrossUrl.Indy.MultipartFormData;

interface

uses
  IdMultiPartFormData,
  CrossUrl.HttpClient;

type
  TcuMultipartFormDataIndy = class(TInterfacedObject, IcuMultipartFormData)
  private
    FFormData: TIdMultiPartFormDataStream;
  public
    constructor Create;
    procedure AddField(const AField: string; const AValue: string);
    procedure AddFile(const AFieldName: string; const AFilePath: string);
    destructor Destroy; override;
  end;

implementation

{ TcuMultipartFormDataSysNet }

procedure TcuMultipartFormDataIndy.AddField(const AField, AValue: string);
begin
  FFormData.AddFormField(AField, AValue);
end;

procedure TcuMultipartFormDataIndy.AddFile(const AFieldName, AFilePath: string);
begin
  FFormData.AddFile(AFieldName, AFilePath);
end;

constructor TcuMultipartFormDataIndy.Create;
begin
  FFormData := TIdMultiPartFormDataStream.Create;
end;

destructor TcuMultipartFormDataIndy.Destroy;
begin
  FFormData.Free;
  inherited;
end;

end.

