#include "hashcalculatemd4.hpp"
#include <QtCore>

HashCalculateMd4::HashCalculateMd4(QObject *parent) :
QObject(parent)
{
    iHashValue = "";
}

void HashCalculateMd4::calculateHash(const QString& aOriginalText )
{
    emit hashStarted();
    QCryptographicHash hash(QCryptographicHash::Md4);
    hash.addData(aOriginalText.toUtf8());
    SetHash(QString(hash.result().toHex()));
}

void HashCalculateMd4::calculateFileHash(QString fileName)
{
    emit hashStarted();
    QCryptographicHash filehash(QCryptographicHash::Md4);
    QFile file(fileName);
    file.open(QFile::ReadOnly);
    while(!file.atEnd()){
        filehash.addData(file.read(8192));
    }
    QByteArray filehasharray = filehash.result();
    SetHash(QString(filehasharray.toHex()));
}

void HashCalculateMd4::SetHash(const QString& aHashValue)
{
    iHashValue = aHashValue;
}

QString HashCalculateMd4::getHash()
{
    emit hashComplete();
    return iHashValue;
}
