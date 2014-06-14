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

Page {
    property bool pickermode
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
        title: "Hashshashin"
        }
    Container {
        Label {
            text: "Enter text:"
        }
        TextArea {
            id: hashinput
            hintText: "Text to be hashed"
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            Button {
                text: "MD4"
                horizontalAlignment: HorizontalAlignment.Left
                onClicked: {
                    hashoutput_label.text = "Hashed output (MD4):";
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
                horizontalAlignment: HorizontalAlignment.Center
                onClicked: {
                    hashoutput_label.text = "Hashed output (SHA-1):";
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
                horizontalAlignment: HorizontalAlignment.Right
                onClicked: {
                    hashoutput_label.text = "Hashed output (MD5):";
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
        Label {
            id: hashoutput_label
            text: "Hashed output:"
        }
        TextArea {
            id: hashoutput
            text: ""
            editable: false
        }
        Button {
            horizontalAlignment: HorizontalAlignment.Center
            text: "Choose a file"
            onClicked: {
                pickermode = true;
                picker.open();
            }
        }
        Label {
            id: resultLabel
            horizontalAlignment: HorizontalAlignment.Center
            text: qsTr("Selected file: %1").arg(picker.selectedFile)
            multiline: true
            visible: (picker.selectedFile != "")
        }
    }
}