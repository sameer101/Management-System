#include "SqliteDB.h"


SqliteDB::SqliteDB()
{
    m_database = QSqlDatabase::addDatabase("QSQLITE", "OneNameOrOther");
}

SqliteDB::~SqliteDB()
{
    //;
}

bool SqliteDB::connect(const std::string &db){
    bool status = false;
    m_database.setDatabaseName(QString::fromStdString(db));
    if (!m_database.open())
    {
        std::cout << "SQL ERROR 1 " << QSqlError().text().toStdString() << std::endl;
    }
    else {
        status = true;
    }
    return status;
}

bool SqliteDB::getData(QSqlQuery &query, QMap<QString,QVariant> &queryData,const QString &table){
    bool status = false;
    QString queryText = "SELECT * from " + table + " WHERE  ";
    QStringList filters;
    query = QSqlQuery(m_database);
    for(auto &key : queryData.keys()){
        filters << key + " = '" + queryData.value(key).toString() + "'";
    }

    queryText +=  filters.join("AND");

    query.prepare(queryText);
    if(!query.exec()){
        std::cout << "SQL ERROR 2  " << QSqlError().text().toStdString() << std::endl;
    }
    else{
        status = true;
    }

    return status;
}

bool SqliteDB::insertData(QMap<QString,QVariant> &queryData,const QString &table){
    bool status = false;
    QSqlQuery query(m_database);
    QStringList columns;
    QStringList values;
    for(auto &key: queryData.keys()){
        columns << key;
        values << queryData.value(key).toString();
    }

    QString queryText = "INSERT INTO " + table + "(" +  columns.join(",") + ") VALUES (" + values.join(",") + ")";
    if(!query.exec(queryText)){
        std::cout << "SQL ERROR 3  " << QSqlError().text().toStdString() << std::endl;
    }
    else{
        status = true;
    }

    return status;
}
