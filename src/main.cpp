#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <string.h>

#include "controller/DatabaseService.h"
#include "database/sqlitedb.h"
#include "database/IDataBase.h"
#include "service/networkdevicesservice.h"

template<class T>
class DatabaseService;

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QFontDatabase fontDatabase;
    if(fontDatabase.addApplicationFont(":/view/assets/fonts/MaterialIcons-Regular.ttf") == -1){
        qWarning("/n Failed to load Material Icons /n");
    }
    if(fontDatabase.addApplicationFont(":/view/assets/fonts/Roboto-Light.ttf") == -1){
        qWarning("/n Failed to load fonts /n");
    }
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;



    QString ip, mask;
    NetworkDevicesService::getInterface(ip, mask);
    //BYTE * macAddress = NetworkDevicesService::getMacAddress(,"192.168.1.100");


    controller::DatabaseService<SqliteDB> *sqliteDb = new controller::DatabaseService<SqliteDB>();
    return app.exec();
}


