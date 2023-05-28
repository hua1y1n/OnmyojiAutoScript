import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI

import "../Global/"

FluScrollablePage{
    leftPadding:10
    rightPadding:10
    bottomPadding:20
    spacing: 0

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 0
        height: 136
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                top: parent.top
                left: parent.left
            }
            FluText{
                text: qsTr("Dark Mode")
                font: FluTextStyle.BodyStrong
                Layout.bottomMargin: 4
            }
            Repeater{
                model: [{title:qsTr("System"),mode:FluDarkMode.System},{title:qsTr("Light"),mode:FluDarkMode.Light},{title:qsTr("Dark"),mode:FluDarkMode.Dark}]
                delegate:  FluRadioButton{
                    selected : MainEvent.darkMode === modelData.mode
                    text:modelData.title
                    onClicked:{
                        MainEvent.darkMode = modelData.mode
                    }
                }
            }


        }

    }

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 168
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                top: parent.top
                left: parent.left
            }

            FluText{
                text: qsTr("navigation_view_display_mode")
                font: FluTextStyle.BodyStrong
                Layout.bottomMargin: 4
            }
            Repeater{
                model: [{title:qsTr("Open"),mode:FluNavigationView.Open},{title:qsTr("Compact"),mode:FluNavigationView.Compact},{title:qsTr("Minimal"),mode:FluNavigationView.Minimal},{title:qsTr("Auto"),mode:FluNavigationView.Auto}]
                delegate:  FluRadioButton{
                    selected : MainEvent.displayMode===modelData.mode
                    text:modelData.title
                    onClicked:{
                        MainEvent.displayMode = modelData.mode
                    }
                }
            }
        }
    }

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 160
        paddings: 10
        ColumnLayout{
            spacing:0
            anchors{
                left: parent.left
            }
            FluText{
                text: qsTr("Theme color")
                font: FluTextStyle.BodyStrong
                Layout.bottomMargin: 4
            }
            RowLayout{
                Layout.topMargin: 10
                Repeater{
                    model: [FluColors.Yellow,FluColors.Orange,FluColors.Red,FluColors.Magenta,FluColors.Purple,FluColors.Blue,FluColors.Teal,FluColors.Green]
                    delegate:  FluRectangle{
                        width: 42
                        height: 42
                        radius: [4,4,4,4]
                        color: mouse_item.containsMouse ? Qt.lighter(modelData.normal,1.1) : modelData.normal
                        FluIcon {
                            anchors.centerIn: parent
                            iconSource: FluentIcons.AcceptMedium
                            iconSize: 15
                            visible: modelData === FluTheme.primaryColor
                            color: FluTheme.dark ? Qt.rgba(0,0,0,1) : Qt.rgba(1,1,1,1)
                        }
                        MouseArea{
                            id:mouse_item
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                MainEvent.primaryColor = modelData
                            }
                        }
                    }
                }
            }
            FluText{
                text:qsTr("Native text rendering")
                font: FluTextStyle.BodyStrong
                Layout.topMargin: 20
            }
            FluToggleSwitch{
                Layout.topMargin: 5
                selected: MainEvent.nativeText
                clickFunc:function(){
                    MainEvent.nativeText = !MainEvent.nativeText
                }
            }
        }
    }

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 80
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                top: parent.top
                left: parent.left
            }

            FluText{
                text:qsTr("Locale")
                font: FluTextStyle.BodyStrong
                Layout.bottomMargin: 4
            }

            Flow{
                spacing: 5
                Repeater{
                    model: ["简体中文","English"]
                    delegate:  FluRadioButton{
                        selected : MainEvent.language === modelData
                        text:modelData
                        onClicked:{
                            MainEvent.language = modelData
                        }
                    }
                }
            }
        }
    }


}
