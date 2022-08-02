import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import QtQuick.Controls.Material 2.12

import QtQuick.Window 2.1
import io.qt.textproperties 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 1200
    height: 800
    minimumWidth: 1000
    minimumHeight: 800
    
    // minimumHeight: height
    // minimumWidth: width
    
    title: "TFC"
    flags: Qt.Window
    property string currTime: "00:00:00"
    property real angleTarget: 0
    property real angleCurrent: 0
    property QtObject backend
    Material.theme: Material.Dark
    Material.accent: '#00BCD4'

    Bridge {
        id: bridge
    }

    Rectangle {
        anchors.fill: parent
        color: "#121212"
        // Component.onCompleted: root.width = 10000

        ColumnLayout {
            anchors.fill: parent
            Rectangle {
                Layout.fillWidth: true
                Layout.margins: 20
                Layout.topMargin: 60
                Layout.preferredHeight: 20
                color: 'grey'
                radius: 20
                Rectangle {
                    height: 20
                    color: '#00BCD4'
                    radius: 20
                    width: parent.width*.50 //percent
                    x: 1
                }

            }
            RowLayout{
                Layout.preferredWidth: root.width
                Rectangle {
                    id: snTextBx
                    Layout.preferredWidth: textLine.width*4//parent.width / 2
                    Layout.preferredHeight: textLine.height
                    Layout.leftMargin: 80
                    Layout.alignment: Qt.AlignLeft
                    color: '#424242'
                    Text {
                        id: sn
                        anchors.centerIn: parent
                        color: 'white'
                        font.pointSize: root.width / 40
                        text: '420'
                        padding: 8                
                    }
                    Text {
                        id: snLabel
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        color: 'white'
                        font.pointSize: root.width / 100
                        text: 'Tool Serial'
                        padding: 8                
                    }
                }
                Rectangle {
                    id: fwTextBx
                    Layout.preferredWidth: refMag.width*4//parent.width / 2
                    Layout.preferredHeight: textLine.height
                    Layout.alignment: Qt.AlignCenter
                    color: '#424242'
                    Text {
                        id: fw
                        anchors.centerIn: parent
                        color: 'white'
                        font.pointSize: root.width / 40
                        text: '3.5'
                        padding: 8                
                    }
                    Text {
                        id: fwLabel
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        color: 'white'
                        font.pointSize: root.width / 100
                        text: 'Tool Firmware'
                        padding: 8                
                    }
                }
                Rectangle {
                    id: refMagTextBx
                    Layout.preferredWidth: refMag.width*4//parent.width / 2
                    Layout.preferredHeight: textLine.height
                    Layout.rightMargin: 60
                    Layout.alignment: Qt.AlignRight
                    color: '#424242'
                    Text {
                        id: refMag
                        anchors.centerIn: parent
                        color: 'white'
                        font.pointSize: root.width / 40
                        text: '666'
                        padding: 8                
                    }
                    Text {
                        id: refMagLabel
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        color: 'white'
                        font.pointSize: root.width / 100
                        text: 'Ref Mag'
                        padding: 8                
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                spacing: 40
                Layout.margins: 60   
                Layout.alignment: Qt.AlignHCenter
                ColumnLayout {
                    Layout.preferredWidth: root.width/4
                    Layout.maximumWidth: root.width/4
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 12
                    Rectangle {
                        id: textBackgroundCurrentAxis
                        Layout.preferredWidth: parent.width//parent.width / 2
                        Layout.preferredHeight: textLine.height
                        Layout.alignment: Qt.AlignCenter
                        color: 'transparent'
                        Text {
                            id: textCurrentAxis
                            anchors.centerIn: parent
                            color: 'white'
                            font.pointSize: root.width / 35
                            text: 'ACCEL 1'
                            padding: 8       
                            Image {
                                source: "./images/settings.png"
                                anchors.left: parent.right
                                anchors.leftMargin: 10
                               
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.width/4
                                height: width
                                RoundButton{
                                    anchors.fill: parent
                                    Material.background: 'transparent'
                                }
                                
                            }          
                        }
                    }
                    Rectangle {
                        id: textBx
                        Layout.preferredWidth: parent.width//parent.width / 2
                        Layout.preferredHeight: textLine.height
                        Layout.alignment: Qt.AlignCenter
                        color: '#424242'
                        Text {
                            id: textLine
                            anchors.centerIn: parent
                            color: 'white'
                            font.pointSize: root.width / 35
                            text: '666'
                            padding: 8                
                        }
                        Text {
                            id: subx
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: 'x'
                            padding: 8                
                        }
                        Text {
                            id: targetX
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: '600'
                            padding: 8                
                        }
                    }
                    Rectangle {
                        Layout.preferredWidth: parent.width//parent.width / 2
                        Layout.preferredHeight: textLine2.height
                        Layout.alignment: Qt.AlignCenter
                        color: '#424242'
                        Text {
                            id: textLine2
                            anchors.centerIn: parent
                            color: 'white'
                            font.pointSize: root.width / 35
                            text: '664'
                            padding: 8                
                        }
                        Text {
                            id: suby
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: 'y'
                            padding: 8                
                        }
                        Text {
                            id: targetY
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: '600'
                            padding: 8                
                        }
                    }
                    Rectangle {
                        Layout.preferredWidth: parent.width//parent.width / 2
                        Layout.preferredHeight: textLine3.height
                        Layout.alignment: Qt.AlignCenter
                        color: '#424242'
                        Text {
                            id: textLine3
                            anchors.centerIn: parent
                            color: 'white'
                            font.pointSize: root.width / 35
                            text: '0.26'
                            padding: 8                
                        }
                        Text {
                            id: subz
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: 'z'
                            padding: 8                
                        }
                        Text {
                            id: targetZ
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: '0'
                            padding: 8                
                        }
                    }
                    RowLayout {
                        RoundButton {
                            Material.background: '#F44336'
                            // Material.foreground: 'black'
                            Layout.preferredWidth: (textBx.width + 20) / 2
                            Layout.preferredHeight: textBx.height 
                            Layout.alignment: Qt.AlignCenter
                            // enabled: false
                            text: 'REDO'
                            font.pointSize: root.width / 70
                        }
                        RoundButton {
                            Material.background: '#388e3c'
                            // Material.foreground: 'black'
                            Layout.preferredWidth: (textBx.width + 20) / 2
                            Layout.preferredHeight: textBx.height 
                            Layout.alignment: Qt.AlignCenter
                            // enabled: false
                            text: 'TAKE'
                            font.pointSize: root.width / 70
                            onClicked: {
                                bridge.takeMeasurement("Hello")
                            }
                        }
                    }
                }
                ColumnLayout {
                    Layout.preferredWidth: root.width*.3
                    Layout.preferredHeight: root.width*.3
                    Layout.alignment: Qt.AlignCenter
                    Rectangle{
                        id: wheel
                        Layout.preferredWidth: root.width*.3
                        Layout.preferredHeight: root.width*.3
                        radius: height
                        Layout.alignment: Qt.AlignCenter
                        Rectangle {
                            id: base
                            color: '#F44336'
                            rotation: angleTarget
                            anchors.verticalCenter: wheel.verticalCenter
                            anchors.horizontalCenter: wheel.horizontalCenter
                            height: 20
                            width: 20
                            radius: 20
                            Rectangle {
                                id: needle
                                color: '#4CAF50'
                                anchors.bottom: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                height: wheel.height/2
                                width: 5
                                z: -5
                            }
                        }
                        Rectangle {
                            id: base3
                            color: '#F44336'
                            rotation: angleCurrent
                            anchors.verticalCenter: wheel.verticalCenter
                            anchors.horizontalCenter: wheel.horizontalCenter
                            height: 20
                            width: 20
                            radius: 20
                            Rectangle {
                                id: needle2
                                color: '#F44336'
                                anchors.bottom: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                height: wheel.height/2
                                width: 5
                                z: -5
                            }
                        }

                    }
                }
                ColumnLayout {
                    Layout.preferredWidth: root.width/4
                    Layout.maximumWidth: root.width/4
                    Layout.alignment: Qt.AlignCenter
                    spacing: 12
                    Rectangle {
                        id: textBackgroundCurrentAxis2
                        Layout.preferredWidth: parent.width//parent.width / 2
                        Layout.preferredHeight: textLine.height
                        Layout.alignment: Qt.AlignCenter
                        color: 'transparent'
                        Text {
                            id: textCurrentAxis2
                            anchors.centerIn: parent
                            color: 'white'
                            font.pointSize: root.width / 35
                            text: 'TEMP'
                            padding: 8
                            Image {
                                source: "./images/settings.png"
                                anchors.left: parent.right
                                anchors.leftMargin: 10
                               
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.width/3
                                height: width
                                RoundButton{
                                    anchors.fill: parent
                                    Material.background: 'transparent'
                                }
                                
                            }              
                        }
                    }
                    Rectangle {
                        id: textBx2
                        Layout.preferredWidth: parent.width//parent.width / 2
                        Layout.preferredHeight: textLine.height
                        Layout.alignment: Qt.AlignCenter
                        color: '#424242'
                        Text {
                            id: textLine22
                            anchors.centerIn: parent
                            color: 'white'
                            font.pointSize: root.width / 35
                            text: '27C'
                            padding: 8                
                        }
                        Text {
                            id: subx2
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: 'tool'
                            padding: 8                
                        }
                        Text {
                            id: targetX2
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: '25C'
                            padding: 8                
                        }
                    }
                    Rectangle {
                        Layout.preferredWidth: parent.width//parent.width / 2
                        Layout.preferredHeight: textLine2.height
                        Layout.alignment: Qt.AlignCenter
                        color: '#424242'
                        Text {
                            id: textLine2222
                            anchors.centerIn: parent
                            color: 'white'
                            font.pointSize: root.width / 35
                            text: '28C'
                            padding: 8                
                        }
                        Text {
                            id: suby2
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: 'Accel'
                            padding: 8                
                        }
                        Text {
                            id: targetY2
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: '25C'
                            padding: 8                
                        }
                    }
                    Rectangle {
                        Layout.preferredWidth: parent.width//parent.width / 2
                        Layout.preferredHeight: textLine3.height
                        Layout.alignment: Qt.AlignCenter
                        color: '#424242'
                        Text {
                            id: textLine32
                            anchors.centerIn: parent
                            color: 'white'
                            font.pointSize: root.width / 35
                            text: '27C'
                            padding: 8                
                        }
                        Text {
                            id: subz2
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: 'Mag'
                            padding: 8                
                        }
                        Text {
                            id: targetZ2
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            color: 'white'
                            font.pointSize: root.width / 70
                            text: '25C'
                            padding: 8                
                        }
                    }
                    Switch {
                        id: heaterSwitch
                        Material.background: '#4CAF50'
                        // Material.foreground: 'black'
                        // Layout.preferredWidth: textBx.width + 20
                        Layout.preferredHeight: textBx.height
                        Layout.alignment: Qt.AlignRight
                        // enabled: false
                        text: heaterSwitch.checked ? 'Heaters On' : 'Heaters Off'
                        font.pointSize: root.width / 70
                    }
                }    
            }
        }


        Text {
            anchors {
                bottom: parent.bottom
                bottomMargin: 12
                left: parent.left
                leftMargin: 12
            }
            text: currTime  // used to be; text: "16:38:33"
            font.pixelSize: 48
            color: "white"
        }

   

    }

    Connections {
        target: backend

        function onUpdated(msg) {
            currTime = msg;
        }

        function onTargetAngle(msg) {
            angleTarget = msg;
        }

        function onCurrentAngle(msg) {
            angleCurrent = msg;
        }
    }

}