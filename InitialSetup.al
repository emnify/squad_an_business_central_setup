/*
* Mandatory table, pages and code units for connector setup and delete capture.
*/
table 90000 "Custom Subscription"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; id; Guid)
        {
            caption = 'Id';
        }
        field(2; url; Text[200])
        {
            caption = 'URL';
        }
        field(3; recordsDeleted; BigInteger)
        {
            caption = 'Records Deleted';
        }
        field(4; companyId; Text[200])
        {
            caption = 'Company ID';
        }
        field(5; tableId; Integer)
        {
            caption = 'Table ID';
        }
    }
    trigger OnInsert()
    begin
        id := System.CreateGuid();
    end;
}

page 90000 "API Custom Subscription"
{
    PageType = API;
    ApplicationArea = All;
    SourceTable = "Custom Subscription";
    APIVersion = 'v1.0';
    APIPublisher = 'fivetran';
    APIGroup = 'webhook';
    EntityName = 'customSubscription';
    EntitySetName = 'customSubscriptions';
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    Extensible = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(id; Rec.id) { }
                field(url; Rec.url) { }
                field(recordsDeleted; Rec.recordsDeleted) { }
                field(tableId; Rec.tableId) { }
                field(companyId; Rec.companyId) { }
                field(systemCreatedAt; Rec.SystemCreatedAt) { }
                field(systemModifiedAt; Rec.SystemModifiedAt) { }
                field(systemId; Rec.SystemId) { }

            }
        }
    }
}

