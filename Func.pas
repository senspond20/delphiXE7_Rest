unit Func;

interface
uses System.JSON;
type
   JSON = (JSONArray, JSONObject);

// JSONValue 를 JSONArray or JSONObject 형식으로 변환한다.
function getJSONFromJsonString(jsonValue : TJSONValue) : String;

//
implementation

function getJSONFromJsonString(jsonValue : TJSONValue) : string;
var
  jsonObj : TJSONObject;
  jsonArray : TJSONArray;
begin
   if(jsonValue is TJSONArray) then
      begin
         jsonArray := TJSONObject.ParseJSONValue(jsonValue.ToString) as TJSONArray;
         result := jsonArray.ToString;
      end
   else if(jsonValue is TJSONObject) then
      begin
        jsonObj:=   TJSONObject.ParseJSONValue(jsonValue.ToString) as TJSONObject;
        result := jsonObj.ToString;
      end
   else
      begin
        result := '';
      end;
end;
end.
