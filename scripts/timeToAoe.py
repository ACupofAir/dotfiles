from datetime import datetime, timezone, timedelta
import time

def timeToAoe(time):
    tz = timezone(timedelta(hours=-12), name='AOE')
    dt_aoe = datetime.fromtimestamp(time, tz)
    return dt_aoe


# print("AOE Time: ", timeToAoe(int(sys.argv[1])))
while(True):
    timeNow = time.time()
    print(timeToAoe(timeNow))
    time.sleep(1)
