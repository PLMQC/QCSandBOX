page 33000256 "Quality Control Setup B2B"
{
    // version B2BQC1.00.00

    // *******************************************************************************
    // B2B     : B2B Software Technologies
    // Project : Quality Control Addon
    // *******************************************************************************
    // VER           SIGN       DATE         DESCRIPTION
    // *******************************************************************************
    // 1.00.00       B2BQC      06-05-15     New Page.

    Caption = 'Quality Control Setup';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Quality Control Setup B2B";
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Sampling Rounding"; "Sampling Rounding")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    ToolTip = 'No of lines to be generated in the Inspection data sheet will be governed by this Parameter';
                }
                field("Quality Before Receipt"; "Quality Before Receipt")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    ToolTip = 'Inspection is done before the material offered by the vendor is taken into the inventory.';
                }
                field("Posted IDS. No. is IDS No."; "Posted IDS. No. is IDS No.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    ToolTip = 'posted IDS no used for no.series';
                }
            }
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Specification Nos."; "Specification Nos.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    ToolTip = 'specification  Selected from the No.series defined in quality setup numbering tab';
                }
                field("Sub Assembly Nos."; "Sub Assembly Nos.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    ToolTip = 'sub assembly Selected from the No.series definquality setup numbering tab ';
                }
                field("Inspection Datasheet Nos."; "Inspection Datasheet Nos.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    ToolTip = 'inspection data sheet Selected from the No.series defined in quality setup numbering tab';
                }
                field("Posted Inspect. Datasheet Nos."; "Posted Inspect. Datasheet Nos.")
                {
                    ApplicationArea = all;
                    tooltip = 'posted IDS  Selected from the No.series defined in quality setup numbering tab';
                }
                field("Inspection Receipt Nos."; "Inspection Receipt Nos.")
                {
                    ApplicationArea = all;
                    tooltip = 'IDS  Selected from the No.series defined in quality setup numbering tab';
                }
               
                
                field("Production Batch No."; "Production Batch No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'production batch no. Selected from the No.series defined in Quality setup numbering tab';
                }
                field("Purchase Consignment No."; "Purchase Consignment No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'purchase consignment  Selected from the No.series defined in purchase and payable setup numbering tab';
                }
                field("Assay Nos."; "Assay Nos.")
                {
                    ApplicationArea = all;
                    tooltip = 'assay no. Selected from the No.series defined in quality setup numbering tab';
                }
            }
            group("Vendor Rating")
            {
                Caption = 'Vendor Rating';
                field("Rating Per Accepted Qty."; "Rating Per Accepted Qty.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = ' Vendor Rating per accepted quantity';
                }
                field("Rating Per Accepted UD Qty."; "Rating Per Accepted UD Qty.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip = ' Vendor Rating per accepted UD quantity';
                }
                field("Rating Per Rework Qty."; "Rating Per Rework Qty.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    tooltip =' Vendor Rating per rework quantity ';
                }
                field("Rating Per Rejected Qty."; "Rating Per Rejected Qty.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Vendor Rating per rejected quantity';
                }
            }
        }
    }

    actions
    {
    }
}

