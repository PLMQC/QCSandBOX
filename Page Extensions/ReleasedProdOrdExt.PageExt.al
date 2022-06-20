pageextension 33000310 ReleasedProdOrdExtB2B extends "Released Production Order"
{


    actions
    {
        addlast("F&unctions")
        {
            action("Create Inspection Data Sheets B2B")
            {
                Caption = 'Create Inspection Data &Sheets';
                ToolTip ='we can create inspected data sheet is any item testing using for new ids created';
                Image = MakeOrder;
                ApplicationArea = All;

                trigger OnAction();
                begin
                    // Start  B2BQC1.00.00 - 01

                    CurrPage.ProdOrderLines.PAGE.CreateInspDataSheets();

                    // Stop   B2BQC1.00.00 - 01
                end;
            }
        }

    }

}