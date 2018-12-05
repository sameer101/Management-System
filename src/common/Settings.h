#pragma once

#include <QStandardPaths>
#include <QString>

namespace common{
    class Settings;
}

class Settings
{
public:
    static const QString DATABASE_DIR;
    static const  QString SQLITE_DATABASE_NAME;
};


