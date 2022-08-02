import random
import sys
import time
from threading import Thread

from typing import List

from pathlib import Path

from PySide6.QtCore import QTimer, QObject, Signal, Slot
from PySide6.QtGui import QGuiApplication, QIcon
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtQuickControls2 import QQuickStyle

from time import strftime, localtime

QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1

BASE_PATH = Path(__file__).parent
IMAGES_PATH = BASE_PATH / 'images'


class Backend(QObject):
    updated = Signal(str, arguments=['time'])
    targetAngle = Signal(float, arguments=['angle'])
    currentAngle = Signal(float, arguments=['angle'])

    def __init__(self):
        super().__init__()

        # Define timer.
        self.timer = QTimer()
        self.timer.setInterval(1000)  # msecs 1000 = 1 sec
        self.timer.timeout.connect(self.update_time)
        self.timer.start()

    def update_time(self):
        # Pass the current time to QML.
        curr_time = strftime("%H:%M:%S", localtime())
        self.updated.emit(curr_time)

    def move_needle(self, signal: Signal, angle: float = None):
        angle = angle if angle else round(random.uniform(0, 359), 2)
        signal.emit(angle)


def test_func1(signal: Signal, list_in: List):
    for idx, angle in enumerate(list_in):
        backend.move_needle(signal=signal, angle=angle)
        # print(f"t1: {idx}")
        time.sleep(1)


def test_func2(signal: Signal, list_in: List):
    for idx, angle in enumerate(list_in):
        backend.move_needle(signal=signal, angle=angle)
        # print(f"t2: {idx}")
        time.sleep(1)


@QmlElement
class Bridge(QObject):
    @Slot(str, result=bool)
    def takeMeasurement(self, s):
        print(s)
        # turn off heaters
        # take survey
        # save to CSV
        # turn on heaters
        return True


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    app.setWindowIcon(QIcon(str(IMAGES_PATH / "cap.png")))

    QQuickStyle.setStyle("Material")

    engine = QQmlApplicationEngine()
    engine.quit.connect(app.quit)
    engine.load(BASE_PATH / 'main.qml')

    # Define our backend object, which we pass to QML.
    backend = Backend()

    engine.rootObjects()[0].setProperty('backend', backend)

    # Initial call to trigger first update. Must be after the setProperty to connect signals.
    backend.update_time()

    random_list1 = [random.randrange(0, 360, 45) for x in range(1000)]
    print(random_list1)
    t1 = Thread(target=test_func1, args=(backend.targetAngle, random_list1))

    random_list2 = [random.randrange(0, 360) for x in range(1000)]
    print(random_list2)
    t2 = Thread(target=test_func2, args=(backend.currentAngle, random_list2))

    t1.start()
    t2.start()

    sys.exit(app.exec())

    t1.join()
    t2.join()
