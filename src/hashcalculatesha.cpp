#include "hashcalculatesha.hpp"
#include <QCryptographicHash>
#include <QFile>
#include "QDebug"
HashCalculateSha::HashCalculateSha(QObject *parent) :
    QObject(parent)
{
    iHashValue = "";
}

void HashCalculateSha::calculateHash(const QString& aOriginalText )
{
 QCryptographicHash hash(QCryptographicHash::Sha1);
 hash.addData(aOriginalText.toUtf8());
 SetHash(QString(hash.result().toHex()));
}

void HashCalculateSha::calculateFileHash(QString fileName)
{
 QCryptographicHash filehash(QCryptographicHash::Sha1);
 QFile file(fileName);
 file.open(QFile::ReadOnly);
 while(!file.atEnd()){
     filehash.addData(file.read(8192));
 }
 QByteArray filehasharray = filehash.result();
 SetHash(QString(filehasharray.toHex()));
}

void HashCalculateSha::SetHash(const QString& aHashValue)
{
 iHashValue = aHashValue;
}

QString HashCalculateSha::getHash()
{
 return iHashValue;
}
