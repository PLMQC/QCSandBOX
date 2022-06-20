pageextension 33000319 "PurchReturnOrderExt B2B" extends "Purchase Return Order"
{



    actions
    {
        addlast("Warehouse")
        {
            group("Quality B2B")
            {
                Caption = 'QC';
                action("CopyQualityRejectedItems B2B")

                {
                    Caption = 'Copy Quality &Rejected Items';

                    ToolTip = 'Used to copy the rejected items';
                    Image = MakeOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = all;
                    trigger OnAction();
                    begin
                        // Start  B2BQC1.00.00 - 01
                        CopyQRItemstoReturnOrder();
                        // Stop   B2BQC1.00.00 - 01
                    end;
                }

            }

        }
    }
}