/*
 * hashcalculatemd5.h
 *
 *  Created on: Jun 6, 2014
 *      Author: thura_000
 */

#ifndef HASHCALCULATEMD5_H_
#define HASHCALCULATEMD5_H_

#include <QObject>

class HashCalculateMd5 : public QObject
{
    Q_OBJECT
public:
    explicit HashCalculateMd5(QObject *parent = 0);
    Q_INVOKABLE void calculateHash(const QString& aOriginalText );

signals:

public slots:
       QString getHash();
       void SetHash(const QString& aHashValue);
public:
       QString iHashValue;

};

#endif /* HASHCALCULATEMD5_H_ */
