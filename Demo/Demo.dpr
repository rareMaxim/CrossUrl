program Demo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  CrossUrl.HttpClient,
  CrossUrl.SystemNet.HttpClient,
  CrossUrl.Indy.HttpClient,
  System.SysUtils;

const
  SERVER = 'http://example.com/';

procedure TestSysNet;
var
  b: IcuHttpClient;
  r: IcuHttpResponce;
begin
  b := TcuHttpClientSysNet.Create(nil);
  Writeln('Test System.Net: ');
  r := b.Get(SERVER);
  Writeln(r.StatusText);
  Writeln(r.StatusCode);
  Writeln(r.ContentAsString);
end;

procedure TestIndy;
var
  b: IcuHttpClient;
  r: IcuHttpResponce;
begin
  b := TcuHttpClientIndy.Create(nil);
  Writeln('Test Indy: ');
  r := b.Get(SERVER);
  Writeln(r.StatusText);
  Writeln(r.StatusCode);
  Writeln(r.ContentAsString);
end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    TestSysNet;
    TestIndy;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.

