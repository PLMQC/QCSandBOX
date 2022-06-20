page 33000269 "Inspection Receipt B2B"
{
    // version B2BQC1.00.00

    // *******************************************************************************
    // B2B     : B2B Software Technologies
    // Project : Quality Control Addon
    // *******************************************************************************
    // VER           SIGN       DATE         DESCRIPTION
    // *******************************************************************************
    // 1.00.00       B2BQC      06-05-15     New Page.

    Caption = 'Inspection Receipt';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "Inspection Receipt Header B2B";
    SourceTableView = SORTING("No.")
                      WHERE(Status = FILTER(false));
    UsageCategory = Documents;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'enter the number';
                }
                field("Item No."; "Item No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'selected the no.series from inventory setup numbering tab';
                }
                field("Item Description"; "Item Description")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'enter item name';
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                    ToolTip = 'enter the unit of measure ';
                }
                field(Quantity; Quantity)
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'This is the total number of items being ordered';
                }
                field("Spec ID"; "Spec ID")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Specification is a group of characteristics to be inspected of an item';
                }
                field("Base Unit of Measure"; "Base Unit of Measure")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = ' base unit of measure if what you need ';
                }
                field("Quantity(Base)"; "Quantity(Base)")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'This is the total number of items being ordered';
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = all;
                    tooltip = 'Date the order will post to G/L, customer, and item ledger entries';
                }
                field("Document Date"; "Document Date")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'This date is used to calculate the customers payment due date and finance charges';
                }
                field("Rework Reference No."; "Rework Reference No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'At the time of receipt of the material back from the vendor, open the same document rework reference number';
                }
                field("Source Type"; "Source Type")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'selected the source type';
                }
                field(Status; Status)
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Default is new. After entry of the relevant data, the status must be changed to Certified';
                }
                field("Spec Version"; "Spec Version")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'specification version group of characteristics changed  the quality structure process';
                }
                field("Lot No."; "Lot No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'lot numbers but it is required by the item tracking code applied to this item';
                }
            }
            part(Control1000000032; "Inspection Receipt Subform B2B")
            {
                SubPageLink = "Document No." = FIELD("No."),
                              "Purch Line No." = FIELD("Purch Line No");
                ApplicationArea = all;

            }
            group(Receipt)
            {
                Caption = 'Receipt';
                field("Vendor No."; "Vendor No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'enter the vendor number';
                }
                field("Vendor Name"; "Vendor Name")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'enter the vender name ';
                }
                field("Vendor Name 2"; "Vendor Name 2")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'enter the vendor name 2';
                }
                field(Address; Address)
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'enter the vendor address';
                }
                field("Address 2"; "Address 2")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'enter the address 2';
                }
                field("Contact Person"; "Contact Person")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'enter the contact person ';
                }
                field("Order No."; "Order No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'enter the order number';
                }
                field("Receipt No."; "Receipt No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Receipt no. on which the sample as received';
                }
                field("Purch Line No"; "Purch Line No")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'purchase order the  line mention the items ,uom ,quantity is the single line number';
                }
                field("External Document No."; "External Document No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'External Document number';
                }
                field("Purchase Consignment"; "Purchase Consignment")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines no for Purchase consignment';
                }
                field("Item Tracking Exists"; "Item Tracking Exists")
                {
                    Editable = false;
                    ApplicationArea = all;
                    ToolTip = 'Need to Assign Item Tracking For Item';
                }
                field("Quality Before Receipt"; "Quality Before Receipt")
                {
                    ApplicationArea = all;
                    tooltip = 'Inspection is done before the material offered by the vendor is taken into the inventory.';
                }
            }
            group(Production)
            {
                Caption = 'Production';
                field("Prod. Order No."; "Prod. Order No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'selected the no.series from the manufacturing setup numbering tabs';
                }
                field("Prod. Order Line"; "Prod. Order Line")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'prod. order line  the mention the items ,uom ,quantity is the single line number';
                }
                field("Routing No."; "Routing No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    ToolTip = 'routing no.. This includes both numbers and letters';
                }
                field("Routing Reference No."; "Routing Reference No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'routing reference no. any operation the maintain the document is the number';
                }
                field("Operation No."; "Operation No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Operation number for the routing line. Every line of the routing has an operation number, which the program uses for various ';
                }
                field("Prod. Description"; "Prod. Description")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'enter the name prod. description';
                }
                field("Operation Description"; "Operation Description")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = ' operation description Name of the machine center or work center';
                }
                field("Production Batch No."; "Production Batch No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'enter the production batch number';
                }
                field("Sub Assembly Code"; "Sub Assembly Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'enter the subassembly words, letter';
                }
                field("Sub Assembly Description"; "Sub Assembly Description")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'enter the name subassembly description';
                }
                field("In Process"; "In Process")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'Inprocess Quality Control is used to inspect the required Specification at different stages of a particular Production Order';
                }
            }
            group(Inspection)
            {
                Caption = 'Inspection';
                field("<Quantity1>"; Quantity)
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'This is the total number of items being ordered';
                }
                field(UndefinedQtyCap; UndefinedQty)
                {
                    Caption = 'Undefined Quantity';
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                    ToolTip = 'This Field Defines Undefine Quantities';
                }
                field("Qty. Accepted"; "Qty. Accepted")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = 'the inspection data sheet is quantity characteristic  approval is the accepted quantity';
                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType::Accepted);
                        CalculateUndefinedQty();
                    end;
                }
                field("Qty. Accepted Under Deviation"; "Qty. Accepted Under Deviation")
                {
                    ApplicationArea = all;
                    tooltip = 'To register the number of items Accepted under Deviation';
                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType::"Accepted Under Deviation");
                        CalculateUndefinedQty();
                    end;
                }
                field("Qty. Rework"; "Qty. Rework")
                {
                    ApplicationArea = all;
                    tooltip = 'If items are sent to be sent for re-work, in the Vendor card';
                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType::Rework);
                        CalculateUndefinedQty();
                    end;
                }
                field("Qty. Rejected"; "Qty. Rejected")
                {
                    ApplicationArea = all;
                    tooltip = 'the inspection data sheet is quantity characteristic is not approval the rejected quantity';
                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType::Rejected);
                        CalculateUndefinedQty();
                    end;
                }
                field("Location Code"; "Location Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = ' Mention the location code from which the inventory is to be dispatched';
                }
                field("New Location Code"; "New Location Code")
                {
                    ApplicationArea = all;
                    tooltip = ' create new the location code from which the inventory is to be dispatched. ';
                }
                field("Qty. Accepted UD Reason"; "Qty. Accepted UD Reason")
                {
                    ApplicationArea = all;
                    tooltip = 'this field accepted quantity under deviation reason';
                }
                field("Reason Description"; "Reason Description")
                {
                    ApplicationArea = all;
                    tooltip = 'reason codes are attached to the Acceptance Levels';
                }
                field("Nature Of Rejection"; "Nature Of Rejection")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Rejection Reason';

                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Receipt")
            {
                Caption = '&Receipt';
                action("<Action1102154000>")
                {
                    Caption = 'List';
                    RunObject = Page "Inspection Receipt List B2B";
                    RunPageLink = "No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+L';
                    Visible = false;
                    ApplicationArea = all;
                    tooltip = 'Inspection receipt list through which the user actually accepts, rejects or sends for rework';
                    Image = Receipt;
                }
                action("&Inspection Data Sheets")
                {
                    Caption = '&Inspection Data Sheets';
                    tooltip = 'the Quality department carry out the quality activities by using the IDS';
                    Image = InsuranceLedger;
                    RunObject = Page "Inspection Data Sheet List B2B";
                    RunPageLink = "Receipt No." = FIELD("Receipt No."),
                                  "Order No." = FIELD("Order No."),
                                  "Purch. Line No" = FIELD("Purch Line No"),
                                  "Lot No." = FIELD("Lot No.");
                    ApplicationArea = all;
                }
                action("P&osted Inspect. Data Sheets")
                {
                    Caption = 'P&osted Inspect. Data Sheets';
                    Image = PostApplication;
                    RunObject = Page "Posted Ins DataSheet List B2B";
                    RunPageLink = "Inspection Receipt No." = FIELD("No.");
                    ApplicationArea = all;
                    tooltip = 'posted inspection data sheet  used for reporting and vendor analysis';
                }
                separator("-----")
                {
                    Caption = '-----';
                }
                action("&Purchase Receipt")
                {
                    Caption = '&Purchase Receipt';
                    Image = Purchase;
                    RunObject = Page "Posted Purchase Receipts";
                    RunPageLink = "No." = FIELD("Receipt No.");
                    ApplicationArea = all;
                    tooltip = 'posted purchase receipt  used for reporting and vendor analysis';
                }
            }
            group("&Item")
            {
                Caption = '&Item';
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = all;
                    ToolTip = 'dimensions and dimension values to business documents before posting them and moving the resulting entries to G/L';
                    trigger OnAction();
                    begin
                        ShowDocDim();
                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ApplicationArea = all;
                    ToolTip = 'Navigate to Item Tracking lines';
                    trigger OnAction();
                    begin
                        if not "Quality Before Receipt" then
                            ShowItemTrackingLines();
                    end;
                }
            }
        }
        area(processing)
        {
            group("P&osting")
            {
                Caption = 'P&osting';
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Image = Post;
                    Promoted = true;
                    PromotedOnly = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    ApplicationArea = all;
                    tooltip = 'post the material dispatch and receive used ';
                    trigger OnAction();
                    begin
                        if not CONFIRM(Text003Qst) then
                            exit;
                        if Rec."Item Ledger Entry No." <> 0 then //B2BQC1.00.01
                            CancelReservation(Rec);
                        InspectJnlLine.RUN(Rec);
                        Status := true;
                        CurrPage.SAVERECORD();
                        MESSAGE(Text001Msg, "No.");
                        CurrPage.UPDATE(true);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        CalculateUndefinedQty();
    end;

    var
        InspectJnlLine: Codeunit "Inspection Jnl. Post Line B2B";
        Text001Msg: Label 'Inspection receipt %1 posted successfully.', Comment = '%1 = No';
        QualityType: Option Accepted,"Accepted Under Deviation",Rework,Rejected;
        UndefinedQty: Decimal;
        Text003Qst: Label 'Do you want to Post the Inspection Receipt?';

    procedure CalculateUndefinedQty();
    begin
        UndefinedQty := Quantity - "Qty. Accepted" - "Qty. Rejected" - "Qty. Rework" - "Qty. Accepted Under Deviation";
    end;

    procedure CancelReservation(var InspectionReceipt: Record "Inspection Receipt Header B2B");
    var

        ReservEngineMgtExt: Codeunit 33000263;
    begin
        ReservationEntry.SETRANGE("Item No.", InspectionReceipt."Item No.");
        ReservationEntry.SETRANGE("Source Ref. No.", InspectionReceipt."Item Ledger Entry No.");
        if ReservationEntry.FIND('-') then begin
            ReservationEntry2.SETRANGE("Entry No.", ReservationEntry."Entry No.");
            ReservationEntry2.SETRANGE("Reservation Status", ReservationEntry2."Reservation Status"::Reservation,
            ReservationEntry2."Reservation Status"::Tracking);
            if ReservationEntry2.FIND('-') then
                repeat
                    ReservEngineMgtExt.CloseReservEntryTracking(ReservationEntry2);
                    COMMIT();
                until ReservationEntry2.NEXT() = 0;

        end;
    end;

    var
        ReservationEntry: Record "Reservation Entry";
        ReservationEntry2: Record "Reservation Entry";
}

