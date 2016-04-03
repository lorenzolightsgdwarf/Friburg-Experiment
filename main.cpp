#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "logger.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<Logger>("Logger", 1, 0, "Logger");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();

}
