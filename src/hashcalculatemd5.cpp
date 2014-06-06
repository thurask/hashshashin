#include "hashcalculatemd5.h"
#include <QCryptographicHash>
#include "QDebug"
HashCalculateMd5::HashCalculateMd5(QObject *parent) :
    QObject(parent)
{
    iHashValue = "";
}

void HashCalculateMd5::calculateHash(const QString& aOriginalText )
{
 QCryptographicHash hash(QCryptographicHash::Md5);
 hash.addData(aOriginalText.toUtf8());
 SetHash(QString(hash.result().toHex()));
}

void HashCalculateMd5::SetHash(const QString& aHashValue)
{
 iHashValue = aHashValue;
}

QString HashCalculateMd5::getHash()
{
 return iHashValue;
}
