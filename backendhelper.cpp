#include "backendhelper.h"

BackendHelper::BackendHelper(QQmlApplicationEngine *engine, QObject *parent)
{
    m_appEngine = engine;
    m_floatingWindow = new FloatingWindow(engine, 200, 200, parent);
    connect(m_floatingWindow,
            &FloatingWindow::mainWindowVisibilityChanged,
            this,
            &BackendHelper::mainWindowVisibilityChanged);
}

void BackendHelper::show()
{
    m_floatingWindow->show();
    setisHelperVisible(true);
}

void BackendHelper::hide()
{
    m_floatingWindow->hide();
    setisHelperVisible(false);
}

bool BackendHelper::isHelperVisible() const
{
    return m_isHelperVisible;
}

void BackendHelper::setisHelperVisible(bool newIsHelperVisible)
{
    if (m_isHelperVisible == newIsHelperVisible)
        return;
    m_isHelperVisible = newIsHelperVisible;
    emit isHelperVisibleChanged(m_isHelperVisible);
}
