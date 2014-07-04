#ifndef SAVEFILE_HPP_
#define SAVEFILE_HPP_

#include <QtCore>

class SaveFile: public QObject {
        Q_OBJECT

public:
        SaveFile();
        virtual ~SaveFile();

        Q_INVOKABLE
        void saveTextFile(QString inputText, QString hashMethod);
};

#endif /* SAVEFILE_HPP_ */
