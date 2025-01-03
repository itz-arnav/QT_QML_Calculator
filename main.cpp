#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "backendhelper.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    BackendHelper *backendHelper = new BackendHelper(&engine);
    engine.rootContext()->setContextProperty("cBackendHelper", backendHelper);
    const QUrl url(u"qrc:/Calculator/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);
    app.setQuitOnLastWindowClosed(false);
    return app.exec();
}
