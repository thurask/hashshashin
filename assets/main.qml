/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import bb.cascades.pickers 1.0
import bb.system 1.2

Page {
    property bool pickermode
    property string hashmode
    attachedObjects: [
        ComponentDefinition {
            id: helpSheetDefinition
            HelpSheet {
            }
        },
        ComponentDefinition {
            id: settingsSheetDefinition
            SettingsSheet {
            }
        },
        FilePicker {
            id: picker
            property string selectedFile
            title: "File Picker"
            mode: FilePickerMode.Picker
            type: FileType.Other
            viewMode: FilePickerViewMode.Default
            sortBy: FilePickerSortFlag.Default
            sortOrder: FilePickerSortOrder.Default
            onFileSelected: {
                selectedFile = selectedFiles[0]
            }
        },
        SystemToast {
            id: hashToast
            body: ""
        }
    ]
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            onTriggered: {
                var help = helpSheetDefinition.createObject()
                help.open();
            }
        }
        settingsAction: SettingsActionItem {
            onTriggered: {
                var settings = settingsSheetDefinition.createObject()
                settings.open();
            }
        }
    }
    titleBar: TitleBar {
        title: qsTr("Hashshashin %1").arg(AppInfo.version)
    }
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom
        }
        Container {
            topPadding: 20.0
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                text: "File mode:"
                verticalAlignment: VerticalAlignment.Center
            }
            ToggleButton {
                id: togglebutton
                verticalAlignment: VerticalAlignment.Center
                onCheckedChanged: {
                    if (checked == true){
                        pickermode = true;
                    }
                    else {
                        pickermode = false;
                    }
                }
            }
        }
        Divider {
        }
        Container {
            topPadding: 20.0
            id: textmodecontainer
            visible: (pickermode == false)
            Label {
                text: "Enter text:"
            }
            TextArea {
                id: hashinput
                hintText: "Text to be hashed"
            }
        }
        Container {
            topPadding: 20.0
            id: pickermodecontainer
            visible: (pickermode == true)
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                    text: "Choose a file"
                    onClicked: {
                        resultLabel.visible = true;
                        picker.open();
                    }
                }
            }
            Label {
                id: resultLabel
                horizontalAlignment: HorizontalAlignment.Center
                text: qsTr("Selected file: %1").arg(picker.selectedFile)
                multiline: true
            }
        }
        Container {
            topPadding: 50.0
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                text: "Be patient with large files"
                visible: (pickermode == true)
            }
            Divider {
            }
            Container {
                topPadding: 10.0
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                    text: "MD4"
                    onClicked: {
                        hashmode = "MD4";
                        hashoutput_label.text = "Hashed output (MD4):";
                        hashoutput.text = "";
                        if (pickermode == false){
                            hashCalculateMd4.calculateHash(hashinput.text);
                            hashoutput.text = hashCalculateMd4.getHash();
                        }
                        else {
                            hashCalculateMd4.calculateFileHash(picker.selectedFile);
                            hashoutput.text = hashCalculateMd4.getHash();
                        }
                    }
                }
                Button {
                    text: "SHA-1"
                    onClicked: {
                        hashmode = "SHA1"
                        hashoutput_label.text = "Hashed output (SHA-1):";
                        hashoutput.text = "";
                        if (pickermode == false){
                            hashCalculateSha.calculateHash(hashinput.text);
                            hashoutput.text = hashCalculateSha.getHash();
                        }
                        else {
                            hashCalculateSha.calculateFileHash(picker.selectedFile);
                            hashoutput.text = hashCalculateSha.getHash();
                        }
                    }
                }
                Button {
                    text: "MD5"
                    onClicked: {
                        hashmode = "MD5"
                        hashoutput_label.text = "Hashed output (MD5):";
                        hashoutput.text = "";
                        if (pickermode == false ){
                            hashCalculateMd5.calculateHash(hashinput.text);
                            hashoutput.text = hashCalculateMd5.getHash();
                        }
                        else {
                            hashCalculateMd5.calculateFileHash(picker.selectedFile);
                            hashoutput.text = hashCalculateMd5.getHash();
                        }
                    }
                }
            }
        }
        Container {
            topPadding: 50.0
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            Label {
                id: hashoutput_label
                text: "Hashed output:"
            }
            TextArea {
                id: hashoutput
                text: ""
                editable: false
            }
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Button {
                    id: exportbutton
                    text: "Export to file"
                    onClicked: {
                        hashToast.body = "Hash saved to /downloads/hashshashin";            
                        hashToast.show();
                        if (togglebutton.checked == false){
                            var exporthash = (hashinput.text + " -- " + hashoutput.text);
                            savefile.saveTextFile(exporthash, hashmode);
                        }
                        if (togglebutton.checked == true){
                            var exporthash_file = (picker.selectedFile + " -- " + hashoutput.text);
                            savefile.saveTextFile(exporthash_file, hashmode);
                        }
                    }
                }
                Button {
                    id: clipboardbutton
                    text: "Copy to clipboard"
                    onClicked: {
                        hashToast.body = "Hash copied to clipboard";
                        hashToast.show();
                        Clipboard.copyToClipboard(hashoutput.text);
                    }
                }
            }
        }
    }
}