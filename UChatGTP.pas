unit UChatGTP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  VCL.TMSFNCCustomComponent;


type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

{$I APIKEY.INC}

implementation

{$R *.dfm}

uses
  System.JSON, VCL.TMSFNCCloudBase;

function AskChatGTP(AQuestion: string): string;
var
  LCb: TTMSFNCCloudBase;
  LPostdata: string;
  LJsonValue: TJsonValue;
  LJsonArray: TJsonArray;
  LJSonString: TJsonString;
begin
  Result := '';

  LPostData := '{' +
    '"model": "text-davinci-003",'+
    '"prompt": "' + AQuestion + '",'+
    '"max_tokens": 2048,'+
    '"temperature": 0'+
    '}';

  // create instance of TMS FNC Cloud Base class
  LCb := TTMSFNCCloudBase.Create;

  try
    // Use JSON for the REST API calls and set API KEY via Authorization header
    LCb.Request.AddHeader('Authorization','Bearer ' + CHATGTP_APIKEY);
    LCb.Request.AddHeader('Content-Type','application/json');

    // Select HTTPS POST method, set POST data and specify endpoint URL
    LCb.Request.Method := rmPOST;
    LCb.Request.PostData := LPostData;
    LCb.Request.Host := 'https://api.openai.com';
    LCb.Request.Path := 'v1/completions';

    // Execute the HTTPS POST request synchronously (last param Async = false)
    LCb.ExecuteRequest(nil,nil,false);

    // Process returned JSON when request was successful
    if Lcb.RequestResult.Success then
    begin
      LJsonValue := TJSonObject.ParseJSONValue(Lcb.RequestResult.ResultString);
      LJsonValue := LJsonValue.GetValue<TJSonValue>('choices');
      if LJsonValue is TJSonArray then
      begin
        LJSonArray := LJsonValue as TJSonArray;
        LJSonString := LJSonArray.Items[0].GetValue<TJSONString>('text');
        Result := LJSonString.Value;
      end
      else
    end
    else
      raise Exception.Create('HTTP response code: ' + LCb.RequestResult.ResponseCode.ToString);
  finally
    LCb.Free;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Text := AskChatGTP(Edit1.Text);
end;

end.
