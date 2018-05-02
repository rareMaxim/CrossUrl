unit CrossUrl.HttpClient;

interface

uses
  System.Classes, System.SysUtils;

type
  IcuHttpResponce = interface
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
    function Get(const AUrl: string): IcuHttpResponce;
  end;

implementation

end.

