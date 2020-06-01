import 'package:flutter/material.dart';

import 'package:quickspecpro/app/models/userTemplate/user_template.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item_feature.dart';

class UserTemplateListTile extends StatelessWidget {
  UserTemplateListTile({Key key, this.userTemplate, this.onTap});
  final UserTemplate userTemplate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network(userTemplate.coverPhoto),
      title: userTemplate.title != null
          ? Text(userTemplate.title)
          : Text('Title Not Found'),
      trailing: userTemplate.description != null
          ? Text(userTemplate.description)
          : Text('Description Not Found'),
      onTap: onTap,
    );
  }
}

class UserTemplateSectionListTile extends StatelessWidget {
  UserTemplateSectionListTile({Key key, this.userTemplateSection, this.onTap});
  final UserTemplateSection userTemplateSection;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
     // leading: Image.network(userTemplate.coverPhoto),
      title: Text(userTemplateSection.title),
      trailing: Text(userTemplateSection.summary),
      onTap: onTap,
    );
  }
}

class UserTemplateSectionItemListTile extends StatelessWidget {
  UserTemplateSectionItemListTile({Key key, this.userTemplateSectionItem, this.onTap});
  final UserTemplateSectionItem userTemplateSectionItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
     // leading: Image.network(userTemplate.coverPhoto),
      title: Text(userTemplateSectionItem.title),
      trailing: Text(userTemplateSectionItem.description),
      onTap: onTap,
    );
  }
}

class UserTemplateSectionItemFeatureListTile extends StatelessWidget {
  UserTemplateSectionItemFeatureListTile({Key key, this.userTemplateSectionItemFeature, this.onTap});
  final UserTemplateSectionItemFeature userTemplateSectionItemFeature;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
     // leading: Image.network(userTemplate.coverPhoto),
      title: Text(userTemplateSectionItemFeature.featureName),
      trailing: Text(userTemplateSectionItemFeature.featureValues.join(',')),
      onTap: onTap,
    );
  }
}