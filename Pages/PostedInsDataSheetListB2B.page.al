page 33000265 "Posted Ins DataSheet List B2B"
{
    // version B2BQC1.00.00

    // *******************************************************************************
    // B2B     : B2B Software Technologies
    // Project : Quality Control Addon
    // *******************************************************************************
    // VER           SIGN       DATE         DESCRIPTION
    // *******************************************************************************
    // 1.00.00       B2BQC      06-05-15     New Page.

    Caption = 'Posted Inspect Data Sheet List';
    CardPageID = "Posted Ins Data Sheet B2B";
    Editable = false;
    PageType = List;
    SourceTable = "Posted Ins DatasheetHeader B2B";
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
                    tooltip = 'selected the no.series from setup numbering tab ';
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                    tooltip = 'Description for Identification purpose for  the user';
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
                field("Item Ledger Entry No."; "Item Ledger Entry No.")
                {
                    ApplicationArea = all;
                    tooltip = 'item ledger entry no. applied no.';
                }
                field("Receipt No."; "Receipt No.")
                {
                    ApplicationArea = all;
                    tooltip ='Receipt no. on which the sample as received';
                }
                field("Posted Date"; "Posted Date")
                {
                    ApplicationArea = all;
                    tooltip = 'Date the order will post to G/L, customer, and item ledger entries';
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = all;
                    tooltip ='which data post the order to receive and ship is the posting data ';
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = all;
                    tooltip = 'This date is used to calculate the customers payment due date and finance charges';
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = all;
                    tooltip =  'enter the vendor name';
                }
                field(Address; Address)
                {
                    ApplicationArea = all;
                    tooltip = 'enter the adress';
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = all;
                    tooltip = 'enter the item number';
                }
                field("Item Description"; "Item Description")
                {
                    ApplicationArea = all;
                    tooltip = 'enter the item name ';
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = all;
                    tooltip = 'This is the total number of items being ordered';
                }
                field("Spec ID"; "Spec ID")
                {
                    ApplicationArea = all;
                    tooltip = 'Specification is a group of characteristics to be inspected of an item';
                }
                field("Inspection Group Code"; "Inspection Group Code")
                {
                    ApplicationArea = all;
                    tooltip = 'Enter the Inspection Group Code at characteristics group level';
                }
            }
        }
    }

    actions
    {
    }
}

