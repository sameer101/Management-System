#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <string.h>
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
    return app.exec();
}
