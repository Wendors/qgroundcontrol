import QtQuick
import QtMultimedia

import QGroundControl

VideoOutput {
    property string streamName: "videoContent"
    objectName: streamName

    fillMode: QGroundControl.settingsManager.videoSettings.videoFit.rawValue === 2
              ? VideoOutput.PreserveAspectCrop
              : VideoOutput.PreserveAspectFit

    Connections {
        target: QGroundControl.videoManager
        function onImageFileChanged(filename) {
            grabToImage(function(result) {
                if (!result.saveToFile(filename)) {
                    console.error('Error capturing video frame');
                }
            });
        }
    }
}
