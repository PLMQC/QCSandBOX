page 33000259 "Inspection Data Sheet List B2B"
{
    // version B2BQC1.00.00

    // *******************************************************************************
    // B2B     : B2B Software Technologies
    // Project : Quality Control Addon
    // *******************************************************************************
    // VER           SIGN       DATE         DESCRIPTION
    // *******************************************************************************
    // 1.00.00       B2BQC      06-05-15     New Page.

    Caption = 'Inspection Data Sheet List';
    CardPageID = "Inspection Data Sheet B2B";
    Editable = false;
    PageType = List;
    SourceTable = "Ins Datasheet Header B2B";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("No."; "No.")
                {
                    ApplicationArea = all;
                    tooltip = 'No.series defined setup numbering tab';
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                    tooltip = 'Description for Identification purpose for  the user';
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = all;
                    tooltip ='Date the order will post to G/L, customer, and item ledger entries';
                }
                field("Rework Level"; "Rework Level")
                {
                    ApplicationArea = all;
                    tooltip = 'any items remark the quantity is the rework level';
                }
                field("Rework Reference No."; "Rework Reference No.")
                {
                    ApplicationArea = all;
                    tooltip = 'identified the rework refernce number used';
                }
                field("Item Ledger Entry No."; "Item Ledger Entry No.")
                {
                    ApplicationArea = all;
                    tooltip = 'transaction item the item ledger entry no';
                }
                field("Lot No."; "Lot No.")
                {
                    ApplicationArea = all;
                    tooltip = 'lot numbers but it is required by the item tracking code applied to this item';
                }
                field("Inspection Group Code"; "Inspection Group Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'inspection group that is responsible for inspection of the group of characters enlisted between Begin and end';
                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = all;
                    tooltip = ' vendor number Selected from the No.series defined purchase & payable setup numbering tab';
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = all;
                    tooltip = 'item no Selected from the No.series defined manufacturing setup numbering tab';
                }
                field("Item Description"; "Item Description")
                {
                    ApplicationArea = all;
                    tooltip = 'enter the item name';
                }
                field("Order No."; "Order No.")
                {
                    ApplicationArea = all;
                    tooltip = 'enter the order number identified users';
                }
                field("Receipt No."; "Receipt No.")
                {
                    ApplicationArea = all;
                    tooltip = 'Receipt no. on which the sample as received';
                }
            }
        }
    }

    actions
    {
    }
}

