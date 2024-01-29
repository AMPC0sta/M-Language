let
    AuxiliaryStatistics = #table  
    (
        {
            "Premio", "Numeros","Estrelas"
        },
        {
            { "1º Premio", 5, 2 },
            { "2º Premio", 5, 1 },
            { "3º Premio", 5, 0 },
            { "4º Premio", 4, 2 },
            { "5º Premio", 4, 1 },
            { "6º Premio", 3, 2 },
            { "7º Premio", 4, 0 },
            { "8º Premio", 2, 2 },
            { "9º Premio", 3, 1 },
            { "10º Premio", 3, 0 },
            { "11º Premio", 1, 2 },
            { "12º Premio", 2, 1 },
            { "13º Premio", 2, 0 }
        }
    ),
    Source = AuxiliaryStatistics,
    #"Added Custom" = Table.AddColumn(Source, "#combinaçoes", each #"#chaves_possiveis"([Numeros],[Estrelas])),
    #"Added Custom1" = Table.AddColumn(#"Added Custom", "Probabilidade", each 1/[#"#combinaçoes"])
in
    #"Added Custom1"