report 60114 TriggerONreport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './triggersONreport.rdl';
    Caption = 'TriggersOnReport';
    //DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                Message('onpredataItem');
                if salesOrder <> '' then
                    "Sales Header".SetRange("No.", salesOrder)
                // else
                //"Sales Header".SetRange("No.", '');


            end;

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Message('OnAftergetrecord');
            end;


            trigger OnPostDataItem()
            var
                myInt: Integer;
            begin
                Message('OnpostDataItem');
            end;

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
                    field(salesOrder; salesOrder)
                    {
                        ApplicationArea = All;
                        Caption = 'Sales Order NO.';
                        TableRelation = "Sales Header"."No." where("Document Type" = Const(Order));
                    }

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
    trigger OnInitReport()
    var
        myInt: Integer;
    begin
        Message('OnInitReport');
    end;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        Message('OnpreReport');
    end;

    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        Message('OnPostReport');
    end;



    var
        salesOrder: Code[100];
}