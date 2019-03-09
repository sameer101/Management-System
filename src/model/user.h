#pragma once
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

    User(const QString &mac);

    /**
     * \brief macAddress get mac address of user.
     * \return mac address value.
     */
    QString macAddr() const;

    /**
     * \brief setMacAddr .
     * \param mac Mac address value.
     */
    void setMacAddr(QString &mac);
};

