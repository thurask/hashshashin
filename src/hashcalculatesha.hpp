#ifndef HASHCALCULATESHA_H_
#define HASHCALCULATESHA_H_

#include <QObject>

class HashCalculateSha : public QObject
{
    Q_OBJECT
public:
    explicit HashCalculateSha(QObject *parent = 0);
    Q_INVOKABLE void calculateHash(const QString& aOriginalText );
    Q_INVOKABLE void calculateFileHash(QString fileName);

signals:

public slots:
       QString getHash();
       void SetHash(const QString& aHashValue);
public:
       QString iHashValue;
};

#endif /* HASHCALCULATESHA_H_ */
