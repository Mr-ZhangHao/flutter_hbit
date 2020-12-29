class UpdateVersion {
  String appName;
  int type;
  String versionCode;
  String versionName;
  String upgradePoint;
  String downloadUrl;
  String apkUrl;
  String time;

  UpdateVersion(
      {this.appName,
      this.type,
      this.versionCode,
      this.versionName,
      this.upgradePoint,
      this.downloadUrl,
      this.apkUrl,
      this.time});

  UpdateVersion.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    type = json['type'];
    versionCode = json['version_code'];
    versionName = json['version_name'];
    upgradePoint = json['upgrade_point'];
    downloadUrl = json['download_url'];
    apkUrl = json['apk_url'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_name'] = this.appName;
    data['type'] = this.type;
    data['version_code'] = this.versionCode;
    data['version_name'] = this.versionName;
    data['upgrade_point'] = this.upgradePoint;
    data['download_url'] = this.downloadUrl;
    data['apk_url'] = this.apkUrl;
    data['time'] = this.time;
    return data;
  }
}
