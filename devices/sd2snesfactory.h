#ifndef SD2SNESFACTORY_H
#define SD2SNESFACTORY_H

#include <QMap>
#include <QObject>

#include "../devicefactory.h"
#include "sd2snesdevice.h"

class SD2SnesFactory : public DeviceFactory
{
    Q_OBJECT
public:
    SD2SnesFactory();

    // DeviceFactory interface
public:
    QStringList listDevices();
    ADevice *attach(QString deviceName);
    QString status();
    QString name() const;
    bool deleteDevice(ADevice *);

private:
    QMap<QString, SD2SnesDevice*>   mapPortDev;
};

#endif // SD2SNESFACTORY_H
