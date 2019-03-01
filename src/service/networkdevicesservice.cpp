#include "networkdevicesservice.h"

 QString NetworkDevicesService::TAG =  "NetworkDevicesService";

 BYTE * NetworkDevicesService::getMacAddress(const QString &srcIpStr, const QString &destIpStr){
    ULONG macAddrLength = 6;
    BYTE * phyaddr = nullptr;
    ULONG macAddress[2];
    DWORD dwRetVal;
    IPAddr destIpAddr = 0;
    IPAddr srcIpAddr = 0;
    if(destIpStr.isEmpty() || destIpStr.isNull()){
        qDebug("Destination Ip address should not be null or empty");
    }
    // Used inet_pton instead of deprecated inet_addr().
    // AF_INET = Ipv4
    inet_pton(AF_INET, destIpStr.toStdString().c_str(), &destIpAddr);
    inet_pton(AF_INET, srcIpStr.toStdString().c_str(), &srcIpAddr);
    memset(&macAddress, 0xff, sizeof(macAddress));
    dwRetVal = SendARP(destIpAddr, srcIpAddr, &macAddress, &macAddrLength);
    if(dwRetVal == NO_ERROR){
       phyaddr = reinterpret_cast<BYTE *>(macAddress);
    }else{
        printf("Error: SendArp failed with error: %d", static_cast<int>(dwRetVal));
               switch (dwRetVal) {
               case ERROR_GEN_FAILURE:
                   printf(" (ERROR_GEN_FAILURE)\n");
                   break;
               case ERROR_INVALID_PARAMETER:
                   printf(" (ERROR_INVALID_PARAMETER)\n");
                   break;
               case ERROR_INVALID_USER_BUFFER:
                   printf(" (ERROR_INVALID_USER_BUFFER)\n");
                   break;
               case ERROR_BAD_NET_NAME:
                   printf(" (ERROR_GEN_FAILURE)\n");
                   break;
               case ERROR_BUFFER_OVERFLOW:
                   printf(" (ERROR_BUFFER_OVERFLOW)\n");
                   break;
               case ERROR_NOT_FOUND:
                   printf(" (ERROR_NOT_FOUND)\n");
                   break;
               default:
                   printf("\n");
                   break;
               }
    }
    return phyaddr;
}

void NetworkDevicesService::getInterface(QString &ip, QString &mask){
     QHostAddress localHost = QHostAddress(QHostAddress::LocalHost);
     QList<QNetworkInterface> list = QNetworkInterface::allInterfaces();
        for(auto &add: list){
            for(auto &entry : add.addressEntries()){
                if(entry.ip().protocol() ==  QAbstractSocket::IPv4Protocol && entry.ip()!=localHost )  {
                  std::string str =  entry.ip().toString().toStdString();
                  // Needs to be improved.
                  if(str.substr(0, str.find_last_of(".")) == "192.168.1"){
                     ip = entry.ip().toString();
                     mask = entry.netmask().toString();
                  }
                }
           }
       }
        if(ip.isEmpty() || ip.isNull()){
            qDebug() << TAG << "No Interface was returned";
        }
  }

 QList<QString> NetworkDevicesService::getAllIps(QString &ip, QString &mask){
     struct in_addr ipaddress, subnetmask;

    // Convert sting ddresses into ipv4 addresses.
    inet_pton(AF_INET, ip.toStdString().c_str() , &ipaddress);
    inet_pton(AF_INET, mask.toStdString().c_str(), &subnetmask);

    // List of available ip addresses in the subnet.
    QList<QString> ips;
    // Getting first ip by bitwising ip address with mask(&)
    unsigned long first_ip = ntohl(ipaddress.s_addr & subnetmask.s_addr);
    // Getting last ip by bitwising ip address with mask(|)
    unsigned long last_ip = ntohl(ipaddress.s_addr | ~(subnetmask.s_addr));
    for (unsigned long ip = first_ip; ip <= last_ip; ++ip) {
        unsigned long theip = htonl(ip);
        struct in_addr x;
        x.s_addr = theip;
        // Needs to be improved (deprcated function).
        ips.append(inet_ntoa(x));
    }

    return ips;
 }
