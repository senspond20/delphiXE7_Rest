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
  TRESTClient - 서버 정보 설정
  BaseURL : 서버 기본 URL
  TRESTRequest - 요청할 정보 설정 및 요청 작업 수행
  Client : TRESTClient 지정
  Method : 요청 시 HTTP 메소드 종류
  Resource : REST API 리소스 지정(URI에서 BaseURL 제외한 영역), 파라메터는 중괄호({})로 지정
  Params : Resource에 포함된 파라메터 값 정
  Response : 응답 객체(TRESTResponse) 지정
  TRESTResponse - 요청의 응답 정보 보관
  Content : 응답받은 데이터(string)
  RootElement : 응답 데이터 중 필요한 항목 지정
  TRESTResponseDataSetAdapter - 응답 데이터를 데이터셋으로 변환
  Response : 변환 대상 응답데이터
  Dataset : 변환한 데이터를 기록할 데이터 셋(TDataSet을 상속받은 메모리 테이블, TFDMemTable 또는 TClientDataSet 등)
  RootElement : 응답 데이터 중 변환할 항목 지정
  TFDMemTable - 메모리 테이블
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
   위의 프로시저랑 동작이 다르다.
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
