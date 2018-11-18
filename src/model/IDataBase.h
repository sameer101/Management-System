
#pragma once
#pragma warning (push, 0)
#include <QtSql>
#include <QSqlDatabase>
#pragma warning (pop)
#include <QMap>
#include <QList>

namespace model{
    class IDataBase;
}

class IDataBase
{
public:
    /**
     * @brief ~IDataBase
     */
    virtual ~IDataBase() = 0;
    /**
     * @brief connect
     * @param db
     * @return
     */
    virtual bool connect(const std::string &db) = 0;
    /**
     * @brief getData
     * @param query
     * @param queryData
     * @param table
     * @return
     */
    virtual bool getData(QSqlQuery &query, QMap<QString,QVariant> &queryData,const QString &table) = 0;
    /**
     * @brief insertData
     * @param queryData
     * @return
     */
    virtual bool insertData(QMap<QString,QVariant> &queryData, const QString &table) = 0;
};
