let
    AuxiliaryMetadata = #table  (
            {
                "Context", "Value"
            },
            {
                { "Generic", "No value" }
            }
        ),
    #"Changed Type" = Table.TransformColumnTypes(AuxiliaryMetadata,{{"Value", type text}})
in
    #"Changed Type"