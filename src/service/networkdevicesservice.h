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

        static BYTE * getMacAddress(const QString &srcIpStr, const QString &destIpStr);
        static void getInterface(QString &ip, QString &mask);
        static QList<QString> getAllIps(QString &ip, QString &mask);

};
