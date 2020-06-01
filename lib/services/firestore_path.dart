class FirestorePath {
  // Contact Firestore Paths
  static String contact(String uid, String contactId) => 'users/$uid/contacts/$contactId';
  static String contacts(String uid) => 'users/$uid/contacts';

  // Template library Firestore Paths
  static String template(String uid, String templateId) =>
      'users/$uid/templates/$templateId';

  static String templates(String uid) => 'users/$uid/templates';

  // User Templates Firestore Paths
  static String userTemplate(String uid, String userTemplateId) =>
      'users/$uid/userTemplates/$userTemplateId';

  static String userTemplates(String uid) => 'users/$uid/userTemplates';

  static String userTemplateSection(String uid, String userTemplateSectionId) =>
      'users/$uid/userTemplateSections/$userTemplateSectionId';

  static String userTemplateSections(String uid) =>
      'users/$uid/userTemplateSections';

  static String userTemplateSectionItem(
    String uid,
    String userTemplateSectionId,
    String userTemplateSectionItemId,
  ) =>
      'users/$uid/userTemplateSections/$userTemplateSectionId/userTemplateSectionItems/$userTemplateSectionItemId';

  static String userTemplateSectionItems(
    String uid,
    String userTemplateSectionId,
  ) =>
      'users/$uid/userTemplateSections/$userTemplateSectionId/userTemplateSectionItems';

// Inspection firestore paths
  static String inspection(String uid, String inspectionId) =>
      'users/$uid/inspections/$inspectionId';

  static String inspections(String uid) =>
      'users/$uid/inspections';
}
