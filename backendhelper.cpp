#include "backendhelper.h"

BackendHelper::BackendHelper(QQmlApplicationEngine *engine, QObject *parent)
{
    m_appEngine = engine;
    m_helperWidth = 300;
    m_helperHeight = 400;
    m_floatingWindow = new FloatingWindow(engine, m_helperWidth, m_helperHeight, parent);
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

int BackendHelper::helperWidth() const
{
    return m_helperWidth;
}

void BackendHelper::setHelperWidth(int newHelperWidth)
{
    if (m_helperWidth == newHelperWidth)
        return;
    m_helperWidth = newHelperWidth;
    emit helperWidthChanged();
}

int BackendHelper::helperHeight() const
{
    return m_helperHeight;
}

void BackendHelper::setHelperHeight(int newHelperHeight)
{
    if (m_helperHeight == newHelperHeight)
        return;
    m_helperHeight = newHelperHeight;
    emit helperHeightChanged();
}
