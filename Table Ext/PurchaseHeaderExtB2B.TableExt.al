tableextension 33000257 "PurchaseHeaderExt B2B" extends "Purchase Header"
{
    // version NAVW111.00.00.28629,B2BQC1.00.00


    procedure CopyQRItemstoCreditMemo()
    begin
        InspectJnlLine.CopyQRItemstoCreditMemo(Rec, 0);
    end;

    procedure CopyQRItemstoReturnOrder()
    begin
        InspectJnlLine.CopyQRItemstoReturnOrder(Rec, 0);
    end;



    var
        InspectJnlLine: Codeunit "Inspection Jnl. Post Line B2B";
}

