#ifndef HASHCALCULATESHA_HPP_
#define HASHCALCULATESHA_HPP_

#include <QtCore>

class HashCalculateSha : public QObject
{
    Q_OBJECT
public:
    explicit HashCalculateSha(QObject *parent = 0);
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

#endif /* HASHCALCULATESHA_HPP_ */
