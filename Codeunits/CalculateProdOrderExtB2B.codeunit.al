codeunit 33000264 "CalculateProdOrderExt B2B"
{
    trigger OnRun()
    begin
    end;


    [IntegrationEvent(false, false)]
    procedure OnAfterCopyGenJnlLineFromInspRecpHeader(InspectReceptHeader: Record "Inspection Receipt Header B2B"; var GenJournalLine: Record "Gen. Journal Line")
    begin
    end;

    /*
        [EventSubscriber(ObjectType::Page, Page::"Routing", 'OnBeforeValidateEvent', 'Status', true, true)]
        local procedure "Routing_OnBeforeValidateEvent_[content / General] - Status"(var Rec: Record "Routing Header")
        begin
            IF rec.Status = rec.Status::Certified THEN BEGIN
                RoutingLine.Reset();
                RoutingLine.SETRANGE("Routing No.", rec."No.");
                IF RoutingLine.Findfirst THEN BEGIN  

                        RoutingLine."QC Enabled B2B" := FALSE;
                        RoutingLine.MODIFY();

                END;
            END;
        end;
        */ //B2BQC1.00.01

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Calculate Prod. Order", 'OnAfterTransferRoutingLine', '', true, true)]
    local procedure "Calculate Prod. Order_OnAfterTransferRoutingLine"(
        var ProdOrderLine: Record "Prod. Order Line";
        var RoutingLine: Record "Routing Line";
        var ProdOrderRoutingLine: Record "Prod. Order Routing Line"
        )
    begin
        ProdOrderRoutingLine."Sub Assembly B2B" := RoutingLine."Sub Assembly b2B";
        ProdOrderRoutingLine."Sub Assembly Description B2B" := RoutingLine."Sub Assembly Description B2B";
        ProdOrderRoutingLine."QC Enabled B2B" := RoutingLine."QC Enabled B2B";
        ProdOrderRoutingLine."Spec ID B2B" := RoutingLine."Spec ID B2b";
        ProdOrderRoutingLine."Quantity B2B" := RoutingLine."Qty. Produced B2B" * ProdOrderLine.Quantity;
        ProdOrderRoutingLine."Qty. to Produce B2B" := RoutingLine."Qty. Produced B2B" * ProdOrderLine.Quantity;
        ProdOrderRoutingLine."Sub Assembly UOM Code B2B" := RoutingLine."Sub Assembly UOM Code B2B";

    end;

    var
        RoutingLine: Record "Routing Line";
}