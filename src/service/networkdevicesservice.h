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

        /**
         * \brief Send ARP request to get phisical address of the provided ip address.
         * \param srcIpStr ip address of machine that sends ARP request.
         * \param destIpStr ip address of destination device.
         * \return The mac address of destination device.
         */
        static BYTE * getMacAddress(const QString &srcIpStr, const QString &destIpStr);

        /**
         * \brief getInterface
         * \param ip out[] Interface ip address.
         * \param mask out[] Interface subnet mask address.
         */
        static void getInterface(QString &ip, QString &mask);

        /**
         * \brief getAllIps Get all available ips addresses in the current subnet.
         * \param ip in[] Ip address of machine interface.
         * \param mask in[] sunbnet mask address of machine's ip address.
         * \return List of available ip addresses.
         */
        static QList<QString> getAllIps(QString &ip, QString &mask);

};
