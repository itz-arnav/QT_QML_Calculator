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

protected:
    virtual bool eventFilter(QObject *obj, QEvent *event) override;

signals:
    void mainWindowVisibilityChanged(bool flag);

private:
    int m_width;
    int m_height;
    QQuickView *_window;
    bool _isDragging = false;
};

#endif // FLOATINGWINDOW_H
