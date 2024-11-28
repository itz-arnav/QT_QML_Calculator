#include "floatingwindow.h"

FloatingWindow::FloatingWindow(QQmlApplicationEngine *engine, int width, int height, QObject *parent)
{
    m_width = width;
    m_height = height;

    QQuickView *d = new QQuickView(engine, nullptr);
    d->setFlags(Qt::WindowFlags(Qt::Popup | Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint
                                | Qt::NoFocus));
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
    d->raise(); // Bring the window to the front
    d->requestActivate();
    emit mainWindowVisibilityChanged(false);
}

void FloatingWindow::hide()
{
    QQuickView *d = (QQuickView *) _window;
    d->hide();
    emit mainWindowVisibilityChanged(true);
}

bool FloatingWindow::eventFilter(QObject *obj, QEvent *event)
{
    Q_UNUSED(obj)
    static QPointF _mousePosition;

    switch (event->type()) {
    case QEvent::MouseButtonPress: {
        auto *evt = dynamic_cast<QMouseEvent *>(event);
        if (evt) {
            _mousePosition = evt->globalPosition();
            QPointF relativePos = evt->pos();
            _isDragging = (relativePos.y() < 44);
        }
        break;
    }
    case QEvent::MouseButtonRelease:
        _isDragging = false;
        break;
    case QEvent::MouseMove:
        if (_isDragging && _window) {
            auto *evt = dynamic_cast<QMouseEvent *>(event);
            if (evt) {
                const QPointF delta = evt->globalPosition() - _mousePosition;
                auto *d = qobject_cast<QQuickView *>(_window);
                if (d) {
                    QPointF newPoint(d->x() + delta.x(), d->y() + delta.y());
                    d->setPosition(newPoint.toPoint());
                    _mousePosition = evt->globalPosition();
                }
            }
        }
        break;
    default:
        break;
    }
    return false;
}
