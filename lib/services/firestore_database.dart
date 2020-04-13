import 'package:flutter/foundation.dart';

import 'package:quickspecpro/app/models/template/template.dart';
import 'package:quickspecpro/app/models/userTemplate/template.dart';
import 'package:quickspecpro/services/firestore_service.dart';
import 'package:quickspecpro/services/firestore_path.dart';
import 'package:quickspecpro/app/models/inspection/inspection.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  // Inspection CRUD Operations
  Future<void> setInspection(Inspection inspection) async =>
      await _service.setData(path: inspection.id, data: inspection.toJson());

  Future<void> deleteInspection(Inspection inspection) async => await _service
      .deleteData(path: FirestorePath.template(uid, inspection.id));

  Stream<Inspection> inspectionStream({@required String inspectionId}) =>
      _service.documentStream(
        path: FirestorePath.inspection(uid, inspectionId),
        builder: (data, documentId) => Inspection.fromJson(data),
      );

  Stream<List<Inspection>> inspectionsStream({Inspection inspection}) =>
      _service.collectionStream(
        path: FirestorePath.templates(uid),
        queryBuilder: inspection != null
            ? (query) => query.where('inspectionId', isEqualTo: inspection.id)
            : null,
        builder: (data, documentId) => Inspection.fromJson(data),
      );

  // Template Library Streams
  Stream<Template> templateStream({@required String templateId}) =>
      _service.documentStream(
        path: FirestorePath.template(uid, templateId),
        builder: (data, documentId) => Template.fromJson(data),
      );

  Stream<List<Template>> templatesStream({Template template}) =>
      _service.collectionStream(
        path: FirestorePath.templates(uid),
        queryBuilder: template != null
            ? (query) => query.where('templateId', isEqualTo: template.id)
            : null,
        builder: (data, documentId) => Template.fromJson(data),
      );

  // User Template Library CRUD Operations
  Future<void> setUserTemplate(UserTemplate userTemplate) async =>
      await _service.setData(
          path: userTemplate.id, data: userTemplate.toJson());

  Future<void> deleteUserTemplate(UserTemplate userTemplate) async =>
      await _service.deleteData(
          path: FirestorePath.template(uid, userTemplate.id));

  Stream<UserTemplate> userTemplateStream({@required String userTemplateId}) =>
      _service.documentStream(
        path: FirestorePath.template(uid, userTemplateId),
        builder: (data, documentId) => UserTemplate.fromJson(data),
      );

  Stream<List<UserTemplate>> userTemplatesStream({UserTemplate userTemplate}) =>
      _service.collectionStream(
        path: FirestorePath.templates(uid),
        queryBuilder: userTemplate != null
            ? (query) => query.where('userTemplateId', isEqualTo: userTemplate.id)
            : null,
        builder: (data, documentId) => UserTemplate.fromJson(data),
      );
}
