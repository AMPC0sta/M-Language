(funct as text) =>
// Getting data from a REST API 
// Address/RelativePath/Token are global parameters
// Functions are arguments
let
    R = RunnAPIInterface & funct,
    T = "Bearer " & RunnToken,
    HTTP_Header = [RelativePath = R, Headers=[#"Authorization"=T]],

    Source = Json.Document(Web.Contents(RunnAddress,HTTP_Header)),
    tableX = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error)
in
    tableX
