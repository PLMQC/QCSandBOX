page 33000288 "Prod. Order Ins Components B2B"
{
    // version B2BQC1.00.00

    // *******************************************************************************
    // B2B     : B2B Software Technologies
    // Project : Quality Control Addon
    // *******************************************************************************
    // VER           SIGN       DATE         DESCRIPTION
    // *******************************************************************************
    // 1.00.00       B2BQC      06-05-15     New Page.

    AutoSplitKey = true;
    Caption = 'Prod. Order Components';
    DataCaptionExpression = Caption();
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Rework Component B2B";
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = all;
                    tooltip = 'enter the item number';
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                    tooltip = 'Description for Identification purpose for  the user';
                }
                field("Calculation Formula"; "Calculation Formula")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Allows to enter calculation Formaula';

                }
                field(Length; Length)
                {
                    Visible = false;
                    ApplicationArea = all;
                    tooltip = 'Defines the lenght of the field';
                }
                field(Width; Width)
                {
                    Visible = false;
                    ApplicationArea = all;
                    tooltip = 'Defines the width of the field';
                }
                field(Weight; Weight)
                {
                    Visible = false;
                    ApplicationArea = all;
                    tooltip = 'amount or quantity of heaviness or mass amount a thing weight';
                }
                field(Depth; Depth)
                {
                    Visible = false;
                    ApplicationArea = all;
                    tooltip = 'the distance from the top or surface to the bottom of something';
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    tooltip = ' unit of measure code from item unit of measure where the quantity to customer is to be dispatched';
                    ApplicationArea = all;
                }
                field("Expected Quantity"; "Expected Quantity")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines the Quantity that need to produced';
                }
                field("Remaining Quantity"; "Remaining Quantity")
                {
                    ApplicationArea = all;
                    tooltip = 'Defines the Quantity need to produce';
                }
                field("Location Code"; "Location Code")
                {
                    Visible = false;
                    ApplicationArea = all;
                    tooltip = 'Mention the location code from which the inventory is to be dispatched';
                }
                field("Quantity Consumed"; "Quantity Consumed")
                {
                    Editable = false;
                    ApplicationArea = all;
                    tooltip = 'how much quantity quantity consumed';
                }
                field("Unit Cost"; "Unit Cost")
                {
                    Visible = false;
                    ApplicationArea = all;
                    tooltip = 'price of each items is the unit cost';
                }
                field("Cost Amount"; "Cost Amount")
                {
                    Visible = false;
                    ApplicationArea = all;
                    tooltip = 'each item price is cost of amount';
                }
                field(Position; Position)
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Defines the level of position';
                }
                field("Position 2"; "Position 2")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Defines the level of position';
                }
                field("Position 3"; "Position 3")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Defines the level of position';
                }
                field("Production Lead Time"; "Production Lead Time")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Defines the time need to produce the item';
                }
            }
        }
    }

    actions
    {
    }

    var
}

