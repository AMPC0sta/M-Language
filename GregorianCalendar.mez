let
    //  Generate a 6 (3 + 3)  years lenght Gregorian Calendar, Starting 3 before this year
    tmp = DateTime.LocalNow(),
    min = #date(Date.Year(tmp)-3,1,1),
    len = 6 * 365,
    Source=List.Dates(min,len,#duration(1,0,0,0)),
    #"Converted to Table" = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Renamed Columns" = Table.RenameColumns(#"Converted to Table",{{"Column1", "Date"}}),
    #"Added Custom" = Table.AddColumn(#"Renamed Columns", "Year", each Date.Year([Date])),
    #"Added Custom1" = Table.AddColumn(#"Added Custom", "Month", each Text.PadStart(Text.From(Date.Month([Date])),2,"0")),
    #"Added Custom2" = Table.AddColumn(#"Added Custom1", "Day", each Text.PadStart(Text.From(Date.Day([Date])),2,"0")),
    #"Added Custom3" = Table.AddColumn(#"Added Custom2", "Quarter", each Date.QuarterOfYear([Date])),
    #"Added Custom4" = Table.AddColumn(#"Added Custom3", "YearMonth", each Text.Combine({Text.From(Date.Year([Date])),Text.PadStart(Text.From(Date.Month([Date])),2,"0") })),
    #"Added Custom5" = Table.AddColumn(#"Added Custom4", "YearMonthExt", each Text.Proper(Date.ToText([Date],"MMM yy"))),
    #"Added Custom6" = Table.AddColumn(#"Added Custom5", "Week", each Text.PadStart(Text.From(Date.WeekOfYear([Date])),2,"0")),
    #"Added Custom7" = Table.AddColumn(#"Added Custom6", "DayOfWeek", each Date.DayOfWeek([Date])),
    #"Added Custom8" = Table.AddColumn(#"Added Custom7", "MonthExt", each Text.Proper(Date.MonthName([Date]))),
    #"Added Index" = Table.AddIndexColumn(#"Added Custom8", "Index", 0, 1, Int64.Type),
    #"Added Custom9" = Table.AddColumn(#"Added Index", "ShortMonth", each Text.Proper(Date.ToText([Date],"MMM")))
in
    #"Added Custom9"
	