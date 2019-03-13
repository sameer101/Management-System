#include "user.h"

User::User()
{
}

User::User(const QString &mac){
    m_macAddr = mac;
}


QString User::macAddr() const{
    return m_macAddr;
}

void User::setMacAddr(QString &mac){
    if(mac == m_macAddr)
        return;
    m_macAddr = mac;
//    emit macAddrChanged();
}
