unit RestModule;

interface

uses
  System.SysUtils, System.Classes,System.JSON, IPPeerClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Datasnap.DBClient, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;
type
  restParam = Record
    baseUrl : String;
    ContentType : String;
    method  : String;
  End;

  TRest = class(TDataModule)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;   //REST.Response.Adapter
    FDMemTable: TFDMemTable;      // FireDAC.Comp.Client
    ClientDataSet: TClientDataSet;
    DataSource: TDataSource;
    procedure setRequest(Sender : TObject; rep : restParam);
    procedure Execute(Sender : TObject);
    procedure ExecuteAsync(Sender : TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Rest: TRest;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
(*
  TRESTClient - ���� ���� ����
  BaseURL : ���� �⺻ URL
  TRESTRequest - ��û�� ���� ���� �� ��û �۾� ����
  Client : TRESTClient ����
  Method : ��û �� HTTP �޼ҵ� ����
  Resource : REST API ���ҽ� ����(URI���� BaseURL ������ ����), �Ķ���ʹ� �߰�ȣ({})�� ����
  Params : Resource�� ���Ե� �Ķ���� �� ��
  Response : ���� ��ü(TRESTResponse) ����
  TRESTResponse - ��û�� ���� ���� ����
  Content : ������� ������(string)
  RootElement : ���� ������ �� �ʿ��� �׸� ����
  TRESTResponseDataSetAdapter - ���� �����͸� �����ͼ����� ��ȯ
  Response : ��ȯ ��� ���䵥����
  Dataset : ��ȯ�� �����͸� ����� ������ ��(TDataSet�� ��ӹ��� �޸� ���̺�, TFDMemTable �Ǵ� TClientDataSet ��)
  RootElement : ���� ������ �� ��ȯ�� �׸� ����
  TFDMemTable - �޸� ���̺�
*)

(*


*)
procedure TRest.DataModuleCreate(Sender: TObject);
begin
    RESTResponseDataSetAdapter.Response:= RESTResponse;
//  RESTResponseDataSetAdapter.ResponseJSON:= RESTResponse;

    RESTResponseDataSetAdapter.Dataset:= ClientDataSet;
//  RESTResponseDataSetAdapter.Dataset:= FDMemTable;

    ClientDataSet.Active:= False;
    DataSource.DataSet:= RESTResponseDataSetAdapter.Dataset;
end;

(*

*)
procedure TRest.setRequest(Sender:TObject; rep:restParam);
begin
    RESTClient.BaseURL:= rep.baseUrl;
//    RESTClient.Authenticator

    RESTRequest.Client:= RESTClient;
    RESTResponse.ContentType:= rep.ContentType;
//  RESTRequest.Method := TRESTRequestMethod.rmGET;
    RESTRequest.Params

end;

(*

*)
procedure TRest.ExecuteAsync(Sender : TObject);
var
  jsonValue : TJSONValue;
  resMessage : String;
begin

ClientDataSet.Active:= False;

RESTRequest.ExecuteAsync(procedure
begin
     if (RESTResponse.StatusCode >= 200) AND (RESTResponse.StatusCode <= 300) then
     begin
       jsonValue :=  RESTResponse.JSONValue;
       ClientDataSet.Active:=True;
     end
     else
       resMessage := RESTResponse.ErrorMessage;
end );
end;

(*
   ���� ���ν����� ������ �ٸ���.
*)

procedure TRest.Execute(Sender : TObject);
var
  jsonValue : TJSONValue;
  resMessage : String;
begin
  ClientDataSet.Active:=False;
  RESTRequest.Execute;

  if (RESTResponse.StatusCode >= 200) AND (RESTResponse.StatusCode <= 300) then
     begin
         ClientDataSet.Active:=True;
     end;
end;

end.
