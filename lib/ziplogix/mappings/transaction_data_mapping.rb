module Ziplogix
  class TransactionDataMapping
    include Kartograph::DSL

    kartograph do
      mapping TransactionData

      scoped :create, :update do
        property :buyer1_first_name,                    key: 'Other_Buyer1_FirstName'
        property :buyer1_middle_name,                   key: 'Other_Buyer1_MiddleName'
        property :buyer1_last_name,                     key: 'Other_Buyer1_LastName'
        property :buyer1_full_name,                     key: 'Other_Buyer1_FullName'
        property :buyer1_email,                         key: 'Other_Buyer1_ContactInformation_Email'

        property :buyer2_first_name,                    key: 'Other_Buyer2_FirstName'
        property :buyer2_middle_name,                   key: 'Other_Buyer2_MiddleName'
        property :buyer2_last_name,                     key: 'Other_Buyer2_LastName'
        property :buyer2_full_name,                     key: 'Other_Buyer2_FullName'
        property :buyer2_email,                         key: 'Other_Buyer2_ContactInformation_Email'

        property :seller1_first_name,                   key: 'Other_Seller1_FirstName'
        property :seller1_middle_name,                  key: 'Other_Seller1_MiddleName'
        property :seller1_last_name,                    key: 'Other_Seller1_LastName'
        property :seller1_full_name,                    key: 'Other_Seller1_FullName'
        property :seller1_email,                        key: 'Other_Seller1_ContactInformation_Email'

        property :seller2_first_name,                   key: 'Other_Seller2_FirstName'
        property :seller2_middle_name,                  key: 'Other_Seller2_MiddleName'
        property :seller2_last_name,                    key: 'Other_Seller2_LastName'
        property :seller2_full_name,                    key: 'Other_Seller2_FullName'
        property :seller2_email,                        key: 'Other_Seller2_ContactInformation_Email'

        property :list_agent_full_name,                 key: 'REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_FullName'
        property :list_agent_cell_phone,                key: 'REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_ContactInformation_CellPhone'
        property :list_agent_office_phone,              key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_ContactInformation_OfficePhone'
        property :list_agent_email,                     key: 'REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_ContactInformation_Email'

        property :sale_agent_full_name,                 key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_FullName'
        property :sale_agent_cell_phone,                key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_ContactInformation_CellPhone'
        property :sale_agent_office_phone,              key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_ContactInformation_OfficePhone'
        property :sale_agent_email,                     key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_ContactInformation_Email'


        property :property_listing_id,                  key: 'REData_REProperties_ResidentialProperty_Listing_ListingID'
        property :property_street_address,              key: 'REData_REProperties_ResidentialProperty_Listing_StreetAddress_CompositeAddress'
        property :property_city,                        key: 'REData_REProperties_ResidentialProperty_Listing_StreetAddress_City'
        property :property_state,                       key: 'REData_REProperties_ResidentialProperty_Listing_StreetAddress_StateOrProvince'
        property :property_zip,                         key: 'REData_REProperties_ResidentialProperty_Listing_StreetAddress_PostalCode'

        property :property_county,                      key: 'REData_REProperties_ResidentialProperty_Listing_GeographicData_County'

        property :property_school_district,             key: 'REData_REProperties_ResidentialProperty_Listing_SchoolData_SchoolDistrict'
        property :property_description,                 key: 'REData_REProperties_ResidentialProperty_Listing_ListingData_Remarks'
        property :property_subdivision,                 key: 'REData_REProperties_ResidentialProperty_Subdivision'
        property :property_condo_fee,                   key: 'REData_REProperties_ResidentialProperty_AssociationFee'
        property :property_year_built,                  key: 'REData_REProperties_ResidentialProperty_YearBuilt'

        property :property_list_date,                   key: 'REData_REProperties_ResidentialProperty_Listing_ListingData_ListDate'
        property :property_list_price,                  key: 'REData_REProperties_ResidentialProperty_Listing_ListingData_ListPrice'

        property :property_contract_date,               key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_ContractDate'
        property :property_close_price,                 key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_ClosePrice'
        property :property_close_date,                  key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_CloseDate'

        property :property_listing_commission_percent,  key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_ListingCommissionPercent'
        property :property_listing_commission_amount,   key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_ListingCommissionAmount'
        property :property_admin_transaction_fee,       key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_AdminTransactionFee'
        property :property_other_deductions,            key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_OtherDeductions'
        property :property_agent_one_split_percent,     key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_AgentOneSplitPercent'
        property :property_agent_one_split_amount,      key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_AgentOneSplitAmount'
        property :property_agent_one_split_name,        key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_AgentOneSplitName'
        property :property_agent_two_split_percent,     key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_AgentTwoSplitPercent'
        property :property_agent_two_split_amount,      key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_AgentTwoSplitAmount'
        property :property_agent_two_split_name,        key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_AgentTwoSplitName'
        property :property_agent_one_net,               key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_AgentOneNet'
        property :property_agent_owo_net,               key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_AgentTwoNet'
        property :property_office_commission_net,       key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_OfficeCommissionNet'

        property :property_buyer_commission_percent,    key: 'REData_REProperties_ResidentialProperty_BuySideData_BuyerCommissionPercent'
        property :property_buyer_commission_amount,     key: 'REData_REProperties_ResidentialProperty_BuySideData_BuyerCommissionAmount'
        property :property_admin_transaction_fee,       key: 'REData_REProperties_ResidentialProperty_BuySideData_AdminTransactionFee'
        property :property_other_deductions,            key: 'REData_REProperties_ResidentialProperty_BuySideData_OtherDeductions'
        property :property_referring_agent_fee_percent, key: 'REData_REProperties_ResidentialProperty_BuySideData_ReferringAgentFeePercent'
        property :property_referring_agent_fee_amount,  key: 'REData_REProperties_ResidentialProperty_BuySideData_ReferringAgentFeeAmount'
        property :property_referring_agent_name,        key: 'REData_REProperties_ResidentialProperty_BuySideData_ReferringAgentName'
        property :property_agent_one_split_percent,     key: 'REData_REProperties_ResidentialProperty_BuySideData_AgentOneSplitPercent'
        property :property_agent_one_split_amount,      key: 'REData_REProperties_ResidentialProperty_BuySideData_AgentOneSplitAmount'
        property :property_agent_one_split_name,        key: 'REData_REProperties_ResidentialProperty_BuySideData_AgentOneSplitName'
        property :property_agent_two_split_percent,     key: 'REData_REProperties_ResidentialProperty_BuySideData_AgentTwoSplitPercent'
        property :property_agent_two_split_amount,      key: 'REData_REProperties_ResidentialProperty_BuySideData_AgentTwoSplitAmount'
        property :property_agent_two_split_name,        key: 'REData_REProperties_ResidentialProperty_BuySideData_AgentTwoSplitName'
        property :property_agent_one_net,               key: 'REData_REProperties_ResidentialProperty_BuySideData_AgentOneNet'
        property :property_agent_two_net,               key: 'REData_REProperties_ResidentialProperty_BuySideData_AgentTwoNet'
        property :property_office_commission_net,       key: 'REData_REProperties_ResidentialProperty_BuySideData_OfficeCommissionNet'

        property :file_name,                            key: 'Other_ZFMetadata_ZFFilename'
        property :broker_name,                          key: 'Other_ZFMetadata_ZFBrokerName'
        property :user_name,                            key: 'Other_ZFMetadata_ZFUserName_Name'
        property :user_office_phone,                    key: 'Other_ZFMetadata_ZFUserName_OfficePhone'
        property :user_fax_number,                      key: 'Other_ZFMetadata_ZFUserName_Fax'
      end

      scoped :read do
        property :file_name,              key: 'Other_ZFMetadata_ZFFilename'
        property :broker_name,            key: 'Other_ZFMetadata_ZFBrokerName'
        property :user_name,              key: 'Other_ZFMetadata_ZFUserName_Name'
        property :user_office_phone,      key: 'Other_ZFMetadata_ZFUserName_OfficePhone'
        property :user_fax_number,        key: 'Other_ZFMetadata_ZFUserName_Fax'
        property :user_composite_address, key: 'Other_ZFMetadata_ZFUserName_CompositeAddress'

        property :buyer1_first_name,      key: 'Other_Buyer1_FirstName'
        property :buyer1_middle_name,     key: 'Other_Buyer1_MiddleName'
        property :buyer1_last_name,       key: 'Other_Buyer1_LastName'
        property :buyer1_full_name,       key: 'Other_Buyer1_FullName'
        property :buyer1_email,           key: 'Other_Buyer1_ContactInformation_Email'

        property :buyer2_first_name,      key: 'Other_Buyer2_FirstName'
        property :buyer2_middle_name,     key: 'Other_Buyer2_MiddleName'
        property :buyer2_last_name,       key: 'Other_Buyer2_LastName'
        property :buyer2_full_name,       key: 'Other_Buyer2_FullName'
        property :buyer2_email,           key: 'Other_Buyer2_ContactInformation_Email'

        property :seller1_first_name,     key: 'Other_Seller1_FirstName'
        property :seller1_middle_name,    key: 'Other_Seller1_MiddleName'
        property :seller1_last_name,      key: 'Other_Seller1_LastName'
        property :seller1_full_name,      key: 'Other_Seller1_FullName'
        property :seller1_email,          key: 'Other_Seller1_ContactInformation_Email'

        property :seller2_first_name,     key: 'Other_Seller2_FirstName'
        property :seller2_middle_name,    key: 'Other_Seller2_MiddleName'
        property :seller2_last_name,      key: 'Other_Seller2_LastName'
        property :seller2_full_name,      key: 'Other_Seller2_FullName'
        property :seller2_email,          key: 'Other_Seller2_ContactInformation_Email'

        property :list_agent_full_name,   key: 'REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_FullName'
        property :list_agent_email,       key: 'REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_ContactInformation_Email'
        property :sale_agent_full_name,   key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_FullName'
        property :sale_agent_email,       key: 'REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_ContactInformation_Email'

        property :property_listing_id,    key: 'REData_REProperties_ResidentialProperty_Listing_ListingID'
      end

    end

  end
