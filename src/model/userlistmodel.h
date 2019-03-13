#pragma once

#include <QAbstractItemModel>
#include "user.h"

class UserListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    // User model roles
    enum roles{
      macRole = Qt::UserRole + 1
    };

    UserListModel(QObject *parent = nullptr);

	QModelIndex getIndex(int r, int c, void *p);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    void addUser(const User &user);
    
    QHash<int, QByteArray> roleNames() const override;

private:
    QList<User> m_users;

protected:

};
