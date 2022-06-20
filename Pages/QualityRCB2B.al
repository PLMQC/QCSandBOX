page 33000304 "Quality RC B2B"
{
    Caption = 'Quality';
    PageType = RoleCenter;
    actions
    {
        area(Sections)
        {
            group("Group")
            {
                Caption = 'Tasks';

                action("&Specification")
                {
                    Caption = 'Specifications';
                    RunObject = Page "Specification List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Sub Assembly")
                {
                    RunObject = Page "Sub Assembly List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Inspection Data Sheet")
                {
                    RunObject = Page "Inspection Data Sheet List B2B";
                    ApplicationArea = Manufacturing;
                }

                action("Inspection Receipt")
                {
                    RunObject = Page "Inspection Receipt List B2B";
                    ApplicationArea = Manufacturing;
                }
            }
            group("Reports")
            {
                action("Inspection Data Sheets")
                {
                    RunObject = report "Inspection Data Sheet B2B";
                    ApplicationArea = Manufacturing;
                }
                action(Specification)
                {
                    RunObject = report "Specification B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Inspection Receipts")
                {
                    RunObject = report "Inspection Receipt B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Receipt Quantity Received Status")
                {
                    RunObject = report "Receipt-Qty Rec Status B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Item Receipt")
                {
                    RunObject = report "Item Receipt B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Item Vendor Qc Analysis")
                {
                    RunObject = report "Item Vendor Qc Analysis B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Vendor rating")
                {
                    RunObject = report "Vendor Rating B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Items In Quality")
                {
                    RunObject = report "Items In Quality B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Daily Inspection Data Sheets")
                {
                    RunObject = report "Daily Ins Data Sheet B2B";
                    ApplicationArea = Manufacturing;
                }
                action("IR Report")
                {
                    RunObject = report "Item Receipt B2B";
                    ApplicationArea = Manufacturing;
                }

                action("Items Wise Quality")
                {
                    RunObject = report "Items In Quality B2B";
                    ApplicationArea = Manufacturing;
                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                action("Posted IDS List")
                {
                    RunObject = Page "Posted Ins DataSheet List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Posted IRS List")
                {
                    RunObject = Page "Posted Ins Receipt List B2B";
                    ApplicationArea = Manufacturing;
                }
            }
            group("Administration")
            {
                action("Quality Control Setup")
                {
                    RunObject = Page "Quality Control Setup B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Inspection Group")
                {
                    RunObject = Page "Inspection Groups B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Characteristics")
                {
                    RunObject = Page "Characteristics B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Sampling Plan List")
                {
                    RunObject = Page "Sampling Plan List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Quality Reason Codes")
                {
                    RunObject = Page "Quality Reason Codes B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Acceptance Levels")
                {
                    RunObject = Page "Acceptance Levels B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Assays")
                {
                    RunObject = Page "Assay List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Specification List")
                {
                    RunObject = Page "Specification List B2B";
                    ApplicationArea = Manufacturing;
                }
            }
        }
    }
}