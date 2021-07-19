unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Func, RestModule,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    SendBtn: TButton;
    DBGrid: TDBGrid;
    ResMessage: TRichEdit;
    Label1: TLabel;
    BaseURIEdit: TEdit;
    procedure SendBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.SendBtnClick(Sender: TObject);
var
  param : RestModule.restParam;
  rest : Pointer;
  resMsg : String;
begin
    rest := @RestModule.Rest;


    param.baseUrl := BaseURIEdit.Text;
    param.ContentType :='application/json';
    param.method :='get';

    RestModule.Rest.setInit(Sender, param);
    DBGrid.DataSource:= RestModule.Rest.DataSource;

    RestModule.Rest.Execute(Sender);


    resMsg := '[Status] : ' + RestModule.Rest.RESTResponse.StatusText + #13#10;
    resMsg := resMsg + '[ContentType] : ' + RestModule.Rest.RESTResponse.ContentType + #13#10;
    resMsg := resMsg + '[Content] ' + #13#10 + RestModule.Rest.RESTResponse.Content + #13#10;
    ResMessage.Text:= resMsg;


end;

end.
