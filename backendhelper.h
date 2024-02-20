#ifndef BACKENDHELPER_H
#define BACKENDHELPER_H

#include <QObject>
#include <QQmlApplicationEngine>
#include "floatingwindow.h"

class BackendHelper : public QObject
{
    Q_OBJECT

public:
    explicit BackendHelper(QQmlApplicationEngine *engine, QObject *parent = nullptr);
    Q_INVOKABLE void show();
    Q_INVOKABLE void hide();

private:
    QQmlApplicationEngine *m_appEngine;
    FloatingWindow *m_floatingWindow;
};

#endif // BACKENDHELPER_H
