page 33000270 "Inspection Receipt Subform B2B"
{
    // version B2BQC1.00.00

    // *******************************************************************************
    // B2B     : B2B Software Technologies
    // Project : Quality Control Addon
    // *******************************************************************************
    // VER           SIGN       DATE         DESCRIPTION
    // *******************************************************************************
    // 1.00.00       B2BQC      06-05-15     New Page.

    Caption = 'Lines';
    DelayedInsert = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "Inspection Receipt Line B2B";

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
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'The character or attribute of the item that is to be observed for quality assessment';
                }
                field(Description; Description)
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Description for Identification purpose for  the user';
                }
                field("Sampling Plan Code"; "Sampling Plan Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'sampling plan that is applicable to the set of characters to be inspected by the inspection group';
                }
                field("Normal Value (Num)"; "Normal Value (Num)")
                {
                    Editable = false;
                    ApplicationArea = all;

                    tooltip = 'Normal value of the characteristics in numbers numeric test data';
                }
                field("Min. Value (Num)"; "Min. Value (Num)")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Minimum permitted value to acceptance in number ';
                }
                field("Max. Value (Num)"; "Max. Value (Num)")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Maximum permitted value to acceptance in number ';
                }
                field("Normal Value (Text)"; "Normal Value (Text)")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Normal value of the characteristics in numbers numeric test data';
                }
                field("Min. Value (Text)"; "Min. Value (Text)")
                {
                    Editable = false;
                    ApplicationArea = all;
                    ToolTip = 'Minimum permitted value to acceptance in number ';
                }
                field("Max. Value (Text)"; "Max. Value (Text)")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = '-Maximum permitted value to acceptance in number ';
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = ' required unit of measure code from item unit of measure where the quantity';
                }
                field("Lot Size - Min"; "Lot Size - Min")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Lot Size-min  and the corresponding Sampling size';
                }
                field("Lot Size - Max"; "Lot Size - Max")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Lot Size-Max  and the corresponding Sampling size';
                }
                field("Allowable Defects - Max"; "Allowable Defects - Max")
                {
                    ToolTip = 'Allowed Defects Maximum Quantity sholud Define  ' ;

                    Editable = false;
                    ApplicationArea = all;
                }
                field("Total Qty"; "Total Qty")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'This is the total number of quantity being ordered';
                }
                field("Accepted Qty"; "Accepted Qty")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'the inspection data sheet is quantity characteristic  approval is the accepted quantity';
                }
                field("Rejected Qty"; "Rejected Qty")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'the inspection data sheet is quantity characteristic is not approval the rejected quantity';
                }
                field(Accept; Accept)
                {
                    ApplicationArea = all;
                    tooltip = 'any quantity is approval is the accept';
                }
                field("Reason Code"; "Reason Code")
                {
                    ApplicationArea = all;
                    tooltip = 'Reason Codes are normally used during the Quality Operation';
                }
                field("Inspection Persons"; "Inspection Persons")
                {
                    ApplicationArea = all;
                    tooltip = 'which person to tested the quantity inspection persons';
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = all;
                    tooltip = 'any quantity remark items';
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

