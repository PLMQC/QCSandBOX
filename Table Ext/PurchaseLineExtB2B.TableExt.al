tableextension 33000258 "PurchaseLineExt B2B" extends "Purchase Line"
{
    // version NAVW111.00.00.29745,B2BQC1.00.00

    fields
    {
        field(33000250; "Spec ID B2B"; Code[20])
        {
            Caption = 'Spec ID';
            TableRelation = "Specification Header B2B";
            DataClassification = CustomerContent;
        }
        field(33000251; "Quantity Accepted B2B"; Decimal)
        {
            CalcFormula = Sum ("Quality Ledger Entry B2B".Quantity WHERE("Order No." = FIELD("Document No."),
                                                                     "Order Line No." = FIELD("Line No."),
                                                                     "Entry Type" = FILTER(Accepted)));
            Caption = 'Quantity Accepted';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33000252; "Quantity Rework B2B"; Decimal)
        {
            CalcFormula = Sum ("Quality Ledger Entry B2B"."Remaining Quantity" WHERE("Order No." = FIELD("Document No."),
                                                                                 "Order Line No." = FIELD("Line No."),
                                                                                 "Entry Type" = FILTER(Rework),
                                                                                 Open = CONST(true)));
            Caption = 'Quantity Rework';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33000253; "QC Enabled B2B"; Boolean)
        {
            Caption = 'QC Enabled';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                // Start  B2BQC1.00.00 - 01
                //Satisfy the field condition

                TestStatusOpen();
                TESTFIELD(Type, 2);
                if "QC Enabled B2B" then
                    TESTFIELD("Spec ID B2B");
                if not "QC Enabled B2B" then
                    if "Quality Before Receipt B2B" then
                        VALIDATE("Quality Before Receipt B2B", false);
                // Stop   B2BQC1.00.00 - 01
            end;
        }
        field(33000254; "Quantity Rejected B2B"; Decimal)
        {
            CalcFormula = Sum ("Quality Ledger Entry B2B".Quantity WHERE("Order No." = FIELD("Document No."),
                                                                     "Order Line No." = FIELD("Line No."),
                                                                     "Entry Type" = FILTER(Reject)));
            Caption = 'Quantity Rejected';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33000255; "Quality Before Receipt B2B"; Boolean)
        {
            Caption = 'Quality Before Receipt';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                // Start  B2BQC1.00.00 - 01
                //Satisfy the field condition

                TestStatusOpen();
                TESTFIELD(Type, 2);
                if "Quantity Received" <> 0 then
                    FIELDERROR("Quantity Received", Text33000250Err);
                if "Qty. Sent to Quality B2B" <> 0 then
                    FIELDERROR("Qty. Sent to Quality B2B", Text33000250Err);
                "Qty. Sending to Quality B2B" := 0;
                if "Quality Before Receipt B2B" then begin
                    GetQCSetup();
                    QualityCtrlSetup.TESTFIELD("Quality Before Receipt", true);
                    TESTFIELD("QC Enabled B2B", true);
                end;
                // Stop   B2BQC1.00.00 - 01
            end;
        }
        field(33000256; "Qty. Sending to Quality B2B"; Decimal)
        {
            Caption = 'Qty. Sending to Quality';
            MinValue = 0;
            DataClassification = CustomerContent;
        }
        field(33000257; "Qty. Sent to Quality B2B"; Decimal)
        {
            Caption = 'Qty. Sent to Quality';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(33000258; "Qty. Sending to Quality(R) B2B"; Decimal)
        {
            Caption = 'Qty. Sending to Quality(R)';
            MinValue = 0;
            DataClassification = CustomerContent;
        }
        field(33000259; "Spec Version B2B"; Code[20])
        {
            Caption = 'Spec Version';
            TableRelation = "Specification Version B2B"."Version Code" WHERE("Specification No." = FIELD("Spec ID B2B"));
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        /* Need to uncomment it 
        key(Key1; "Order Date", "Document Type", "Document No.", "No.")
        {
        }
        */
    }



    procedure VendorQualityApprovalSpecId(): Code[20];
    var
        
        PurchHeader: Record "Purchase Header";
        PostingDate: Date;
    // Text33000250Err: Label 'Should be 0.';

    begin
        // Start  B2BQC1.00.00 - 01
        //Get the Vendor Item Quality Aproval SpecID
        VendorItemQA.SETRANGE("Vendor No.", "Buy-from Vendor No.");
        VendorItemQA.SETRANGE("Item No.", "No.");
        IF VendorItemQA.FIND('-') THEN BEGIN
            PurchHeader.GET(PurchHeader."Document Type"::Order, "Document No.");
            PostingDate := PurchHeader."Posting Date";
            REPEAT
                IF (PostingDate > VendorItemQA."Starting Date") AND (PostingDate < VendorItemQA."Ending Date") THEN
                    EXIT(VendorItemQA."Spec ID");
            UNTIL VendorItemQA.NEXT() = 0;
        END;
        // Stop   B2BQC1.00.00 - 01
    End;

    procedure GetQCSetup();
    begin
        // Start  B2BQC1.00.00 - 01
        //Get the QCSetup values

        IF NOT QCSetupRead THEN
            QualityCtrlSetup.GET();
        QCSetupRead := TRUE;

        // Stop   B2BQC1.00.00 - 01
    end;

    procedure UpdateQualityPurchLines(Item: Record 27);
    var
        SpecHeader: Record "Specification Header B2B";

    begin
        "Spec ID B2B" := VendorQualityApprovalSpecId();
        IF "Spec ID B2B" = '' THEN BEGIN
            "Spec ID B2B" := Item."Spec ID B2B";
            IF "Spec ID B2B" <> '' THEN
                "Spec Version B2B" := SpecHeader.GetSpecVersion("Spec ID B2B", WORKDATE(), TRUE);
        END;
        "QC Enabled B2B" := Item."QC Enabled B2B";
        GetQCSetup();
        IF (QualityCtrlSetup."Quality Before Receipt") AND (Item."QC Enabled B2B") THEN
            "Quality Before Receipt B2B" := TRUE;
    end;

    procedure CreateInspectionDataSheets();
    var
        PurchHeader: Record "Purchase Header";
        WhseRcptLine: Record "Warehouse Receipt Line";
        InspectDataSheets: Codeunit "Inspection Data Sheets B2B";


    begin
        // Start  B2BQC1.00.00 - 01
        //Create inpsection datasheets

        PurchHeader.GET(PurchHeader."Document Type"::Order, "Document No.");
        PurchHeader.TESTFIELD(Status, 1);
        Rec.TESTFIELD("Quality Before Receipt B2B", TRUE);
        Rec.TESTFIELD("Qty. Sending to Quality B2B");

        WhseRcptLine.SETRANGE("Source Type", 39);
        WhseRcptLine.SETRANGE("Source Subtype", 1);
        WhseRcptLine.SETRANGE("Source Document", WhseRcptLine."Source Document"::"Purchase Order");
        WhseRcptLine.SETRANGE("Source No.", "Document No.");
        WhseRcptLine.SETRANGE("Source Line No.", "Line No.");
        IF not WhseRcptLine.IsEmpty() THEN
            ERROR(Text33000251Err);

        InspectDataSheets.CreatePurLineInspectDataSheet(PurchHeader, Rec);

        // Stop   B2BQC1.00.00 - 01
    end;

    procedure ShowDataSheets();
    var
        InspectDataSheet: Record "Ins Datasheet Header B2B";
    begin
        // Start  B2BQC1.00.00 - 01
        //Show inspection datasheets

        InspectDataSheet.SETRANGE("Order No.", "Document No.");
        InspectDataSheet.SETRANGE("Purch. Line No", "Line No.");
        InspectDataSheet.SETRANGE("Source Type", InspectDataSheet."Source Type"::"In Bound");
        PAGE.RUN(PAGE::"Inspection Data Sheet List B2B", InspectDataSheet);

        // Stop   B2BQC1.00.00 - 01
    end;

    procedure ShowPostDataSheets();
    var
        PostInspectDataSheet: Record "Posted Ins DatasheetHeader B2B";
    begin
        // Start  B2BQC1.00.00 - 01
        //Show Posted inspection datasheets

        PostInspectDataSheet.SETRANGE("Order No.", "Document No.");
        PostInspectDataSheet.SETRANGE("Purch. Line No", "Line No.");
        PostInspectDataSheet.SETRANGE("Source Type", PostInspectDataSheet."Source Type"::"In Bound");
        PAGE.RUN(PAGE::"Posted Ins DataSheet List B2B", PostInspectDataSheet);

        // Stop   B2BQC1.00.00 - 01
    end;

    PROCEDURE ShowInspectReceipt();
    VAR
        InspectionReceipt: Record 33000269;
    BEGIN
        // Start  B2BQC1.00.00 - 01
        //Show inspection receipts

        InspectionReceipt.SETRANGE("Order No.", "Document No.");
        InspectionReceipt.SETRANGE("Purch Line No", "Line No.");
        InspectionReceipt.SETRANGE("Source Type", InspectionReceipt."Source Type"::"In Bound");
        InspectionReceipt.SETRANGE(Status, FALSE);
        PAGE.RUN(PAGE::"Inspection Receipt List B2B", InspectionReceipt);

        // Stop   B2BQC1.00.00 - 01
    END;

    procedure ShowPostInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header B2B";
    begin
        // Start  B2BQC1.00.00 - 01
        //Show posted inspection receipts

        InspectionReceipt.SETRANGE("Order No.", "Document No.");
        InspectionReceipt.SETRANGE("Purch Line No", "Line No.");
        InspectionReceipt.SETRANGE("Source Type", InspectionReceipt."Source Type"::"In Bound");
        InspectionReceipt.SETRANGE(Status, TRUE);
        PAGE.RUN(PAGE::"Posted Ins Receipt List B2B", InspectionReceipt);

        // Stop   B2BQC1.00.00 - 01

    end;

    var
        QualityCtrlSetup: Record "Quality Control Setup B2B";
        VendorItemQA: Record "Vendor Item Qty Approval B2B";
        Text33000250Err: Label 'Should be 0.';
        Text33000251Err: Label 'You can not create Inspection Data Sheets when Warehouse Receipt line exists.';
        QCSetupRead: Boolean;
        

}

