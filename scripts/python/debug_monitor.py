import pyautogui
import time
import random

# 获取屏幕的宽度和高度
screen_width, screen_height = pyautogui.size()

while True:
    # 生成随机的x和y坐标
    x = random.randint(0, screen_width - 1)
    y = random.randint(0, screen_height - 1)

    # 移动鼠标到随机位置
    pyautogui.moveTo(x, y)

    # 等待30秒
    time.sleep(10)
