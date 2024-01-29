(ptr as number,funct as text,args as text,optional result as table) =>
/*
 Recursive funtion: @getFromRunnArg-1
        Parameters: ptr        		    	-> Position of the recursive call (page pointer). needs to be initiated as zero
                    funct      			 	-> Name of the Runn function to call
                    args					-> Argument (argument name and argument value, example: arg_name=arg_value
                    resutl               	-> Should be initiated as null
*/

// Address,RelativePath,Token are global arguments
let
    new_ptr=ptr+1,
    
    /* Building connection string */
    RP = RunnAPIInterface & funct & "?" & args & "&page=" & Number.ToText(new_ptr),
    Token = "Bearer " & RunnToken,
    HTTP_Header = [RelativePath = RP, Headers=[#"Authorization"=Token]],
   
    /* Get Date from Runn */
    Source = Json.Document(Web.Contents(RunnAddress,HTTP_Header)),
    tableTmp = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error),

    /* how many recods this page have? */
    rows = Table.RowCount(tableTmp),

    /* If no records were retrieve, final table is the same than the input table. 
    Otherwhise, final_table is merged between the received in parameters and returned by Runn */
    TableX = if result = null then tableTmp else Table.Combine({result,tableTmp}), 
    
    /* if page has no rows, os the last page, so that, stop recursion */
    output = 
        if rows = 0 then TableX
                    else @#"getFromRunnRecursive-1-Arg"(new_ptr,funct,args,TableX) 
in
    output
