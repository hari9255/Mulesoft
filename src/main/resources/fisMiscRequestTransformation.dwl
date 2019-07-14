%dw 2.0
output application/json
var originalPayload = vars.originalPayload
---
{
  "CustomerNumber": vars.CISNumber,
  "CustomerToAccountRelationshipCode": originalPayload.AccountInformation.CustomerToAccountRelationship.Customer1AccountRelationshipCode,
  "CustomerAccountAssociationType": originalPayload.AccountInformation.CustomerToAccountRelationship.Customer1AccountAssociationType,
  "FirstName": originalPayload.CustomerInformation.FirstName,
  "LastName": originalPayload.CustomerInformation.LastName,
  "MiddleInitial": originalPayload.CustomerInformation.MiddleInitial[0],
  "Title": originalPayload.CustomerInformation.sTitle,
  "Address": 
				if(vars.primaryAddress != null) 
					vars.primaryAddress
				 else null,
  "AccountNumber": vars.cupCardResponse.data.ReferenceId,
  "AccountBranchNumber": originalPayload.CustomerInformation.BranchNumber,
  "AccountCostCenter": originalPayload.CustomerInformation.CostCenterNumber,
  "AccountTaxCode": originalPayload.CustomerInformation.TaxIdType,
  "AccountTaxNumber": originalPayload.CustomerInformation.TaxNumber,
  "AccountWithholdingIndicator": originalPayload.AccountInformation.DepositAccount.WithholdingIndicator,
  "MobileNumber": if (vars.ApplicantType != "NRA") originalPayload.CustomerInformation.MobilePhoneNumber else null,
  "FaxNumber": ""
  
}