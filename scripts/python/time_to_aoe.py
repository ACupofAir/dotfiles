from datetime import datetime, timezone, timedelta
import time


def time_to_aoe(org_time):
    """convert the time to AOE time

    Args:
        org_time (time): the time to be converted

    Returns:
        datatime: the converted aoe time
    """
    tz = timezone(timedelta(hours=-12), name="AOE")
    dt_aoe = datetime.fromtimestamp(org_time, tz)
    return dt_aoe


def display_aoe_time():
    """display the current time in AOE in dead loop"""
    print("============AOE Time============")
    while True:
        timeNow = time.time()
        print(time_to_aoe(timeNow))
        time.sleep(1)


if __name__ == "__main__":
    print("============AOE Time============")
    while True:
        timeNow = time.time()
        print(time_to_aoe(timeNow))
        time.sleep(1)
