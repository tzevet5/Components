#pragma once

#include <QtCore>
#include <QtQml/qqmlregistration.h>

class Camera : public QObject {
  Q_OBJECT
  QML_ELEMENT

private:
  int m_answer;

public:
  explicit Camera(QObject *parent = nullptr);
};
