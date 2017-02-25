#ifndef QUERY_H
#define QUERY_H

#include <QLineEdit>

class Query: public QLineEdit
{
    Q_OBJECT

public:
    Query();

private slots:
    void run();
};

#endif // QUERY_H
