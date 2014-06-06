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

Page {
    attachedObjects: [
        ComponentDefinition {
            id: helpSheetDefinition
            HelpSheet {
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
                    hashCalculateMd4.calculateHash(hashinput.text)
                    hashoutput.text = hashCalculateMd4.getHash()
                    hashoutput_label.text = "Hashed output (MD4):"
                }
            }
            Button {
                text: "SHA-1"
                horizontalAlignment: HorizontalAlignment.Center
                onClicked: {
                    hashCalculateSha.calculateHash(hashinput.text)
                    hashoutput.text = hashCalculateSha.getHash()
                    hashoutput_label.text = "Hashed output (SHA-1):"
                }  
            }
            Button {
                text: "MD5"
                horizontalAlignment: HorizontalAlignment.Right
                onClicked: {
                    hashCalculateMd5.calculateHash(hashinput.text)
                    hashoutput.text = hashCalculateMd5.getHash()
                    hashoutput_label.text = "Hashed output (MD5):"
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
    }
}