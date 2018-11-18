#pragma once
#pragma warning (push,0)
#include <QSqlTableModel>
#include <QSqlQueryModel>
#pragma warning (pop)

#include <QStringList>
#include <string>
#include <iostream>
#include "IDataBase.h"

namespace model{
    class SqliteDB;
}

class SqliteDB: public IDataBase
{
public:
    SqliteDB();
    ~SqliteDB();
    bool connect(const std::string &db);
    /**
     * @brief getData executes sql select query.
     * @param query [out] QSqlQuery query object after executing the query.
     * @param queryFilters [in] map of query filters (column-name, filter-value).
     * @param table [in] table name.
     * @return
     */
    bool getData(QSqlQuery &query, QMap<QString,QVariant> &queryData,const QString &table);

    bool insertData(QMap<QString,QVariant> &queryData, const QString &table);
private:
    QSqlDatabase m_database;
};

