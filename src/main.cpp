#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <string.h>
#include "service/networkdevicesservice.h"
#include <QQuickView>
#include <QQmlContext>

#include "controller/DatabaseService.h"
#include "database/sqlitedb.h"
#include "database/IDataBase.h"

#include "model/userlistmodel.h"

template<class T>
class DatabaseService;

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //qmlRegisterType<UserListModel>("models.userlist", 1, 0, "User");
    QGuiApplication app(argc, argv);

    QFontDatabase fontDatabase;
    if(fontDatabase.addApplicationFont(":/view/assets/fonts/MaterialIcons-Regular.ttf") == -1){
        qWarning("/n Failed to load Material Icons /n");
    }
    if(fontDatabase.addApplicationFont(":/view/assets/fonts/Roboto-Light.ttf") == -1){
        qWarning("/n Failed to load fonts /n");
    }
    QQmlApplicationEngine engine;

    QString ip, mask;
    NetworkDevicesService::getInterface(ip, mask);
    UserListModel *userlistModel = new UserListModel();
//    for(QString &addr : NetworkDevicesService::getAllIps(ip,mask)){
//        BYTE * macAddress = NetworkDevicesService::getMacAddress(addr,"192.168.1.100");
//        if(macAddress == nullptr){
//            delete macAddress;
//        }
//        else{
//            QString a = "12:3e:3w:4r:33";
//            userlistModel.addUser(User(a));
//            userlistModel.addUser(User(a));
//            userlistModel.addUser(User(a));
//            userlistModel.addUser(User(a));
//            userlistModel.addUser(User(a));
//            userlistModel.addUser(User(a));
//        }
//    }

    QString mac = "12:3e:3w:4r:33";
    userlistModel->addUser(User(mac));
    userlistModel->addUser(User(mac));
    userlistModel->addUser(User(mac));
    userlistModel->addUser(User(mac));
    userlistModel->addUser(User(mac));
    userlistModel->addUser(User(mac));

    engine.rootContext()->setContextProperty("usersModel", userlistModel);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QModelIndex ix = userlistModel->index(1, 0);
    QVariant v1 = userlistModel->data(ix, Qt::UserRole + 1);

	qDebug() << "===========" << v1.toString();
    controller::DatabaseService<SqliteDB> *sqliteDb = new controller::DatabaseService<SqliteDB>();
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}


