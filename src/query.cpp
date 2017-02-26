/*
 This file is a part of QRunner project

 Copyright (C) 2017, Alexander Kurbatov <sir.alkurbatov@yandex.ru>

 QRunner is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 QRunner is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

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
