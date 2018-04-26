unit CrossUrl.HttpClient;

interface

type
  IcuHttpResponce = interface
    function Content: string;
  end;

  IcuHttpClient = interface
    function Get(const AUrl: string): IcuHttpResponce;
  end;

implementation

end.

