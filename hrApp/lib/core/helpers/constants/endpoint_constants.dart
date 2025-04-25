class EndPointsConstants {
  static String baseUrl = "https://moj.gov.eg:75";

  static String counselorsUrl = "/CounselorsProxy"; //"/Counselors";

  static String login = "/api/Identity/login";

  static String resetPassword = "/api/Identity/reset-member-password";

  static String getGovs = "/api/Letters/get-contracted-governorates/";

  static String getMedicalSpecialties = "/api/Letters/get-medical-specialties";

  static String getHospitals = "/api/Letters/get-medical-service-providers";

  static String getHospitalsWithMedicalTests =
      "/api/Letters/get-medical-analysis-service-providers?GovernorateId=";
  static String getLapsWithMedicalTests =
      "/api/Letters/get-laboratory-analysis-service-providers?GovernorateId=";

  static String getHospitalRadiologyProviders =
      "/api/Letters/get-medical-radiation-service-providers?GovernorateId=";
  static String getLabsRadiologyProviders =
      "/api/Letters/get-laboratory-radiation-service-providers?GovernorateId=";

  static String getDoctors = "/api/Letters/get-doctors";

  static String getFollowers = "/api/Letters/get-followers";

  static String getLetterCheckTypes =
      "/api/Letters/get-check-types?MedicalServiceProviderID=";

  static String getClinicsList =
      "/api/Letters/get-medical-service-providers-clinics?MedicalServiceProviderID=";

  static String createLetter = "/api/Letters/create";

  static String uploadFile = "/api/Attachment/upload";

  static String downloadFile =
      "/api/Settings/download-general-settings-document/";

  static String getHealthCareContacts = "/api/Settings/get-hc-contacts";
  static String getHealthInspectionContacts =
      "/api/Settings/get-inspection-contacts";

  static String hcLetterHistory = "/api/Letters/list";

  static String markLetterAsUsed = "/api/Letters/mark-as-used";

  static String deleteLetter = "/api/Letters/cancel";

  static String downloadLetter = "/api/Letters/print-letter/";
  static String downloaInspectionPdf = "/api/Attachment/download-jid-file/";

  static String getLetterDetails = "/api/Letters/get-letter/";

  static const String provisingRequest =
      "/api/JID_Request/create/include-in-inspection-round";
  static const String provisingPeriodChange =
      "/api/JID_Request/create/add-or-change-inspection-round-request";
  static const String promotionDocument =
      "/api/JID_Request/create/certificate-job-gradient";
  static const String confidentialDocument =
      "/api/JID_Request/create/image-from-documents-secure-file";
  static const String vacationRequest = "/api/JID_Request/create/leave";
  static const String vacationBalance = "/api/JID_Request/create/leave-balance";
  static const String govermentalDecison =
      "/api/JID_Request/create/ministerial-decision-image-as-origin";
  static const String unpaidVacation =
      "/api/JID_Request/create/renewal-leave-without-pay";
  static const String secondmentExtension =
      "/api/JID_Request/create/secondment-renewal";
  static String getLookupById = "/api/SysLookup/jid-lookups-by-category/";
  static String getMemberData = "/api/Identity/get-member-data";
  static String inspectionHistory = "/api/JID_Request/history/";
  static String getUserProfile = "/api/Identity/get-user-profile";
  static String paymentSettings = "/api/JID_Payment/settings";
  static String unusedLetters = "/api/Letters/get-unused";
  static String updateLetterUsage = "/api/Letters/update-letters-usage";
  static String changePassword = "/api/Identity/change-password";
  static String medicalProviderDetails =
      "/api/Letters/get-medical-service-provider-references";
}
