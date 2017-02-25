#include <QApplication>
#include "query.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Query w;
    w.show();

    return a.exec();
}
