page 33000284 "Sub Assembly Card B2B"
{
    // version B2BQC1.00.00

    // *******************************************************************************
    // B2B     : B2B Software Technologies
    // Project : Quality Control Addon
    // *******************************************************************************
    // VER           SIGN       DATE         DESCRIPTION
    // *******************************************************************************
    // 1.00.00       B2BQC      06-05-15     New Page.

    Caption = 'Sub Assembly Card';
    PageType = Card;
    SourceTable = "Sub Assembly B2B";
    UsageCategory = Documents;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = ' automatic numbering using generic number series';
                    trigger OnAssistEdit();
                    begin
                        if AssistEdit() then
                            CurrPage.UPDATE();
                    end;
                }
                field(Description; Description)
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'Description for Identification purpose for  the user';
                }
                field("Spec ID"; "Spec ID")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'Specification is a group of characteristics to be inspected of an item';
                }
                field("QC Enabled"; "QC Enabled")
                {
                    ApplicationArea = all;
                    tooltip = 'In bound Inspection Data Sheets are created only if the item is QC Enabled';
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    ApplicationArea = all;
                    tooltip = 'unit of measure code from item unit of measure where the quantity to customer is to be dispatched';
                }
                field("Search Name"; "Search Name")
                {
                    ApplicationArea = all;
                    tooltip = 'any name search ';
                }
                field(Block; Block)
                {
                    ApplicationArea = all;
                    tooltip = 'any orde to block';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102154000; Notes)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        SETRANGE("No.");
    end;
}

