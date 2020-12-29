package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
      com.example.flutterseekbar.FlutterSeekbarPlugin.registerWith(shimPluginRegistry.registrarFor("com.example.flutterseekbar.FlutterSeekbarPlugin"));
    flutterEngine.getPlugins().add(new de.mintware.barcode_scan.BarcodeScanPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.deviceinfo.DeviceInfoPlugin());
    flutterEngine.getPlugins().add(new com.flutter.flutter_app_upgrade.FlutterAppUpgradePlugin());
      io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin"));
      io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin.registerWith(shimPluginRegistry.registrarFor("io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin"));
    flutterEngine.getPlugins().add(new com.taobao.fapi.fsuper.FsuperPlugin());
      carnegietechnologies.gallery_saver.GallerySaverPlugin.registerWith(shimPluginRegistry.registrarFor("carnegietechnologies.gallery_saver.GallerySaverPlugin"));
      com.example.imagegallerysaver.ImageGallerySaverPlugin.registerWith(shimPluginRegistry.registrarFor("com.example.imagegallerysaver.ImageGallerySaverPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.imagepicker.ImagePickerPlugin());
      com.vansz.loading_indicator_view.LoadingIndicatorViewPlugin.registerWith(shimPluginRegistry.registrarFor("com.vansz.loading_indicator_view.LoadingIndicatorViewPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.packageinfo.PackageInfoPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    flutterEngine.getPlugins().add(new com.baseflow.permissionhandler.PermissionHandlerPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin());
      plugin.storage.qiniu.flutter.isanye.cn.syflutterqiniustorage.SyFlutterQiniuStoragePlugin.registerWith(shimPluginRegistry.registrarFor("plugin.storage.qiniu.flutter.isanye.cn.syflutterqiniustorage.SyFlutterQiniuStoragePlugin"));
      com.debut.uniqueid.UniqueIdPlugin.registerWith(shimPluginRegistry.registrarFor("com.debut.uniqueid.UniqueIdPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.urllauncher.UrlLauncherPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.videoplayer.VideoPlayerPlugin());
    flutterEngine.getPlugins().add(new creativemaybeno.wakelock.WakelockPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.webviewflutter.WebViewFlutterPlugin());
  }
}