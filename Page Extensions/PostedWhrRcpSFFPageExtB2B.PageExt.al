pageextension 33000306 "PostedWhrRcpSFFPageExt B2B" extends "Posted Whse. Receipt Subform"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("&Line")
        {
            group("I&nspection B2B")
            {
                Caption = 'I&nspection';
                action("InspDataSheets B2B")
                {
                    Caption = '&Inspection Data Sheets';
                    tooltip = 'the Quality department carry out the quality activities by using the IDS';
                    ApplicationArea = all;
                    Image = ShowInventoryPeriods;
                    trigger OnAction();
                    begin
                        // Start  B2BQC1.00.00 - 01

                        ShowDataSheet();

                        // Stop   B2BQC1.00.00 - 01
                    end;
                }
                action("PostedInspDataSheets B2B")
                {
                    Caption = '&Posted Inspection Data Sheets';
                    ToolTip = 'posted inspection data sheet  used for reporting and vendor analysis';
                    ApplicationArea = all;
                    Image = PostDocument;
                    trigger OnAction();
                    begin
                        // Start  B2BQC1.00.00 - 01

                        ShowPostedDataSheet()

                        // Stop   B2BQC1.00.00 - 01
                    end;
                }
                action("InspReceipts B2B")
                {
                    Caption = 'Inspection &Receipts';
                    tooltip = 'Inspection receipt through which the user actually accepts, rejects or sends for rework';
                    ApplicationArea = all;
                    Image = Receipt;
                    trigger OnAction();
                    begin
                        // Start  B2BQC1.00.00 - 01

                        ShowInspectReceipt()

                        // Stop   B2BQC1.00.00 - 01
                    end;
                }
                action("PostedInspReceipts B2B")
                {
                    Caption = 'Posted I&nspection Receipts';
                    tooltip = 'Posted Inspection Receipts used for reporting and vendor analysis';
                    ApplicationArea = all;
                    Image = PostedReceipt;
                    trigger OnAction();
                    begin
                        // Start  B2BQC1.00.00 - 01

                        ShowPostedInspectReceipt();

                        // Stop   B2BQC1.00.00 - 01
                    end;
                }
            }

        }
    }
    var
        InspectReportHeader: Record 33000269;
        PostedInspectDataSheet: Record 33000263;
        InspectDataSheet: Record 33000255;
        WMSMgt2: Codeunit 7302;


    local procedure ShowPostedSourceDoc();
    begin

        //WMSMgt2.ShowPostedSourceDoc("Posted Source Document", "Posted Source No.");
        WMSMgt2.ShowPostedSourceDocument("Posted Source Document", "Posted Source No.");
    end;

    local procedure ShowBinContents();
    var
        BinContent: Record 7302;
    begin
        BinContent.ShowBinContents("Location Code", "Item No.", "Variant Code", "Bin Code");
    end;

    local procedure ShowWhseLine();
    begin
        WMSMgt2.ShowWhseDocLine(0, "Whse. Receipt No.", "Whse Receipt Line No.");
    end;


    procedure "---B2BQC1.00.00---"();
    begin
    end;

    procedure ShowDataSheet();
    begin
        // Start  B2BQC1.00.00 - 01 Show Inspection Data Sheets

        TESTFIELD("Source Document", "Source Document"::"Purchase Order");
        InspectDataSheet.SETRANGE("Receipt No.", "Posted Source No.");
        InspectDataSheet.SETRANGE("Item No.", "Item No.");
        InspectDataSheet.SETRANGE("Purch. Line No", "Source Line No.");
        PAGE.RUN(PAGE::"Inspection Data Sheet List B2B", InspectDataSheet);

        // Stop   B2BQC1.00.00 - 01
    end;

    procedure ShowPostedDataSheet();
    begin
        // Start  B2BQC1.00.00 - 01 Show Posted Inspection Data Sheets

        TESTFIELD("Source Document", "Source Document"::"Purchase Order");
        PostedInspectDataSheet.SETRANGE("Receipt No.", "Posted Source No.");
        PostedInspectDataSheet.SETRANGE("Item No.", "Item No.");
        PostedInspectDataSheet.SETRANGE("Purch. Line No", "Source Line No.");
        PAGE.RUN(PAGE::"Posted Ins DataSheet List B2B", PostedInspectDataSheet);

        // Stop   B2BQC1.00.00 - 01
    end;

    procedure ShowInspectReceipt();
    begin
        // Start  B2BQC1.00.00 - 01 Show Inspection Receipt

        TESTFIELD("Source Document", "Source Document"::"Purchase Order");
        InspectReportHeader.SETRANGE("Receipt No.", "Posted Source No.");
        InspectReportHeader.SETRANGE("Item No.", "Item No.");
        InspectReportHeader.SETRANGE("Purch Line No", "Source Line No.");
        InspectReportHeader.SETRANGE(Status, FALSE);
        PAGE.RUN(PAGE::"Inspection Receipt List B2B", InspectReportHeader);
        InspectReportHeader.RESET();

        // Stop   B2BQC1.00.00 - 01
    end;

    procedure ShowPostedInspectReceipt();
    begin
        // Start  B2BQC1.00.00 - 01 Show Posted Inspection Receipt

        TESTFIELD("Source Document", "Source Document"::"Purchase Order");
        InspectReportHeader.SETRANGE("Receipt No.", "Posted Source No.");
        InspectReportHeader.SETRANGE("Item No.", "Item No.");
        InspectReportHeader.SETRANGE("Purch Line No", "Source Line No.");
        InspectReportHeader.SETRANGE(Status, TRUE);
        PAGE.RUN(PAGE::"Posted Ins Receipt List B2B", InspectReportHeader);//B2BQC1.00.01
        InspectReportHeader.RESET();

        // Stop   B2BQC1.00.00 - 01
    end;


}