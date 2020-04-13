class FirestorePath {
  // Template library Firestore Paths
  static String template(String uid, String templateId) => 'users/$uid/templates/$templateId';
  static String templates(String uid) => 'users/$uid/templates';

  // User Templates Firestore Paths
  static String userTemplate(String uid, String userTemplateId) =>
      'users/$uid/userTemplates/$userTemplateId';
  static String userTemplates(String uid) => 'users/$uid/userTemplates';

  // User inspections Firestore Paths
  static String inspection(String uid, String inspectionId) =>
      'users/$uid/inspections/$inspectionId';
  static String inspections(String uid, String inspectionId) =>
      'users/$uid/inspections';
}
