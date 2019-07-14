%dw 2.0
output application/json
var originalPayload = vars.originalPayload
var middleInitial = originalPayload.CustomerInformation.MiddleInitial
---
{
	CreateCustomerRequest: {
		CustomerInformation: {
			DateOfBirth: originalPayload.CustomerInformation.DateOfBirth,
			FirstName: originalPayload.CustomerInformation.FirstName,
			LastName: originalPayload.CustomerInformation.LastName,
			MiddleInitial: if (middleInitial != null) middleInitial[0] else null,
			Title: originalPayload.CustomerInformation.sTitle,
			Address: 
				if(vars.primaryAddress != null) 
					vars.primaryAddress
				 else null,
			MailingAddress: 
				if (vars.mailingAddress != null ) 
					vars.mailingAddress
				 else null,
			PrimaryPhoneNumber: originalPayload.CustomerInformation.MobilePhoneNumber,
			FaxPhoneNumber: originalPayload.CustomerInformation.FaxPhoneNumber,
			SecondaryPhoneNumber: originalPayload.CustomerInformation.SecondaryPhoneNumber,
			MobilePhoneNumber: if (vars.ApplicantType != "NRA") originalPayload.CustomerInformation.MobilePhoneNumber else null,
			TaxNumber: originalPayload.CustomerInformation.TaxNumber,
			TaxIdType: originalPayload.CustomerInformation.TaxIdType,
			CitizenshipCode: originalPayload.CustomerInformation.CitizenshipCode,
			W8CertificateType: originalPayload.CustomerInformation.W8CertificateType,
			PrimaryID: originalPayload.CustomerInformation.PrimaryID,
			BranchNumber: originalPayload.CustomerInformation.BranchNumber,
			CostCenterNumber: originalPayload.CustomerInformation.CostCenterNumber,
			MailCode: originalPayload.CustomerInformation.MailCode,
			PrimaryLanguage: originalPayload.CustomerInformation.PrimaryLanguage,
			PrimaryOfficerNumber: originalPayload.CustomerInformation.PrimaryOfficerNumber,
			SecondaryOfficerNumber: originalPayload.CustomerInformation.SecondaryOfficerNumber,
			Gender: originalPayload.CustomerInformation.Gender,
			CategoryCode1 : originalPayload.CustomerInformation.CategoryCode1,
    		CountryofDualCitizenship : originalPayload.CustomerInformation.CountryofDualCitizenship,
			EmploymentDate: originalPayload.CustomerInformation.EmploymentDate,
			EmploymentOrSchool: originalPayload.CustomerInformation.EmploymentOrSchool,
			Ethnicity: originalPayload.CustomerInformation.Ethnicity,
			MaritalStatus: originalPayload.CustomerInformation.MaritalStatus,
			MothersMaidenName: originalPayload.CustomerInformation.MothersMaidenName,
			Occupation: originalPayload.CustomerInformation.Occupation,
			W8CertificateDate: originalPayload.CustomerInformation.W8CertificateDate,
			Identification: {
			Status: originalPayload.CustomerInformation.Identification.Status,
			NonDocumentaryIdentificationInformation1: {
				Type: originalPayload.CustomerInformation.Identification.NonDocumentaryIdentificationInformation1
			}
			},
			EmailAddress: originalPayload.CustomerInformation.EmailAddress,
			IsPoliticallyExposedPerson: if(originalPayload.CustomerInformation.PEP == 'No')false else true
			}
		}
}