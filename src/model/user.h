#ifndef USER_H
#define USER_H

#include <QObject>
#include <QString>

class User
{
private:
    /// Customer mac address
    QString m_macAddr;
    /// Customer name;
    QString m_firstName;
    /// Customer lastName;
    QString m_lastName;
//    /// Customer lastName;
//    QList<Order> m_orders;

public:
     User();



};

#endif // USER_H
