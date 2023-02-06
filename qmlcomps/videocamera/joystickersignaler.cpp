#include "joystickersignaler.h"
#include <QtQml>

JoyStickerSignaler::JoyStickerSignaler(QObject *parent)
    : QObject{parent}
{

}

float JoyStickerSignaler::axisX() const
{
    return m_axisX;
}

void JoyStickerSignaler::setAxisX(float newAxisX)
{
    if (m_axisX == newAxisX)
        return;
    m_axisX = newAxisX;
    emit axisXChanged();
}

float JoyStickerSignaler::axisY() const
{
    return m_axisY;
}

void JoyStickerSignaler::setAxisY(float newAxisY)
{
    if (qFuzzyCompare(m_axisY, newAxisY))
        return;
    m_axisY = newAxisY;
    emit axisYChanged();
}

float JoyStickerSignaler::zoomFactor() const
{
    return m_zoomFactor;
}

void JoyStickerSignaler::setZoomFactor(float newZoomFactor)
{
    if (qFuzzyCompare(m_zoomFactor, newZoomFactor))
        return;
    m_zoomFactor = newZoomFactor;
    emit zoomFactorChanged();
}

void registerTypes() {
    qmlRegisterType<JoyStickerSignaler>("JoyStickControl", 1, 0, "JoyStickSignaler");
}

Q_COREAPP_STARTUP_FUNCTION(registerTypes);