end




# Full Set of Values

# REData_REProperties_ResidentialProperty_Listing_StreetAddress_CompositeAddress
# REData_REProperties_ResidentialProperty_Listing_StreetAddress_City
# REData_REProperties_ResidentialProperty_Listing_StreetAddress_StateOrProvince
# REData_REProperties_ResidentialProperty_Listing_StreetAddress_PostalCode
# REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_FullName
# REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_ContactInformation_OfficePhone
# REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_ContactInformation_CellPhone
# REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_ContactInformation_Pager
# REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_ContactInformation_Email
# REData_REProperties_ResidentialProperty_Listing_ListingData_REAgent_AgentID
# REData_REProperties_ResidentialProperty_Listing_ListingData_REOffice_Name
# REData_REProperties_ResidentialProperty_Listing_ListingData_REOffice_ContactInformation_OfficePhone
# REData_REProperties_ResidentialProperty_Listing_ListingData_REOffice_ContactInformation_Fax
# REData_REProperties_ResidentialProperty_Listing_ListingData_REOffice_StreetAddress_CompositeAddres
# REData_REProperties_ResidentialProperty_Listing_ListingData_REOffice_StreetAddress_City
# REData_REProperties_ResidentialProperty_Listing_ListingData_REOffice_StreetAddress_StateOrProvince
# REData_REProperties_ResidentialProperty_Listing_ListingData_REOffice_StreetAddress_PostalCode
# REData_REProperties_ResidentialProperty_Listing_ListingData_REOffice_OfficeID
# REData_REProperties_ResidentialProperty_Listing_ListingData_ListDate
# REData_REProperties_ResidentialProperty_Listing_ListingData_ListPrice
# REData_REProperties_ResidentialProperty_Listing_ListingData_ExpirationDate

