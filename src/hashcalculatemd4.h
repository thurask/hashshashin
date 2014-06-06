/*
 * hashcalculatemd4.h
 *
 *  Created on: Jun 6, 2014
 *      Author: thura_000
 */

#ifndef HASHCALCULATEMD4_H_
#define HASHCALCULATEMD4_H_

#include <QObject>

class HashCalculateMd4 : public QObject
{
    Q_OBJECT
public:
    explicit HashCalculateMd4(QObject *parent = 0);
    Q_INVOKABLE void calculateHash(const QString& aOriginalText );

signals:

public slots:
       QString getHash();
       void SetHash(const QString& aHashValue);
public:
       QString iHashValue;

};

#endif /* HASHCALCULATEMD4_H_ */
