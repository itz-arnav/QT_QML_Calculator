#include "backendhelper.h"

BackendHelper::BackendHelper(QQmlApplicationEngine *engine, QObject *parent)
{
    m_appEngine = engine;
    m_floatingWindow = new FloatingWindow(engine, 200, 200, parent);
}

void BackendHelper::show()
{
    m_floatingWindow->show();
}

void BackendHelper::hide()
{
    m_floatingWindow->hide();
}
