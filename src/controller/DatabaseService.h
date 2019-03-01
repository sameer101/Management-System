#pragma once
#include "../model/IDataBase.h"
#include "../model/sqlitedb.h"
#include <iostream>

namespace controller{
    template<class T>
    class DatabaseService;
}

namespace controller{
    template<class T>
    class DatabaseService
    {
    public:
        DatabaseService();
        ~DatabaseService();
        bool addProduct(QMap<QString,QVariant> &queryData, const QString &table);
        IDataBase* m_database;
    private:

    };


    template<class T>
    DatabaseService<T>::DatabaseService()
    {
        try {
            m_database =new T();
            m_database->connect("A");
        } catch (std::exception &e) {
            std::cout << e.what() << std::endl;
        }
    }


    template<class T>
    DatabaseService<T>::~DatabaseService(){
        //;
    }


    template<class T>
    bool DatabaseService<T>::addProduct(QMap<QString,QVariant> &queryData, const QString &table){
        m_database->insertData(queryData, table);
        return false;
    }
}

