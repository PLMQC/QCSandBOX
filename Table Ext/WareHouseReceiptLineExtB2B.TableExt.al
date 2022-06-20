tableextension 33000262 "WareHouseReceiptLineExt B2B" extends "Warehouse Receipt Line"
{
    // version NAVW111.00.00.20348,B2BQC1.00.00

    fields
    {
        field(33000250; "Quantity Accepted B2B"; Decimal)
        {
            Caption = 'Quantity Accepted';
            DataClassification = CustomerContent;
        }
        field(33000251; "Quantity Rework B2B"; Decimal)
        {
            Caption = 'Quantity Rework';
            DataClassification = CustomerContent;
        }
        field(33000252; "Quantity Rejected B2B"; Decimal)
        {
            Caption = 'Quantity Rejected';
            DataClassification = CustomerContent;
        }
        field(33000253; "Qty. Sending to Quality B2B"; Decimal)
        {
            Caption = 'Qty. Sending to Quality';
            MinValue = 0;
            DataClassification = CustomerContent;
        }
        field(33000254; "Qty. Sent to Quality B2B"; Decimal)
        {
            Caption = 'Qty. Sent to Quality';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.
    //B2BQC1.00.01>>
    PROCEDURE ShowDataSheetsWH();
    VAR
        InspectDataSheet: Record 33000255;
    BEGIN
        // Start  B2BQC1.00.00 - 01
        //Show Inspection Datasheets

        InspectDataSheet.SETRANGE("Order No.", "Source No.");
        InspectDataSheet.SETRANGE("Purch. Line No", "Source Line No.");
        InspectDataSheet.SETRANGE("Source Type", InspectDataSheet."Source Type"::"In Bound");
        PAGE.RUN(PAGE::"Inspection Data Sheet List B2B", InspectDataSheet);

        // Stop   B2BQC1.00.00 - 01
    END;

    PROCEDURE ShowPostDataSheetsWH();
    VAR
        PostInspectDataSheet: Record 33000263;
    BEGIN
        // Start  B2BQC1.00.00 - 01
        //Show Posted Inspection Datasheets

        PostInspectDataSheet.SETRANGE("Order No.", "Source No.");
        PostInspectDataSheet.SETRANGE("Purch. Line No", "Source Line No.");
        PostInspectDataSheet.SETRANGE("Source Type", PostInspectDataSheet."Source Type"::"In Bound");
        PAGE.RUN(PAGE::"Posted Ins DataSheet List B2B", PostInspectDataSheet);

        // Stop   B2BQC1.00.00 - 01
    END;

    PROCEDURE ShowInspectReceiptWH();
    VAR
        InspectionReceipt: Record 33000269;
    BEGIN
        // Start  B2BQC1.00.00 - 01
        //Show Inspection Receipts

        InspectionReceipt.SETRANGE("Order No.", "Source No.");
        InspectionReceipt.SETRANGE("Purch Line No", "Source Line No.");
        InspectionReceipt.SETRANGE("Source Type", InspectionReceipt."Source Type"::"In Bound");
        InspectionReceipt.SETRANGE(Status, FALSE);
        PAGE.RUN(PAGE::"Inspection Receipt List B2B", InspectionReceipt);

        // Stop   B2BQC1.00.00 - 01
    END;

    PROCEDURE ShowPostInspectReceiptWH();
    VAR
        InspectionReceipt: Record 33000269;
    BEGIN
        // Start  B2BQC1.00.00 - 01
        //Show Posted Inspection Receipts

        InspectionReceipt.SETRANGE("Order No.", "Source No.");
        InspectionReceipt.SETRANGE("Purch Line No", "Source Line No.");
        InspectionReceipt.SETRANGE("Source Type", InspectionReceipt."Source Type"::"In Bound");
        InspectionReceipt.SETRANGE(Status, TRUE);
        PAGE.RUN(PAGE::"Posted Ins Receipt List B2B", InspectionReceipt);

        // Stop   B2BQC1.00.00 - 01
    END;

    PROCEDURE CreateInspectionDataSheetsWH()
    VAR
        InspectDataSheets: Codeunit 33000251;
        PurchHeader: Record 38;
        PurchLine: Record 39;
    BEGIN
        // Start  B2BQC1.00.00 - 01
        //Create Inspection Datasheets

        TESTFIELD("Qty. Sending to Quality B2B");
        PurchHeader.GET(PurchHeader."Document Type"::Order, "Source No.");
        PurchHeader.TESTFIELD(Status, PurchHeader.Status::Released);
        PurchLine.GET(PurchLine."Document Type"::Order, "Source No.", "Source Line No.");
        PurchLine.TESTFIELD("Quality Before Receipt B2B", TRUE);
        PurchLine."Qty. Sending to Quality B2B" := "Qty. Sending to Quality B2B";
        InspectDataSheets.CreatePurLineInspectDataSheet(PurchHeader, PurchLine);
        PurchLine.MODIFY;
        "Qty. Sent to Quality B2B" := "Qty. Sent to Quality B2B" + "Qty. Sending to Quality B2B";
        "Qty. Sending to Quality B2B" := 0;
        MODIFY;

        // Stop   B2BQC1.00.00 - 01
    END;

    //B2BQC1.00.01<<

}

