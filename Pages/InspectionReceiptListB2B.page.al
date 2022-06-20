page 33000271 "Inspection Receipt List B2B"
{
    // version B2BQC1.00.00

    // *******************************************************************************
    // B2B     : B2B Software Technologies
    // Project : Quality Control Addon
    // *******************************************************************************
    // VER           SIGN       DATE         DESCRIPTION
    // *******************************************************************************
    // 1.00.00       B2BQC      06-05-15     New Page.

    Caption = 'Inspection Receipt List';
    CardPageID = "Inspection Receipt B2B";
    Editable = false;
    PageType = List;
    SourceTable = "Inspection Receipt Header B2B";
    SourceTableView = WHERE(Status = FILTER(false));
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("No."; "No.")
                {
                    ApplicationArea = all;
                    tooltip = 'enter the number';              }
                field("Receipt No."; "Receipt No.")
                {
                    ApplicationArea = all;
                    tooltip = ' Receipt no. on which the sample as received';
                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = all;
                    tooltip = 'enter the vendor number selected the no.series from setup numbering tab';
                }
                field("Rework Level"; "Rework Level")
                {
                    ApplicationArea = all;
                    tooltip = 'number of times sending for vendor';
                }
                field("Rework Reference No."; "Rework Reference No.")
                {
                    ApplicationArea = all;
                    tooltip = 'At the time of receipt of the material back from the vendor, open the same document reference number';
                }
                field("Rework Inspect DS Created"; "Rework Inspect DS Created")
                {
                    ApplicationArea = all;
                    tooltip =  'material back from the the vendor again testing the material to created IDS & IR';
                }
                field("Last Rework Level"; "Last Rework Level")
                {
                    ApplicationArea = all;
                    ToolTip = 'last number of times sending for vendor';
                }
                field("Item Ledger Entry No."; "Item Ledger Entry No.")
                {
                    ApplicationArea = all;
                    tooltip = 'item tranaction the automatic generated the number for item ledger entry number';
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = all;
                    tooltip = 'enter the vendor name ';
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = all;
                    tooltip = 'enter the item number selected the no.series from  inventory setup numbering tab';
                }
                field("Purch Line No"; "Purch Line No")
                {
                    ApplicationArea = all;
                    tooltip = 'purchase order the  line mention the items ,uom ,quantity is the single line number';
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = all;
                    tooltip = 'This is the total number of items being ordered';
                }
                field("Qty. Accepted"; "Qty. Accepted")
                {
                    ApplicationArea = all;
                    tooltip = 'the inspection data sheet is quantity characteristic  approval is the accepted quantity';
                }
                field("Qty. Rejected"; "Qty. Rejected")
                {
                    ApplicationArea = all;
                    tooltip = 'the inspection data sheet is quantity characteristic is not approval the rejected quantity';
                }
                field(Status; Status)
                {
                    ApplicationArea = all;
                    ToolTip = 'Default is new. After entry of the relevant data, the status must be changed to Certified';
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
                action("Purchase Receipt")
                {
                    Caption = 'Purchase Receipt';
                    Image = Receipt;
                    RunObject = Page "Posted Purchase Receipts";
                    RunPageLink = "No." = FIELD("Receipt No.");
                    ApplicationArea = all;
                    tooltip = 'purchase receipt used for reporting and vendor analysis';
                }
            }
        }
    }

    var

}

