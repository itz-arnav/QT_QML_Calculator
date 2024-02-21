#ifndef BACKENDHELPER_H
#define BACKENDHELPER_H

#include <QObject>
#include <QQmlApplicationEngine>
#include "floatingwindow.h"

class BackendHelper : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isHelperVisible READ isHelperVisible WRITE setisHelperVisible NOTIFY
                   isHelperVisibleChanged FINAL)
public:
    explicit BackendHelper(QQmlApplicationEngine *engine, QObject *parent = nullptr);
    Q_INVOKABLE void show();
    Q_INVOKABLE void hide();

    bool isHelperVisible() const;
    void setisHelperVisible(bool newIsHelperVisible);

signals:
    void mainWindowVisibilityChanged(bool flag);

    void isHelperVisibleChanged(bool visibleStatus);

private:
    QQmlApplicationEngine *m_appEngine;
    FloatingWindow *m_floatingWindow;
    bool m_isHelperVisible;
};

#endif // BACKENDHELPER_H
