%dw 2.0
output application/json
var mailingAddress = if (vars.mailingAddress != null ) vars.mailingAddress else vars.primaryAddress
var originalPayload = vars.originalPayload
var middleInitial = originalPayload.CustomerInformation.MiddleInitial
---
{
	"CISNumber": vars.CISNumber,
	CustomerInformation: {
		FirstName: originalPayload.CustomerInformation.FirstName,
		MiddleInitial: if (middleInitial != null) middleInitial[0] else null,
		LastName: originalPayload.CustomerInformation.LastName,
		DateOfBirth: originalPayload.CustomerInformation.DateOfBirth,
		MailingAddress: mailingAddress,
		CellNumber: originalPayload.CustomerInformation.MobilePhoneNumber,
		Email: originalPayload.CustomerInformation.EmailAddress,
		Gender: originalPayload.CustomerInformation.Gender,
		SocialSecurityNumber: originalPayload.CustomerInformation.TaxNumber,
		BillingAddress: mailingAddress,
		IsUSCitizen: if(originalPayload.CitizenshipCode == "USA") true else false,
		ShippingAddressOption: "MailingAddress"
	}
}
