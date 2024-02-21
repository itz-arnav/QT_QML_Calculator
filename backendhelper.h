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
    Q_PROPERTY(int helperWidth READ helperWidth WRITE setHelperWidth NOTIFY helperWidthChanged FINAL)
    Q_PROPERTY(
        int helperHeight READ helperHeight WRITE setHelperHeight NOTIFY helperHeightChanged FINAL)
public:
    explicit BackendHelper(QQmlApplicationEngine *engine, QObject *parent = nullptr);
    Q_INVOKABLE void show();
    Q_INVOKABLE void hide();

    bool isHelperVisible() const;
    void setisHelperVisible(bool newIsHelperVisible);

    int helperWidth() const;
    void setHelperWidth(int newHelperWidth);

    int helperHeight() const;
    void setHelperHeight(int newHelperHeight);

signals:
    void mainWindowVisibilityChanged(bool flag);

    void isHelperVisibleChanged(bool visibleStatus);

    void helperWidthChanged();

    void helperHeightChanged();

private:
    QQmlApplicationEngine *m_appEngine;
    FloatingWindow *m_floatingWindow;
    bool m_isHelperVisible;
    int m_helperWidth;
    int m_helperHeight;
};

#endif // BACKENDHELPER_H
