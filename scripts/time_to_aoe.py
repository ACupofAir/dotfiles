from datetime import datetime, timezone, timedelta
import time


def time_to_aoe(org_time):
    tz = timezone(timedelta(hours=-12), name="AOE")
    dt_aoe = datetime.fromtimestamp(org_time, tz)
    return dt_aoe


print("============AOE Time============")
# print("AOE Time: ", timeToAoe(int(sys.argv[1])))
while True:
    timeNow = time.time()
    print(time_to_aoe(timeNow))
    time.sleep(1)
