unit CrossUrl.HttpClient;

interface

uses
  System.Classes,
  System.SysUtils;

type
  IcuMultipartFormData = interface
    ['{C1FEF918-67B9-4503-B67F-AD942F16FEB3}']
    procedure AddField(const AField, AValue: string);
    procedure AddFile(const AFieldName, AFilePath: string);
  end;

  IcuHttpResponse = interface
    ['{44F74F9B-CCD2-475E-95E0-02DA30AC749D}']
    //private
    function GetStatusCode: Integer;
    function GetStatusText: string;
    function GetContentStream: TStream;
    //public
    property StatusText: string read GetStatusText;
    property StatusCode: Integer read GetStatusCode;
    property ContentStream: TStream read GetContentStream;
    function ContentAsString(const AnEncoding: TEncoding = nil): string;
  end;

  IcuHttpClient = interface
    ['{EB3348C4-5651-4BAB-988D-A28794FEB149}']
    function Get(const AUrl: string): IcuHttpResponse;
    function Post(const AURL: string; const ASource: IcuMultipartFormData): IcuHttpResponse;
  end;

implementation

end.

