report 60115 Salesquoate
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SalesquotePre.rdl';
    Caption = 'SalesQuotePre';
    //DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(Your_Reference; "Your Reference")
            { }
            column(Valid_To; "Quote Valid Until Date")
            { }
            column(Payment_Terms; "Payment Terms Code")
            { }
            column(Shipment_Method; "Shipment Method Code")
            { }
            column(No_; "No.")
            { }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column("Unit_price_Ex_Tax"; "Unit Price")
                { }
                column(Tax; "VAT %")
                { }
                column(Line_Amount; "Line Amount")
                { }

            }
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }



    var
        myInt: Integer;
}