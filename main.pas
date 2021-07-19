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
    procedure FormCreate(Sender: TObject);
    procedure gridColmnsBinging(DBGrid : TDBGrid);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
    ResMessage.ScrollBars:= ssVertical;
end;

(*
  그리드 넓이 조정
*)
procedure TMainForm.gridColmnsBinging(DBGrid : TDBGrid);
var
   columns : TDBGridColumns;
   I : Integer;
begin
     columns:=  DBGrid.Columns;
     columns.Clear;
//     ListBox1.Clear;
     for I := 0 to columns.Count -1 do
        begin
//      ListBox1.Items.Add(columns[I].FieldName + '(' + IntToStr(columns[I].FieldName.Length) + ')');
           columns[I].Width:= 100  ;
        end;
end;

(*
  전송 버튼 클릭 이벤트
*)
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

    RestModule.Rest.setRequest(Sender, param);
    DBGrid.DataSource:= RestModule.Rest.DataSource;

    RestModule.Rest.Execute(Sender);
    gridColmnsBinging(DBGrid);

    resMsg := '[Status] : ' + RestModule.Rest.RESTResponse.StatusText + #13#10;
    resMsg := resMsg + '[ContentType] : ' + RestModule.Rest.RESTResponse.ContentType + #13#10;
    resMsg := resMsg + '[Content] ' + #13#10 + RestModule.Rest.RESTResponse.Content + #13#10;
    ResMessage.Text:= resMsg;

end;

end.