page 90001 "Page metadata"
{
    APIPublisher = 'fivetran';
    DataAccessIntent = ReadOnly;
    APIGroup = 'metadata';
    APIVersion = 'v1.0';
    Editable = false;
    EntityName = 'pageMetadata';
    EntitySetName = 'pageMetadata';
    DelayedInsert = true;
    PageType = API;
    SourceTable = "Page Metadata";
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(apiGroup; Rec.APIGroup)
                {
                    Caption = 'APIGroup';
                }
                field(apiPublisher; Rec.APIPublisher)
                {
                    Caption = 'APIPublisher';
                }
                field(apiVersion; Rec.APIVersion)
                {
                    Caption = 'APIVersion';
                }
                field(autoSplitKey; Rec.AutoSplitKey)
                {
                    Caption = 'AutoSplitKey';
                }
                field(caption; Rec.Caption)
                {
                    Caption = 'Caption';
                }
                field(cardPageID; Rec.CardPageID)
                {
                    Caption = 'CardPageID';
                }
                field(changeTrackingAllowed; Rec.ChangeTrackingAllowed)
                {
                    Caption = 'ChangeTrackingAllowed';
                }
                field(dataCaptionExpr; Rec."DataCaptionExpr.")
                {
                    Caption = 'DataCaptionExpr.';
                }
                field(dataCaptionFields; Rec.DataCaptionFields)
                {
                    Caption = 'DataCaptionFields';
                }
                field(delayedInsert; Rec.DelayedInsert)
                {
                    Caption = 'DelayedInsert';
                }
                field(deleteAllowed; Rec.DeleteAllowed)
                {
                    Caption = 'DeleteAllowed';
                }
                field(editable; Rec.Editable)
                {
                    Caption = 'Editable';
                }
                field(entityName; Rec.EntityName)
                {
                    Caption = 'EntityName';
                }
                field(entitySetName; Rec.EntitySetName)
                {
                    Caption = 'EntitySetName';
                }
                field(id; Rec.ID)
                {
                    Caption = 'ID';
                }
                field(insertAllowed; Rec.InsertAllowed)
                {
                    Caption = 'InsertAllowed';
                }
                field(linksAllowed; Rec.LinksAllowed)
                {
                    Caption = 'LinksAllowed';
                }
                field(modifyAllowed; Rec.ModifyAllowed)
                {
                    Caption = 'ModifyAllowed';
                }
                field(multipleNewLines; Rec.MultipleNewLines)
                {
                    Caption = 'MultipleNewLines';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(pageType; Rec.PageType)
                {
                    Caption = 'PageType';
                }
                field(populateAllFields; Rec.PopulateAllFields)
                {
                    Caption = 'PopulateAllFields';
                }
                field(refreshOnActivate; Rec.RefreshOnActivate)
                {
                    Caption = 'RefreshOnActivate';
                }
                field(saveValues; Rec.SaveValues)
                {
                    Caption = 'SaveValues';
                }
                field(showFilter; Rec.ShowFilter)
                {
                    Caption = 'ShowFilter';
                }
                field(sourceTable; Rec.SourceTable)
                {
                    Caption = 'SourceTable';
                }
                field(sourceTableTemporary; Rec.SourceTableTemporary)
                {
                    Caption = 'SourceTableTemporary';
                }
                field(sourceTableView; Rec.SourceTableView)
                {
                    Caption = 'SourceTableView';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}

page 90002 "Table Metadata"
{
    APIGroup = 'metadata';
    APIPublisher = 'fivetran';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'tableMetadata';
    DelayedInsert = true;
    EntityName = 'tableMetadata';
    EntitySetName = 'tableMetadata';
    PageType = API;
    SourceTable = "Table Metadata";
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(caption; Rec.Caption)
                {
                    Caption = 'Caption';
                }
                field(compressionType; Rec.CompressionType)
                {
                    Caption = 'CompressionType';
                }
                field(dataCaptionFields; Rec.DataCaptionFields)
                {
                    Caption = 'DataCaptionFields';
                }
                field("dataClassification"; Rec."DataClassification")
                {
                    Caption = 'DataClassification';
                }
                field(dataIsExternal; Rec.DataIsExternal)
                {
                    Caption = 'DataIsExternal';
                }
                field(dataPerCompany; Rec.DataPerCompany)
                {
                    Caption = 'DataPerCompany';
                }
                field(drillDownPageId; Rec.DrillDownPageId)
                {
                    Caption = 'DrillDownPageId';
                }
                field(externalName; Rec.ExternalName)
                {
                    Caption = 'ExternalName';
                }
                field(id; Rec.ID)
                {
                    Caption = 'ID';
                }
                field(linkedObject; Rec.LinkedObject)
                {
                    Caption = 'LinkedObject';
                }
                field(lookupPageID; Rec.LookupPageID)
                {
                    Caption = 'LookupPageID';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(obsoleteReason; Rec.ObsoleteReason)
                {
                    Caption = 'ObsoleteReason';
                }
                field(obsoleteState; Rec.ObsoleteState)
                {
                    Caption = 'ObsoleteState';
                }
                field(pasteIsValid; Rec.PasteIsValid)
                {
                    Caption = 'PasteIsValid';
                }
                field(replicateData; Rec.ReplicateData)
                {
                    Caption = 'ReplicateData';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
                field(tableType; Rec.TableType)
                {
                    Caption = 'TableType';
                }
            }
        }
    }
}

permissionset 90000 FIVETRAN_SETUP
{
    Assignable = true;
    Permissions =
        tabledata "Custom Subscription" = RM,
        table "Custom Subscription" = X,
        codeunit FivetranGlobalEventHandle = X;
}

codeunit 90101 FivetranGlobalEventHandle
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Global Triggers", 'GetDatabaseTableTriggerSetup', '', true, true)]
    local procedure GetDatabaseTableTriggerSetup(TableId: Integer; var OnDatabaseInsert: Boolean; var OnDatabaseModify: Boolean; var OnDatabaseDelete: Boolean)
    begin
        OnDatabaseInsert := false;
        OnDatabaseModify := false;
        OnDatabaseDelete := true;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Global Triggers", 'OnDatabaseDelete', '', true, true)]
    local procedure OnDatabaseDelete(RecRef: RecordRef)
    var
        JSONObject: JsonObject;
        json: Text[1200];
        client: HttpClient;
        Response: HttpResponseMessage;
        content: HttpContent;
        systemModifiedAt: DateTime;
        contentHeaders: HttpHeaders;
        urlToUse: Text[200];
        subscription: Record "Custom Subscription";
        company: Record Company;
        systemId: Text[200];
        recordOfSharedTable: Boolean;
    begin
        recordOfSharedTable := false;

        subscription.SetCurrentKey(tableId);
        subscription.SetFilter(tableId, Format(RecRef.Number()));

        if (subscription.FindFirst()) then begin
            if (subscription.companyId = 'ALL') then begin
                recordOfSharedTable := true;
            end;
        end;

        if (not recordOfSharedTable) then begin
            company.Get(RecRef.CurrentCompany);
            subscription.SetCurrentKey(companyId, tableId);
            subscription.SetFilter(tableId, Format(RecRef.Number()));
            subscription.SetFilter(companyId, Format(company.Id).ToLower().Replace('{', '').Replace('}', ''));
        end;


        if subscription.FindSet() then begin
            JSONObject.Add('tableId', RecRef.Number());
            JSONObject.Add('companyId', Format(company.Id).ToLower().Replace('{', '').Replace('}', ''));
            JSONObject.Add('position', RecRef.GetPosition());
            JSONObject.Add('payloadId', '');
            JSONObject.Add('systemId', Format(RecRef.Field(2000000000).Value).ToLower().Replace('{', '').Replace('}', ''));
            systemModifiedAt := RecRef.Field(RecRef.SystemModifiedAtNo).Value;
            JSONObject.Add('systemModifiedAt', systemModifiedAt);
            repeat
                subscription.recordsDeleted := subscription.recordsDeleted + 1;
                subscription.Modify();
                JSONObject.Replace('payloadId', subscription.recordsDeleted);
                Client.Clear();
                JSONObject.WriteTo(json);
                Content.WriteFrom(json);
                content.GetHeaders(contentHeaders);
                contentHeaders.Clear();
                contentHeaders.Add('Content-Type', 'application/json');
                urlToUse := subscription.url;
                Client.Post(urlToUse, Content, Response);
            until subscription.Next() = 0;
        end;
    end;
}