# REData_REProperties_ResidentialProperty_Listing_ListingData_Remarks
# REData_REProperties_ResidentialProperty_Listing_GeographicData_County
# REData_REProperties_ResidentialProperty_Listing_ListingID
# REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_FullName
# REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_ContactInformation_OfficePhone
# REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_ContactInformation_CellPhone
# REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_ContactInformation_Pager
# REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_ContactInformation_Email
# REData_REProperties_ResidentialProperty_Listing_SalesData_REAgent_AgentID
# REData_REProperties_ResidentialProperty_Listing_SalesData_REOffice_Name
# REData_REProperties_ResidentialProperty_Listing_SalesData_REOffice_ContactInformation_OfficePhone
# REData_REProperties_ResidentialProperty_Listing_SalesData_REOffice_ContactInformation_Fax
# REData_REProperties_ResidentialProperty_Listing_SalesData_REOffice_StreetAddress_CompositeAddress
# REData_REProperties_ResidentialProperty_Listing_SalesData_REOffice_StreetAddress_City
# REData_REProperties_ResidentialProperty_Listing_SalesData_REOffice_StreetAddress_StateOrProvince
# REData_REProperties_ResidentialProperty_Listing_SalesData_REOffice_StreetAddress_PostalCode
# REData_REProperties_ResidentialProperty_Listing_SalesData_REOffice_OfficeID
# REData_REProperties_ResidentialProperty_Listing_SalesData_ContractDate
# REData_REProperties_ResidentialProperty_Listing_SalesData_ClosePrice
# REData_REProperties_ResidentialProperty_Listing_SalesData_CloseDate
# REData_REProperties_ResidentialProperty_Listing_SalesData_AmountFinanced
# REData_REProperties_ResidentialProperty_Listing_SchoolData_SchoolDistrict
# REData_REProperties_ResidentialProperty_Listing_TaxData_TaxID
# REData_REProperties_ResidentialProperty_Listing_TaxData_County
# REData_REProperties_ResidentialProperty_Listing_TaxData_LegalDescription
# REData_REProperties_ResidentialProperty_Listing_ParcelNumber
# REData_REProperties_ResidentialProperty_Subdivision
# REData_REProperties_ResidentialProperty_AssociationFee
# REData_REProperties_ResidentialProperty_YearBuilt
# Other_Seller1_FirstName
# Other_Seller1_MiddleName
# Other_Seller1_LastName
# Other_Seller1_FullName
# Other_Seller1_Relationship
# Other_Seller1_StreetAddress_CompositeAddress
# Other_Seller1_StreetAddress_City
# Other_Seller1_StreetAddress_StateOrProvince
# Other_Seller1_StreetAddress_PostalCode
# Other_Seller1_ContactInformation_OfficePhone
# Other_Seller1_ContactInformation_CellPhone
# Other_Seller1_ContactInformation_HomePhone
# Other_Seller1_ContactInformation_Fax
# Other_Seller1_ContactInformation_Email
# Other_Seller2_FirstName

