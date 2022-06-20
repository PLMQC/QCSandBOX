page 33000301 "Trailing IDS Setup B2B"
{
    // version B2BQC1.00.00

    // *******************************************************************************
    // B2B     : B2B Software Technologies
    // Project : Quality Control Addon
    // *******************************************************************************
    // VER           SIGN       DATE         DESCRIPTION
    // *******************************************************************************
    // 1.00.00       B2BQC      06-05-15     New Page.

    Caption = 'Trailing IDS Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = StandardDialog;
    SourceTable = "Trailing IDS Setup B2B";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Use Work Date as Base"; "Use Work Date as Base")
                {
                    ApplicationArea = all;
                    tooltip = 'enter the mention for using the date that work date';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        if not GET(USERID()) then begin
            Evaluate("User ID", USERID());
            "Use Work Date as Base" := true;
            INSERT();
        end;
        FILTERGROUP(2);
        SETRANGE("User ID", USERID());
        FILTERGROUP(0);
    end;
}