/*
* Pages for few of the standard tables, which exposes the all of the supported columns.
*/
page 90009 "API- Currency Exchange Rates"
{
    APIVersion = 'v1.0';
    APIPublisher = 'fivetran';
    APIGroup = 'standardEndpoints';
    DataAccessIntent = ReadOnly;
    Editable = false;
    EntityCaption = 'Currency Exchange Rate';
    EntitySetCaption = 'Currency Exchange Rates';
    EntityName = 'currencyExchangeRate';
    EntitySetName = 'currencyExchangeRates';
    PageType = API;
    SourceTable = "Currency Exchange Rate";
    ODataKeyFields = SystemId;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(adjustmentExchRateAmount; Rec."Adjustment Exch. Rate Amount")
                {
                    Caption = 'Adjustment Exch. Rate Amount';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(exchangeRateAmount; Rec."Exchange Rate Amount")
                {
                    Caption = 'Exchange Rate Amount';
                }
                field(fixExchangeRateAmount; Rec."Fix Exchange Rate Amount")
                {
                    Caption = 'Fix Exchange Rate Amount';
                }
                field(relationalAdjmtExchRateAmt; Rec."Relational Adjmt Exch Rate Amt")
                {
                    Caption = 'Relational Adjmt Exch Rate Amt';
                }
                field(relationalCurrencyCode; Rec."Relational Currency Code")
                {
                    Caption = 'Relational Currency Code';
                }
                field(relationalExchRateAmount; Rec."Relational Exch. Rate Amount")
                {
                    Caption = 'Relational Exch. Rate Amount';
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}