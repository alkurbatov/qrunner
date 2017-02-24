import os
import sys
import subprocess

from PyQt5.QtCore import QCoreApplication
from PyQt5.QtWidgets import QApplication, QDesktopWidget, QWidget, QLineEdit


class App(QApplication):
    """Main application class."""

    def __init__(self, argv):
        super().__init__(argv)

        self.query = QLineEdit()

        self.query.resize(600, 40)

        geometry = self.query.frameGeometry()
        geometry.moveCenter(QDesktopWidget().availableGeometry().center())
        self.query.move(geometry.topLeft())

        self.query.returnPressed.connect(self.run)

        self.query.show()

    def run(self):
        """Run a script from the '~/.qrunner/scripts' directory."""

        args = self.query.text().split()
        if not args:
            return

        script = os.path.join(os.path.expanduser('~'), '.qrunner',
                              'scripts', args[0] + '.applescript')

        if not os.path.isfile(script):
            return

        cmd = ['osascript', script]
        cmd.extend(args[1:])

        subprocess.call(cmd)
        QCoreApplication.instance().quit()


if __name__ == '__main__':
    sys.exit(App(sys.argv).exec_())

