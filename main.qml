import QtQuick 2.12
import QtQuick.Window 2.12

import Qt.labs.lottieqt 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Qt Santa Clara")

    LottieAnimation {
        id: lottie
        property int scaleFactor: 7
        anchors.centerIn: parent
        source: "16894-email-confirmation-sent.json"
        scale: 1/scaleFactor

        autoPlay: false
        loops: 1
        onFinished: {
            console.log("Stopped")
            lottie.gotoAndStop(0)
            ma.enabled = true
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            border.color: "#781514"
            border.width: 3 * lottie.scaleFactor
            radius: 5 * lottie.scaleFactor
        }
        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: {
                console.log("Clicked")
                ma.enabled = false
                // Why this?
                // It's a side effect of the downloaded json files
                // Sometimes there are issues at the beginning...
                lottie.gotoAndPlay(3)
//                lottie.play()
            }
        }
    }
}
