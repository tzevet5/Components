#ifndef JOYSTICKERSIGNALER_H
#define JOYSTICKERSIGNALER_H

#include <QObject>

class JoyStickerSignaler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float axisX READ axisX WRITE setAxisX NOTIFY axisXChanged)
    Q_PROPERTY(float axisY READ axisY WRITE setAxisY NOTIFY axisYChanged)
    Q_PROPERTY(float zoomFactor READ zoomFactor WRITE setZoomFactor NOTIFY zoomFactorChanged)
public:
    explicit JoyStickerSignaler(QObject *parent = nullptr);

    float axisX() const;
    void setAxisX(float newAxisX);

    float axisY() const;
    void setAxisY(float newAxisY);

    float zoomFactor() const;
    void setZoomFactor(float newZoomFactor);

signals:

    void axisXChanged();
    void axisYChanged();

    void zoomFactorChanged();

private:
    float m_axisX;
    float m_axisY;
    float m_zoomFactor;
};

#endif // JOYSTICKERSIGNALER_H