# Other_Seller2_MiddleName
# Other_Seller2_LastName
# Other_Seller2_FullName
# Other_Seller2_Relationship
# Other_Seller2_StreetAddress_CompositeAddress
# Other_Seller2_StreetAddress_City
# Other_Seller2_StreetAddress_StateOrProvince
# Other_Seller2_StreetAddress_PostalCode
# Other_Seller2_ContactInformation_OfficePhone
# Other_Seller2_ContactInformation_CellPhone
# Other_Seller2_ContactInformation_HomePhone
# Other_Seller2_ContactInformation_Fax
# Other_Seller2_ContactInformation_Email
# Other_Buyer1_FirstName
# Other_Buyer1_MiddleName
# Other_Buyer1_LastName
# Other_Buyer1_FullName
# Other_Buyer1_Relationship
# Other_Buyer1_StreetAddress_CompositeAddress
# Other_Buyer1_StreetAddress_City
# Other_Buyer1_StreetAddress_StateOrProvince
# Other_Buyer1_StreetAddress_PostalCode
# Other_Buyer1_ContactInformation_OfficePhone
# Other_Buyer1_ContactInformation_CellPhone
# Other_Buyer1_ContactInformation_HomePhone
# Other_Buyer1_ContactInformation_Fax
# Other_Buyer1_ContactInformation_Email
# Other_Buyer2_FirstName
# Other_Buyer2_MiddleName
# Other_Buyer2_LastName
# Other_Buyer2_FullName
# Other_Buyer2_Relationship
# Other_Buyer2_StreetAddress_CompositeAddress
# Other_Buyer2_StreetAddress_City
# Other_Buyer2_StreetAddress_StateOrProvince
# Other_Buyer2_StreetAddress_PostalCode
# Other_Buyer2_ContactInformation_OfficePhone
# Other_Buyer2_ContactInformation_CellPhone
# Other_Buyer2_ContactInformation_HomePhone
# Other_Buyer2_ContactInformation_Fax
# Other_Buyer2_ContactInformation_Email
# Other_AdditionalInfo_Attorneys_Sellers_Name
# Other_AdditionalInfo_Attorneys_Sellers_StreetAddress_CompositeAddress
# Other_AdditionalInfo_Attorneys_Sellers_StreetAddress_City

