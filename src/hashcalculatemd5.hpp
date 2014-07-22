#ifndef HASHCALCULATEMD5_HPP_
#define HASHCALCULATEMD5_HPP_

#include <QtCore>

class HashCalculateMd5 : public QObject
{
    Q_OBJECT
public:
    explicit HashCalculateMd5(QObject *parent = 0);
    QString iHashValue;
    Q_INVOKABLE void calculateHash(const QString& aOriginalText );
    Q_INVOKABLE void calculateFileHash(QString fileName);

    signals:
    void hashStarted();
    void hashComplete();

public slots:
       QString getHash();
       void SetHash(const QString& aHashValue);
};
#endif /* HASHCALCULATEMD5_HPP_ */
