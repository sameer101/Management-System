#pragma once
#include <QVector>
#include <QString>
#include <QNetworkInterface>
#include <WinSock2.h>
#include <IPHlpApi.h>
#include <stdio.h>
#include <stdlib.h>
#include <WS2tcpip.h>

namespace service{
    class NetworkDevicesService;
}

class NetworkDevicesService{

    private:
        static  QString TAG;
    public:
        static  BYTE * NetworkDevicesService::getMacAddress(const QString &srcIpStr, const QString &destIpStr);
        static QHostAddress *getInterface();
        static QList<QString> getAllIps(QHostAddress &ip, QHostAddress &mask);

};
