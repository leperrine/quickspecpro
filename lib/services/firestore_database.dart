import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:quickspecpro/app/models/contact/contact.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item_feature.dart';

import 'package:quickspecpro/services/firestore_service.dart';

import 'package:quickspecpro/app/models/template/template.dart';

import 'package:quickspecpro/app/models/userTemplate/user_template.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item.dart';

import 'package:quickspecpro/services/firestore_path.dart';
import 'package:quickspecpro/app/models/inspection/inspection.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  FirestoreDatabase({
    @required this.uid,
  }) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;
  final _firestore = Firestore.instance;

  // Contact CRUD Operations
  Future<void> setContact(Contact contact) async => await _service.setData(
      path: FirestorePath.contact(uid, contact.id),
      data: contact.toJson(),
      merge: true);

  Future<void> deleteContact(Contact contact) async =>
      await _service.deleteData(path: FirestorePath.contact(uid, contact.id));

  Future<void> addInspectionIdtoContact(
      {String contactId, String inspectionId}) async {
    try {
      await _firestore
          .document(FirestorePath.contact(uid, contactId))
          .updateData(
        {
          'inspections': FieldValue.arrayUnion([contactId])
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteInspectionIdFromContact(
      {String contactId, String inspectionId}) async {
    try {
      await _firestore
          .document(FirestorePath.contact(uid, contactId))
          .updateData(
        {
          'inspections': FieldValue.arrayRemove([contactId])
        },
      );
    } catch (e) {
      print(e);
    }
  }

  // Contact Streams
  Stream<Contact> contactStream({@required String contactId}) =>
      _service.documentStream(
          path: FirestorePath.contact(uid, contactId),
          builder: (data, documentId) => Contact.fromJson(data, documentId));

  Stream<List<Contact>> contactsStream() => _service.collectionStream(
        path: FirestorePath.contacts(uid),
        builder: (data, documentId) => Contact.fromJson(data, documentId),
        queryBuilder: (query) => query.orderBy('fullName'),
      );

  // Inspection CRUD Operations
  Future<void> setInspection(Inspection inspection) async =>
      await _service.setData(
          path: FirestorePath.inspection(uid, inspection.id),
          data: inspection.toJson());

  Future<void> deleteInspection(Inspection inspection) async => await _service
      .deleteData(path: FirestorePath.inspection(uid, inspection.id));

  // Other Inspection Functions
  Future<List<DateTime>> inspectionDatesList({Inspection inspection}) async {
    final inspectionDatesList = <DateTime>[];
    try {
      await _firestore
          .collection('users')
          .document(uid)
          .collection('inspections')
          .getDocuments()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.documents) {
          inspectionDatesList.add(ds.data['date'] as DateTime);
        }
        return inspectionDatesList;
      });
    } catch (e) {
      print(e);
    }
  }

  //Inspection Streams
  Stream<Inspection> inspectionStream({@required String inspectionId}) =>
      _service.documentStream(
        path: FirestorePath.inspection(uid, inspectionId),
        builder: (data, documentId) => Inspection.fromJson(data, documentId),
      );

  Stream<List<Inspection>> inspectionsStream() => _service.collectionStream(
        path: FirestorePath.inspections(uid),
        builder: (data, documentId) => Inspection.fromJson(data, documentId),
      );

  // Template Library Streams
  Stream<Template> templateStream({@required String templateId}) =>
      _service.documentStream(
        path: FirestorePath.template(uid, templateId),
        builder: (data, documentId) => Template.fromJson(data, documentId),
      );

  Stream<List<Template>> templatesStream() => _service.collectionStream(
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

  // User Template Streams
  Stream<UserTemplate> userTemplateStream({@required String userTemplateId}) =>
      _service.documentStream(
        path: FirestorePath.userTemplate(uid, userTemplateId),
        builder: (data, documentId) => UserTemplate.fromJson(data, documentId),
      );

  Stream<List<UserTemplate>> userTemplatesStream() => _service.collectionStream(
        path: FirestorePath.userTemplates(uid),
        builder: (data, documentId) => UserTemplate.fromJson(data, documentId),
      );

  // User Template Section CRUD Operations
  Future<void> setUserTemplateSection(
          UserTemplateSection userTemplateSection) async =>
      await _service.setData(
          path: FirestorePath.userTemplateSection(uid, userTemplateSection.id),
          data: userTemplateSection.toJson());

  Future<void> addUserTemplateIdtoSection(
      {String userTemplateId, String userTemplateSectionId}) async {
    try {
      await _firestore
          .document(
              FirestorePath.userTemplateSection(uid, userTemplateSectionId))
          .updateData(
        {
          'userTemplateIds': FieldValue.arrayUnion([userTemplateId])
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteUserTemplateIdFromSection(
      {String userTemplateId, String userTemplateSectionId}) async {
    try {
      await _firestore
          .document(
              FirestorePath.userTemplateSection(uid, userTemplateSectionId))
          .updateData(
        {
          'userTemplateIds': FieldValue.arrayRemove([userTemplateId])
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteUserTemplateSection(
          UserTemplateSection userTemplateSection) async =>
      await _service.deleteData(
          path: FirestorePath.userTemplateSection(uid, userTemplateSection.id));

  // User Template Section Streams
  Stream<UserTemplateSection> userTemplateSectionStream(
          {@required String userTemplateSectionId}) =>
      _service.documentStream(
        path: FirestorePath.userTemplateSection(uid, userTemplateSectionId),
        builder: (data, documentId) =>
            UserTemplateSection.fromJson(data, documentId),
      );

  Stream<List<UserTemplateSection>> userTemplateSectionsStream(
          {String userTemplateId}) =>
      _service.collectionStream(
        path: FirestorePath.userTemplateSections(uid),
        builder: (data, documentId) =>
            UserTemplateSection.fromJson(data, documentId),
        queryBuilder: (query) =>
            query.where('userTemplateIds', arrayContains: '$userTemplateId'),
      );

  // User Template Section Item CRUD Operations
  Future<void> setUserTemplateSectionItem(
          UserTemplateSection userTemplateSection,
          UserTemplateSectionItem userTemplateSectionItem) async =>
      await _service.setData(
          path: FirestorePath.userTemplateSectionItem(
            uid,
            userTemplateSection.id,
            userTemplateSectionItem.id,
          ),
          data: userTemplateSectionItem.toJson());

  Future<void> deleteUserTemplateSectionItem(
          UserTemplateSection userTemplateSection,
          UserTemplateSectionItem userTemplateSectionItem) async =>
      await _service.deleteData(
          path: FirestorePath.userTemplateSectionItem(
              uid, userTemplateSection.id, userTemplateSectionItem.id));

  Future<void> deleteAllUserTemplateSectionItems(
          UserTemplateSection userTemplateSection) async =>
      await _firestore
          .collection('users')
          .document(uid)
          .collection('userTemplateSections')
          .document('${userTemplateSection.id}')
          .collection('userTemplateSectionItems')
          .getDocuments()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.documents) {
          ds.reference.delete();
        }
      });

  // User Template Section Item Streams
  Stream<UserTemplateSectionItem> userTemplateSectionItemStream(
    String userTemplateSectionId,
    String userTemplateSectionItemId,
  ) =>
      _service.documentStream(
          path: FirestorePath.userTemplateSectionItem(
              uid, userTemplateSectionId, userTemplateSectionItemId),
          builder: (data, documentId) =>
              UserTemplateSectionItem.fromJson(data, documentId));

  Stream<List<UserTemplateSectionItem>> userTemplateSectionItemsStream(
    String userTemplateSectionId,
  ) =>
      _service.collectionStream(
          path: FirestorePath.userTemplateSectionItems(
              uid, userTemplateSectionId),
          builder: (data, documentId) =>
              UserTemplateSectionItem.fromJson(data, documentId));

  // User Template Section Item Feature CRUD Operations
  Future<void> setUserTemplateSectionItemFeature({
    UserTemplateSection userTemplateSection,
    UserTemplateSectionItem userTemplateSectionItem,
    UserTemplateSectionItemFeature userTemplateSectionItemFeature,
  }) async {
    final data = userTemplateSectionItemFeature.toJson();
    final docRef = _firestore
        .collection('users')
        .document(uid)
        .collection('userTemplateSections')
        .document(userTemplateSection.id)
        .collection('userTemplateSectionItems')
        .document(userTemplateSectionItem.id);
    try {
      docRef.updateData({
        'userTemplateSectionItemFeatures': FieldValue.arrayUnion([data])
      });
    } catch (e) {
      print(e);
    }
  }

  // User Template Section Item Feature Streams
  Future<void> deleteUserTemplateSectionItemFeature(
      {UserTemplateSection userTemplateSection,
      UserTemplateSectionItem userTemplateSectionItem,
      UserTemplateSectionItemFeature userTemplateSectionItemFeature}) async {
    final data = userTemplateSectionItemFeature.toJson();
    final docRef = _firestore
        .collection('users')
        .document(uid)
        .collection('userTemplateSections')
        .document(userTemplateSection.id)
        .collection('userTemplateSectionItems')
        .document(userTemplateSectionItem.id);
    try {
      docRef.updateData({
        'userTemplateSectionItemFeatures': FieldValue.arrayRemove([data])
      });
    } catch (e) {
      print(e);
    }
  }

  // Get User Template Section Item Features as List
  Future<List<UserTemplateSectionItemFeature>>
      getUserTemplateSectionItemFeatureList(
    UserTemplateSection userTemplateSection,
    UserTemplateSectionItem userTemplateSectionItem,
  ) async {
    final UserTemplateSectionItem userTemplateSectionItemDoc =
        await userTemplateSectionItemStream(
                userTemplateSection.id, userTemplateSectionItem.id)
            .first;
    try {
      if (userTemplateSectionItemDoc != null &&
          userTemplateSectionItemDoc
              .userTemplateSectionItemFeatures.isNotEmpty) {
        return userTemplateSectionItemDoc.userTemplateSectionItemFeatures;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
    }
  }

  Stream<List<UserTemplateSectionItemFeature>>
      userTemplateSectionItemFeaturesStream(
              {UserTemplateSection userTemplateSection,
              UserTemplateSectionItem userTemplateSectionItem}) =>
          getUserTemplateSectionItemFeatureList(
                  userTemplateSection, userTemplateSectionItem)
              .asStream();
}
