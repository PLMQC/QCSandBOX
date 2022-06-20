page 33000254 "Specification Subform B2B"
{
    // version B2BQC1.00.00

    // *******************************************************************************
    // B2B     : B2B Software Technologies
    // Project : Quality Control Addon
    // *******************************************************************************
    // VER           SIGN       DATE         DESCRIPTION
    // *******************************************************************************
    // 1.00.00       B2BQC      06-05-15     New Page.

    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Specification Line B2B";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                field("Character Code"; "Character Code")
                {
                    Caption = 'Character Code';
                    tooltip = 'The character or attribute of the item that is to be observed for quality ';
                    ApplicationArea = all;
                }
                field("Character Type"; "Character Type")
                {
                    ApplicationArea = all;

                    tooltip = 'For identifying the line ,heading,standard,egin,end';
                }
                field(Description; Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Description for Identification purpose for  the use';
                    ApplicationArea = all;
                }
                field("Inspection Group Code"; "Inspection Group Code")
                {
                    Caption = 'Inspection Group Code';
                    ApplicationArea = all;
                    tooltip = 'The Inspection group should be selected from the lookup button on the lines that have the character type as Begin';
                }
                field("Sampling Code"; "Sampling Code")
                {
                    Caption = 'Sampling Code';
                    tooltip = 'Specify the number of units to be tested here Characteristics group level to all Characteristics of that group ';
                    ApplicationArea = all;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    Caption = 'Unit Of Measure Code';
                    ToolTip = 'Define Unit of Measure of the items to be tested';
                    ApplicationArea = all;
                }
                field(Qualitative; Qualitative)
                {
                    ApplicationArea = all;
                    tooltip = 'those attributes that are qualitative in nature.';
                }
                field("Normal Value (Num)"; "Normal Value (Num)")
                {
                    Caption = 'Normal Value (Num)';
                    ApplicationArea = all;
                    tooltip = 'Normal value of the characteristics in numbers normal data test ';
                }
                field("Min. Value (Num)"; "Min. Value (Num)")
                {
                    Caption = 'Min. Value (Num)';
                    tooltip = 'Minimum permitted value to acceptance in number ';
                    ApplicationArea = all;
                }
                field("Max. Value (Num)"; "Max. Value (Num)")
                {
                    Caption = 'Max. Value (Num)';
                    tooltip = 'Maximum permitted value to acceptance in number ';
                    ApplicationArea = all;
                }
                field("Normal Value (Char)"; "Normal Value (Char)")
                {
                    Caption = 'Normal Value (Char)';
                    tooltip = '-Normal permitted value to acceptance in character (ex-colour =blue';
                    ApplicationArea = all;
                }
                field("Min. Value (Char)"; "Min. Value (Char)")
                {
                    Caption = 'Min. Value (Char)';
                    tooltip = '-Minimum permitted value to acceptance in character ';
                    ApplicationArea = all;
                }
                field("Max. Value (Char)"; "Max. Value (Char)")
                {
                    Caption = 'Max. Value (Char)';
                    tooltip = 'Maximum permitted value to acceptance in character';
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        DescriptionIndent := 0;
        CharacterCodeOnFormat();
        DescriptionOnFormat();
    end;

    var
        [InDataSet]
        "Character CodeEmphasize": Boolean;
        [InDataSet]
        DescriptionEmphasize: Boolean;
        [InDataSet]
        DescriptionIndent: Integer;

    local procedure CharacterCodeOnFormat();
    begin
        "Character CodeEmphasize" := "Character Type" <> "Character Type"::Standard;
    end;

    local procedure DescriptionOnFormat();
    begin
        DescriptionEmphasize := "Character Type" <> "Character Type"::Standard;
        DescriptionIndent := Indentation;
    end;
}

