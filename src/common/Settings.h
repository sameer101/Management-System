#pragma once

#include <QStandardPaths>
#include <QString>

namespace common{
    class Settings;
}

class Settings
{
public:
    Settings();
    const QString DATABASE_DIR = QString(QStandardPaths::DocumentsLocation);
    const  QString SQLITE_DATABASE_NAME = DATABASE_DIR + "db.sqlite";
};


