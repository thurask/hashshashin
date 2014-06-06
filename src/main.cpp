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

#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>

#include <QCryptographicHash>

#include "hashcalculatesha.h"
#include "hashcalculatemd5.h"
#include "hashcalculatemd4.h"

using namespace bb::cascades;

Q_DECL_EXPORT int main(int argc, char **argv)
{
    Application app(argc, argv);

    //SHA-1
    HashCalculateSha*ihashcalcsha =  new HashCalculateSha();
    QmlDocument::defaultDeclarativeEngine()->rootContext()->setContextProperty("hashCalculateSha", ihashcalcsha);
    //MD5
    HashCalculateMd5*ihashcalcmd5 =  new HashCalculateMd5();
    QmlDocument::defaultDeclarativeEngine()->rootContext()->setContextProperty("hashCalculateMd5", ihashcalcmd5);
    //MD4
    HashCalculateMd4*ihashcalcmd4 =  new HashCalculateMd4();
    QmlDocument::defaultDeclarativeEngine()->rootContext()->setContextProperty("hashCalculateMd4", ihashcalcmd4);

    // Create the Application UI object, this is where the main.qml file
    // is loaded and the application scene is set.
    ApplicationUI appui;

    // Enter the application main event loop.
    return Application::exec();
}
