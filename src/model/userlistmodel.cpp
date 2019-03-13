#include "userlistmodel.h"

UserListModel::UserListModel(QObject *parent)
    : QAbstractListModel(parent)
{
		
}


void UserListModel::addUser(const User &user){
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_users << user;
    endInsertRows();
}

int UserListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
               return 0;
    return m_users.count();
}

QVariant UserListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
       return QVariant();
   if (index.row() < 0 || index.row() >= rowCount())
       return QVariant();
   const User &user = m_users[index.row()];
   if(role == macRole)
       return user.macAddr();
   return QVariant();
}


//QVariant UserListModel::headerData(int section, Qt::Orientation orientation, int role) const
//{
//    // FIXME: Implement me!
//}

//bool UserListModel::setHeaderData(int section, Qt::Orientation orientation, const QVariant &value, int role)
//{
//    if (value != headerData(section, orientation, role)) {
//        // FIXME: Implement me!
//        emit headerDataChanged(orientation, section, section);
//        return true;
//    }
//    return false;
//}


QModelIndex UserListModel::getIndex(int r, int c, void *p) {
	return this->createIndex(r, c, p);
}

//int UserListModel::columnCount(const QModelIndex &parent) const
//{
//    return 1;
//}

//bool UserListModel::hasChildren(const QModelIndex &parent) const
//{
//    // FIXME: Implement me!
//}

//bool UserListModel::canFetchMore(const QModelIndex &parent) const
//{
//    // FIXME: Implement me!
//    return false;
//}

//void UserListModel::fetchMore(const QModelIndex &parent)
//{
//    // FIXME: Implement me!
//}


//bool UserListModel::setData(const QModelIndex &index, const QVariant &value, int role)
//{
//    if (data(index, role) != value) {
//        // FIXME: Implement me!
//        emit dataChanged(index, index, QVector<int>() << role);
//        return true;
//    }
//    return false;
//}

//Qt::ItemFlags UserListModel::flags(const QModelIndex &index) const
//{
//    if (!index.isValid())
//        return Qt::NoItemFlags;

//    return Qt::ItemIsEditable; // FIXME: Implement me!
//}

QHash<int, QByteArray> UserListModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[macRole] = "mac";
    return roles;
}