# Other_AdditionalInfo_Attorneys_Sellers_StreetAddress_StateOrProvince
# Other_AdditionalInfo_Attorneys_Sellers_StreetAddress_PostalCode
# Other_AdditionalInfo_Attorneys_Sellers_ContactName
# Other_AdditionalInfo_Attorneys_Sellers_ContactInformation_OfficePhone
# Other_AdditionalInfo_Attorneys_Sellers_ContactInformation_Fax
# Other_AdditionalInfo_Attorneys_Sellers_ContactInformation_Email
# Other_AdditionalInfo_Attorneys_Buyers_Name
# Other_AdditionalInfo_Attorneys_Buyers_StreetAddress_CompositeAddress
# Other_AdditionalInfo_Attorneys_Buyers_StreetAddress_City
# Other_AdditionalInfo_Attorneys_Buyers_StreetAddress_StateOrProvince
# Other_AdditionalInfo_Attorneys_Buyers_StreetAddress_PostalCode
# Other_AdditionalInfo_Attorneys_Buyers_ContactName
# Other_AdditionalInfo_Attorneys_Buyers_ContactInformation_OfficePhone
# Other_AdditionalInfo_Attorneys_Buyers_ContactInformation_Fax
# Other_AdditionalInfo_Attorneys_Buyers_ContactInformation_Email
# Other_AdditionalInfo_Appraiser_Name
# Other_AdditionalInfo_Appraiser_StreetAddress_CompositeAddress
# Other_AdditionalInfo_Appraiser_StreetAddress_City
# Other_AdditionalInfo_Appraiser_StreetAddress_StateOrProvince
# Other_AdditionalInfo_Appraiser_StreetAddress_PostalCode
# Other_AdditionalInfo_Appraiser_ContactName
# Other_AdditionalInfo_Appraiser_ContactInformation_OfficePhone
# Other_AdditionalInfo_Appraiser_ContactInformation_CellPhone
# Other_AdditionalInfo_Appraiser_ContactInformation_Fax
# Other_AdditionalInfo_Appraiser_ContactInformation_Pager
# Other_AdditionalInfo_Appraiser_ContactInformation_Email
# Other_AdditionalInfo_Escrow_Name
# Other_AdditionalInfo_Escrow_StreetAddress_CompositeAddress
# Other_AdditionalInfo_Escrow_StreetAddress_City
# Other_AdditionalInfo_Escrow_StreetAddress_StateOrProvince
# Other_AdditionalInfo_Escrow_StreetAddress_PostalCode
# Other_AdditionalInfo_Escrow_ContactName
# Other_AdditionalInfo_Escrow_ContactInformation_OfficePhone
# Other_AdditionalInfo_Escrow_ContactInformation_Fax
# Other_AdditionalInfo_Escrow_ContactInformation_Email
# Other_AdditionalInfo_Escrow_CaseNumber
# Other_AdditionalInfo_Lender_Name
# Other_AdditionalInfo_Lender_StreetAddress_CompositeAddress
# Other_AdditionalInfo_Lender_StreetAddress_City
# Other_AdditionalInfo_Lender_StreetAddress_StateOrProvince
# Other_AdditionalInfo_Lender_StreetAddress_PostalCode
# Other_AdditionalInfo_Lender_ContactName
# Other_AdditionalInfo_Lender_ContactInformation_OfficePhone
# Other_AdditionalInfo_Lender_ContactInformation_CellPhone

# Other_AdditionalInfo_Lender_ContactInformation_Fax
# Other_AdditionalInfo_Lender_ContactInformation_Pager
# Other_AdditionalInfo_Lender_ContactInformation_Email
# Other_AdditionalInfo_Lender_LoanNumber
# Other_AdditionalInfo_TitleInformation_Name
# Other_AdditionalInfo_TitleInformation_StreetAddress_CompositeAddress
# Other_AdditionalInfo_TitleInformation_StreetAddress_City
# Other_AdditionalInfo_TitleInformation_StreetAddress_StateOrProvince
# Other_AdditionalInfo_TitleInformation_StreetAddress_PostalCode
# Other_AdditionalInfo_TitleInformation_ContactName
# Other_AdditionalInfo_TitleInformation_ContactInformation_OfficePhone
# Other_AdditionalInfo_TitleInformation_ContactInformation_CellPhone
# Other_AdditionalInfo_TitleInformation_ContactInformation_Fax
# Other_AdditionalInfo_TitleInformation_ContactInformation_Email
# Other_AdditionalInfo_AdditionalListingData_ConditionInfo_Includes
# Other_AdditionalInfo_AdditionalListingData_ConditionInfo_Excludes
# Other_AdditionalInfo_AdditionalListingData_Encumberances_MortgageBalance1
# Other_AdditionalInfo_AdditionalListingData_Encumberances_MortgageBalance2
# Other_AdditionalInfo_AdditionalListingData_Encumberances_TotalEncumbrances
# Other_AdditionalInfo_AdditionalListingData_Encumberances_OtherLien
# Other_AdditionalInfo_AdditionalListingData_Encumberances_OtherLienDescription
# Other_AdditionalInfo_AdditionalSalesData_OfferDate
# Other_AdditionalInfo_AdditionalSalesData_OfferAcceptDate
# Other_AdditionalInfo_AdditionalSalesData_DepositAmount
# Other_AdditionalInfo_AdditionalTaxData_LotNumber
# Other_AdditionalInfo_AdditionalTaxData_UnitNumber
# Other_AdditionalInfo_AdditionalTaxData_Township
# Other_AdditionalInfo_AdditionalTaxData_BlockNumber
# Other_AdditionalInfo_AdditionalTaxData_PlatBookNumber
# Other_AdditionalInfo_AdditionalTaxData_PlatPageNumber
# Other_AdditionalInfo_AdditionalFields_CS_PropertyType_Residential
# Other_AdditionalInfo_AdditionalFields_CS_PropertyType_Multi
# Other_AdditionalInfo_AdditionalFields_CS_PropertyType_Vacant
# Other_AdditionalInfo_AdditionalFields_CS_PropertyType_Commercial
# Other_AdditionalInfo_AdditionalFields_CS_PropertyType_OtherPT
# Other_AdditionalInfo_AdditionalFields_CS_PropertyType_OtherPTDescription
# Other_ZFMetadata_ZFFilename
# Other_ZFMetadata_ZFBrokerName
# Other_ZFMetadata_ZFUserName_Name
# Other_ZFMetadata_ZFUserName_OfficePhone
# Other_ZFMetadata_ZFUserName_Fax
# Other_ZFMetadata_ZFUserName_CompositeAddress
# REData_REProperties_ResidentialProperty_Listing_SalesData_ListingCommissionPercent
# REData_REProperties_ResidentialProperty_Listing_SalesData_ListingCommissionAmount

