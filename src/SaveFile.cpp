/*
 * SaveFile.cpp
 *
 *  Created on: Jun 7, 2014
 *      Author: thura_000
 */

#include "SaveFile.hpp"

#include <QtCore>

SaveFile::SaveFile()
{
}

void SaveFile::saveTextFile(QString inputText, QString hashMethod)
{
    QDir dir("shared/downloads/hashshashin/");
    if (!dir.exists()) {
        dir.mkpath(".");
    }
    //Get local date and time
    QDateTime dateTime = QDateTime::currentDateTime();
    QString dateTimeString = dateTime.toString("yyyy_MMM_dd_hh_mm_ss");
    QFile file("shared/downloads/hashshashin/"+hashMethod+"--"+dateTimeString+".txt");
    file.open(QIODevice::WriteOnly);
    QTextStream outStream(&file);
    outStream << inputText;
    file.close();
}

SaveFile::~SaveFile()
{
}
