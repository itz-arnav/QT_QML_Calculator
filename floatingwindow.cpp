#include "floatingwindow.h"

FloatingWindow::FloatingWindow(QQmlApplicationEngine *engine, int width, int height, QObject *parent)
{
    m_width = width;
    m_height = height;

    QQuickView *d = new QQuickView(engine, nullptr);
    d->setFlags(Qt::Popup | Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint);

    d->setBaseSize(QSize(width, height));
    d->setHeight(height);
    d->setWidth(width);
    d->setMinimumSize(QSize(width, height));
    d->setMaximumSize(QSize(width, height));
    d->installEventFilter(this);

    d->setResizeMode(QQuickView::SizeRootObjectToView);
    _window = d;
}

void FloatingWindow::show()
{
    QQuickView *d = (QQuickView *) _window;
    d->setSource(QUrl(QLatin1String("qrc:/Calculator/Helper.qml")));
    d->show();
}

void FloatingWindow::hide()
{
    QQuickView *d = (QQuickView *) _window;
    d->hide();
}
