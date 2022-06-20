tableextension 33000256 "PurchRcptLineExt B2B" extends "Purch. Rcpt. Line"
{
    // version NAVW111.00.00.28629,B2BQC1.00.00

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
            Caption = 'Quantity Accepted';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                // Start  B2BQC1.00.00 - 01
                //Check the quantity

                if ("Quantity Accepted B2B" + "Quantity Rework B2B") > Quantity then
                    ERROR(Text33000250Err);

                // Stop   B2BQC1.00.00 - 01
            end;
        }
        field(33000252; "Quantity Rework B2B"; Decimal)
        {
            Caption = 'Quantity Rework';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                // Start  B2BQC1.00.00 - 01
                //Validate Quantity Accepted Field

                VALIDATE("Quantity Accepted B2B");

                // Stop   B2BQC1.00.00 - 01
            end;
        }
        field(33000253; "QC Enabled B2B"; Boolean)
        {
            Caption = 'QC Enabled';
            DataClassification = CustomerContent;
        }
        field(33000254; "Quantity Rejected B2B"; Decimal)
        {
            Caption = 'Quantity Rejected';
            DataClassification = CustomerContent;
        }
        field(33000255; "Quality Before Receipt B2B"; Boolean)
        {
            Caption = 'Quality Before Receipt';
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
        
        //Need to resolve key .
        /*
                key(Key1; Type, "Buy-from Vendor No.", "No.")
        {
            SumIndexFields = Quantity;
        }
        */
    }

    


    


    var
        Text33000250Err: Label 'Sum of the Quantity Accepted and Rejected should not be more than Receipt Quantity.';
}

