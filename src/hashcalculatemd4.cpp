/*
 * hashcalculatemd4.cpp
 *
 *  Created on: Jun 6, 2014
 *      Author: thura_000
 */

#include "hashcalculatemd4.h"
#include <QCryptographicHash>
#include "QDebug"
HashCalculateMd4::HashCalculateMd4(QObject *parent) :
    QObject(parent)
{
    iHashValue = "";
}

void HashCalculateMd4::calculateHash(const QString& aOriginalText )
{
 QCryptographicHash hash(QCryptographicHash::Md4);
 hash.addData(aOriginalText.toUtf8());
 SetHash(QString(hash.result().toHex()));
}

void HashCalculateMd4::SetHash(const QString& aHashValue)
{
 iHashValue = aHashValue;
}

QString HashCalculateMd4::getHash()
{
 return iHashValue;
}


