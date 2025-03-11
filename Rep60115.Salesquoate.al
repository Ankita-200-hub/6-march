report 60119 "Salesquote"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SalesquotePre.rdl';
    Caption = 'SalesQuotePre';



    dataset
    {

        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(SalesQuote; "No.")
            { }
            column(Document_Date_01Feb; "Document Date")
            { }
            column(Your_Reference; "Your Reference")
            { }
            column(Valid_To; "Quote Valid Until Date")
            { }
            column(Payment_Terms; "Payment Terms Code")
            { }
            column(Shipment_Method; "Shipment Method Code")
            { }
            column(Bill_to_Name_Trey; "Bill-to Name")
            { }
            column(Bill_to_Contact_Helen; "Bill-to Contact")
            { }
            column(Bill_to_Address_153; "Bill-to Address")
            { }
            column(Bill_to_City_Chicago; "Bill-to City")
            { }
            column(SalesHeaderSalesPersonName; SalesHeaderSalesPersonName)
            { }
            column(SalesHeaderCountryRegionName; SalesHeaderCountryRegionName)
            { }
            column(Companyname; CompanyInfo[1])
            { }
            column(CompanyAdd; CompanyInfo[2])
            { }
            column(Companyadd2; CompanyInfo[3])
            { }
            column(CompanyaddConcat; CompanyInfo[4])
            { }
            column(CompanyRegion; CompanyInfo[5])
            { }
            column(compInfo; compInfo.Picture)
            { }
            column(CompanyMail; CompanyInfo[6])
            { }
            column(CompanyPhone; CompanyInfo[7])
            { }

            dataitem("Sales Line"; "Sales Line")
            {

                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");

                column(No; "No.")
                { }
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

            trigger OnAfterGetRecord()
            var
                SalespersonRec: Record "Salesperson/Purchaser";
                CountryRegionRec: Record "Country/Region";
            begin

                if "Salesperson Code" <> '' then begin
                    if SalespersonRec.Get("Salesperson Code") then
                        SalesHeaderSalesPersonName := SalespersonRec.Name
                    else
                        SalesHeaderSalesPersonName := '';
                end;


                if "Sell-to Country/Region Code" <> '' then begin
                    if CountryRegionRec.Get("Sell-to Country/Region Code") then
                        SalesHeaderCountryRegionName := CountryRegionRec.Name
                    else
                        SalesHeaderCountryRegionName := '';
                end;
            end;
        }


    }
    var
        SalesHeaderSalesPersonName: Text[100];
        SalesHeaderCountryRegionName: Text[100];
        compInfo: Record "Company Information";
        CompanyInfo: array[7] of Text;


    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        compInfo.Get;
        compInfo.CalcFields(Picture);
        Companyarray();
    end;

    procedure Companyarray()
    begin

        CompanyInfo[1] := compInfo.Name;
        CompanyInfo[2] := compInfo.Address;
        CompanyInfo[3] := compInfo."Address 2";
        CompanyInfo[4] := compInfo.City + ', ' + compInfo.County + compInfo."Post Code";
        CompanyInfo[5] := compInfo."Country/Region Code";
        CompanyInfo[6] := compInfo."E-Mail";
        CompanyInfo[7] := compInfo."Phone No.";
        CompressArray(CompanyInfo);
    end;

}
