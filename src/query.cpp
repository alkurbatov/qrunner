#include <QCoreApplication>
#include <QDesktopWidget>
#include <QDir>
#include <QFileInfo>
#include <QProcess>
#include <QStringList>
#include "query.h"

Query::Query()
{
    this->resize(600, 40);

    QRect g = this->frameGeometry();
    g.moveCenter(QDesktopWidget().availableGeometry().center());
    this->move(g.topLeft());

    QObject::connect(this, SIGNAL(returnPressed()), this, SLOT(run()));
}

void Query::run()
{
    if (this->text().isEmpty())
        return;

    QStringList args = this->text().split(" ");
    QFileInfo f(QDir::homePath() + "/.qrunner/scripts",
                args[0] + ".applescript");

    if (!f.isFile())
        return;

    args[0] = f.filePath();

    QProcess p(this);
    p.start("osascript", args);
    p.waitForFinished();
    p.close();

    QCoreApplication::quit();
}
