#ifndef FLOATINGWINDOW_H
#define FLOATINGWINDOW_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <QQuickView>

class FloatingWindow : public QObject
{
    Q_OBJECT

public:
    explicit FloatingWindow(QQmlApplicationEngine *engine,
                            int width,
                            int height,
                            QObject *parent = nullptr);

    void show();
    void hide();

private:
    int m_width;
    int m_height;
    QQuickView *_window;
};

#endif // FLOATINGWINDOW_H
