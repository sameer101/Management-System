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

    QHostAddress *NetworkDevicesService::getInterface(){
        QHostAddress localHost = QHostAddress(QHostAddress::LocalHost);
        QHostAddress *inf = new QHostAddress[2];
          QList<QNetworkInterface> list = QNetworkInterface::allInterfaces();
          for(auto &add: list){
              for(auto &entry : add.addressEntries()){
                  if(entry.ip().protocol() ==  QAbstractSocket::IPv4Protocol && entry.ip()!=localHost )  {
                      std::string str =  entry.ip().toString().toStdString();
                      // Needs to be improved.
                      if(str.substr(0, str.find_last_of(".")) == "192.168.1"){
                          inf[0] = entry.ip();
                          inf[1] = entry.netmask();
                      }
                     }
              }
      }
        return inf;
 }

 QList<QString> NetworkDevicesService::getAllIps(QHostAddress &ip, QHostAddress &mask){
     struct in_addr ipaddress, subnetmask;

     inet_pton(AF_INET, ip.toString().toStdString().c_str() , &ipaddress);
     inet_pton(AF_INET, mask.toString().toStdString().c_str(), &subnetmask);

      QList<QString> ips;
      unsigned long first_ip = ntohl(ipaddress.s_addr & subnetmask.s_addr);
      unsigned long last_ip = ntohl(ipaddress.s_addr | ~(subnetmask.s_addr));
      for (unsigned long ip = first_ip; ip <= last_ip; ++ip) {
          unsigned long theip = htonl(ip);

             struct in_addr x;

             x.s_addr = theip;

             ips.append(inet_ntoa(x));

      }

       return ips;
 }
