import 'package:flutter/foundation.dart';

import 'package:quickspecpro/app/models/template/template.dart';
import 'package:quickspecpro/app/models/userTemplate/template.dart';
import 'package:quickspecpro/services/firestore_service.dart';
import 'package:quickspecpro/services/firestore_path.dart';
import 'package:quickspecpro/app/models/inspection/inspection.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  FirestoreDatabase({
    @required this.uid,
  }) : assert(uid != null);
  final String uid;
  
  final _service = FirestoreService.instance;

  // Inspection CRUD Operations
  Future<void> setInspection(Inspection inspection) async =>
      await _service.setData(
          path: FirestorePath.inspection(uid, inspection.id),
          data: inspection.toJson());

  Future<void> deleteInspection(Inspection inspection) async => await _service
      .deleteData(path: FirestorePath.inspection(uid, inspection.id));

  Stream<Inspection> inspectionStream({@required String inspectionId}) =>
      _service.documentStream(
        path: FirestorePath.inspection(uid, inspectionId),
        builder: (data, documentId) => Inspection.fromJson(data, documentId),
      );

  Stream<List<Inspection>> inspectionsStream() =>
      _service.collectionStream(
        path: FirestorePath.templates(uid),
        builder: (data, documentId) => Inspection.fromJson(data, documentId),
      );

  // Template Library Streams
  Stream<Template> templateStream({@required String templateId}) =>
      _service.documentStream(
        path: FirestorePath.template(uid, templateId),
        builder: (data, documentId) => Template.fromJson(data, documentId),
      );

  Stream<List<Template>> templatesStream() =>
      _service.collectionStream(
        path: FirestorePath.templates(uid),
        builder: (data, documentId) => Template.fromJson(data, documentId),
      );

  // User Template Library CRUD Operations
  Future<void> setUserTemplate(UserTemplate userTemplate) async =>
      await _service.setData(
          path: FirestorePath.userTemplate(uid, userTemplate.id),
          data: userTemplate.toJson());

  Future<void> deleteUserTemplate(UserTemplate userTemplate) async =>
      await _service.deleteData(
          path: FirestorePath.userTemplate(uid, userTemplate.id));

  Stream<UserTemplate> userTemplateStream({@required String userTemplateId}) =>
      _service.documentStream(
        path: FirestorePath.userTemplate(uid, userTemplateId),
        builder: (data, documentId) => UserTemplate.fromJson(data, documentId),
      );

  Stream<List<UserTemplate>> userTemplatesStream() =>
      _service.collectionStream(
        path: FirestorePath.userTemplates(uid),
        builder: (data, documentId) => UserTemplate.fromJson(data, documentId),
      );
}
