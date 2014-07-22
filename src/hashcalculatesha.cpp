#include "hashcalculatesha.hpp"
#include <QtCore>

HashCalculateSha::HashCalculateSha(QObject *parent) :
QObject(parent)
{
    iHashValue = "";
}

void HashCalculateSha::calculateHash(const QString& aOriginalText )
{
    emit hashStarted();
    QCryptographicHash hash(QCryptographicHash::Sha1);
    hash.addData(aOriginalText.toUtf8());
    SetHash(QString(hash.result().toHex()));
}

void HashCalculateSha::calculateFileHash(QString fileName)
{
    emit hashStarted();
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
    emit hashComplete();
    return iHashValue;
}
