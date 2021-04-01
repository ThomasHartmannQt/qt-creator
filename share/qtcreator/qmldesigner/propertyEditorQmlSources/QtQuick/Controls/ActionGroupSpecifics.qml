/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Creator.
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0

Column {
    anchors.left: parent.left
    anchors.right: parent.right
    Section {
        caption: "ActionGroup"
        anchors.left: parent.left
        anchors.right: parent.right
        Column {
            width: parent.width
            Column {
                width: parent.width
                leftPadding: 8
                rightPadding: 0
                topPadding: 4
                bottomPadding: 4
                SectionLayout {
                    Label {
                        text: "Enabled"
                        tooltip: qsTr("Wheather the action is enabled.")
                    }

                    SecondColumnLayout {
                        CheckBox {
                            text: backendValues.enabled.valueToString
                            backendValue: backendValues.enabled
                        }

                        ExpandingSpacer {
                        }
                    }
                    Label {
                        text: "Exclusive"
                        tooltip: qsTr("Wheather the action is exclusive.")
                    }

                    SecondColumnLayout {
                        CheckBox {
                            text: backendValues.exclusive.valueToString
                            backendValue: backendValues.exclusive
                        }

                        ExpandingSpacer {
                        }
                    }
                    Label {
                        text: qsTr("Buttons")
                    }
                    SecondColumnLayout {
                        EditableListView {
                            id: actionListView
                            backendValue: backendValues.actions
                            model: actionListView.backendValue.expressionAsList
                            Layout.fillWidth: true
                            typeFilter: "Controls.Action"

                            onAdd: function(value) { actionListView.backendValue.idListAdd(value) }
                            onRemove: function(idx) { actionListView.backendValue.idListRemove(idx) }
                            onReplace: function (idx, value) { actionListView.backendValue.idListReplace(idx, value) }
                        }
                    }
                }
            }
        }
    }
}
