import 'package:flutter/material.dart';
import 'package:oes_chatbot/config/service_locator_singleton.dart';
import 'package:oes_chatbot/core/loading_indicator.dart';
import 'package:oes_chatbot/core/request.dart';
import 'package:oes_chatbot/oes_chatbot.dart';
import 'package:oes_chatbot/services/custom_toast.dart';
import 'package:oes_chatbot/services/file_download_service.dart';
import 'package:oes_chatbot/utils/extensions/datetime_extensions.dart';
import 'package:oes_chatbot/utils/extensions/file_extensions.dart';

class DownloadMultipleFiles {
  static Future<void> downloadMultipleByteData({required List<String?> urlPaths, String method = "GET", Object? data, required BuildContext? context}) async {
    Loading.indicator(context!);
    String filePathCreate = await createFolder();

    for (var i = 0; i < urlPaths.length; i++) {
      bool isVideo = urlPaths[i].toString().split(".").last.isVideoFormat;
      bool isImage = urlPaths[i].toString().split(".").last.isImageFormat;
      String extension = isVideo
          ? 'mp4'
          : isImage
              ? 'jpeg'
              : (urlPaths[i].toString().split(".").last.startsWith('csv')
                  ? 'csv'
                  : urlPaths[i].toString().split(".").last.startsWith('xlsx')
                      ? 'xlsx'
                      : 'pdf');
      String filePath = '$filePathCreate/$epochTime.$extension';

      await ChatBotServiceLocator.chatBotServiceLocatorInstance<OesRequest>().download(
        "${chatBotEnv.deskUrl}/${urlPaths[i]!}",
        filePath,
        method: method,
        data: data,
        onReceiveProgress: (
          receivedBytes,
          totalBytes,
        ) {},
      );
    }
    Navigator.pop(context);

    CustomToast.showDownloadToast(
      msg: "Files downloaded successfully",
      onTap: () {
        // TODO: will handle this
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const DownloadsScreen(),
        //   ),
        // );
      },
    );
  }
}
