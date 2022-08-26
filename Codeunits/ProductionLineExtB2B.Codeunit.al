codeunit 33000265 "ProductionLineExt B2B"
{
    trigger OnRun();
    begin
    end;


    [EventSubscriber(ObjectType::Table, Database::"Prod. Order Line", 'OnAfterCopyFromItem', '', true, true)]
    local procedure "Prod. Order Line_OnAfterCopyFromItem"
    (
        var ProdOrderLine: Record "Prod. Order Line";
        Item: Record "Item";
        var xProdOrderLine: Record "Prod. Order Line"
    )
    begin

        ProdOrderLine."WIP QC Enabled B2B" := Item."WIP QC Enabled B2B";
        ProdOrderLine."WIP Spec ID B2B" := Item."WIP Spec ID B2B";
        IF ProdOrderLine."WIP Spec ID B2B" <> '' THEN
            ProdOrderLine."Spec Version Code B2B" := GetSpecVersion(ProdOrderLine);



    end;

    local procedure GetSpecVersion(ProdOrderLineLRec: Record "Prod. Order Line"): Code[20]
    var

        SpecHeader: Record "Specification Header B2B";
    begin

        EXIT(SpecHeader.GetSpecVersion(ProdOrderLineLRec."WIP Spec ID B2B", WORKDATE(), TRUE));

    end;



}