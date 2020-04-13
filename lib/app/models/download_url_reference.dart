class DownloadUrlReference {
  DownloadUrlReference(this.downloadUrl);
  final String downloadUrl;

  factory DownloadUrlReference.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String downloadUrl = data['downloadUrl'];
    if (downloadUrl == null) {
      return null;
    }
    return DownloadUrlReference(downloadUrl);
  }

  Map<String, dynamic> toMap() {
    return {
      'downloadUrl': downloadUrl,
    };
  }
}