# REData_REProperties_ResidentialProperty_Listing_SalesData_AdminTransactionFee
# REData_REProperties_ResidentialProperty_Listing_SalesData_OtherDeductions
# REData_REProperties_ResidentialProperty_Listing_SalesData_AgentOneSplitPercent
# REData_REProperties_ResidentialProperty_Listing_SalesData_AgentOneSplitAmount
# REData_REProperties_ResidentialProperty_Listing_SalesData_AgentOneSplitName
# REData_REProperties_ResidentialProperty_Listing_SalesData_AgentTwoSplitPercent
# REData_REProperties_ResidentialProperty_Listing_SalesData_AgentTwoSplitAmount
# REData_REProperties_ResidentialProperty_Listing_SalesData_AgentTwoSplitName
# REData_REProperties_ResidentialProperty_Listing_SalesData_AgentOneNet
# REData_REProperties_ResidentialProperty_Listing_SalesData_AgentTwoNet
# REData_REProperties_ResidentialProperty_Listing_SalesData_OfficeCommissionNet
# REData_REProperties_ResidentialProperty_BuySideData_BuyerCommissionPercent
# REData_REProperties_ResidentialProperty_BuySideData_BuyerCommissionAmount
# REData_REProperties_ResidentialProperty_BuySideData_AdminTransactionFee
# REData_REProperties_ResidentialProperty_BuySideData_OtherDeductions
# REData_REProperties_ResidentialProperty_BuySideData_ReferringAgentFeePercent
# REData_REProperties_ResidentialProperty_BuySideData_ReferringAgentFeeAmount
# REData_REProperties_ResidentialProperty_BuySideData_ReferringAgentName
# REData_REProperties_ResidentialProperty_BuySideData_AgentOneSplitPercent
# REData_REProperties_ResidentialProperty_BuySideData_AgentOneSplitAmount
# REData_REProperties_ResidentialProperty_BuySideData_AgentOneSplitName
# REData_REProperties_ResidentialProperty_BuySideData_AgentTwoSplitPercent
# REData_REProperties_ResidentialProperty_BuySideData_AgentTwoSplitAmount
# REData_REProperties_ResidentialProperty_BuySideData_AgentTwoSplitName
# REData_REProperties_ResidentialProperty_BuySideData_AgentOneNet
# REData_REProperties_ResidentialProperty_BuySideData_AgentTwoNet
# REData_REProperties_ResidentialProperty_BuySideData_OfficeCommissionNet
# REData_REProperties_ResidentialProperty_Listing_SalesData_SignerRepresentative_FirstName
# REData_REProperties_ResidentialProperty_Listing_SalesData_SignerRepresentative_MiddleName
# REData_REProperties_ResidentialProperty_Listing_SalesData_SignerRepresentative_LastName
# REData_REProperties_ResidentialProperty_Listing_SalesData_SignerRepresentative_Email
