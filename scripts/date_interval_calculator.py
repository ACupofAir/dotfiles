# %%
from datetime import datetime


def date_interval(date_str, date_end):
    """
    date_str: str, eg: "2000-02-04"
    date_end: str, eg: "2001-05-27"
    return: int
    example: print(date_interval("2000-01-01", "2000-01-02"))
    out: 1
    """
    # change the date string to datetime object
    date_str = datetime.strptime(date_str, "%Y-%m-%d")
    date_end = datetime.strptime(date_end, "%Y-%m-%d")

    # Calculate date interval
    delta = date_end - date_str
    days = delta.days

    return days


if __name__ == "__main__":
    date_str1 = "2016-04-01"
    date_str2 = "2023-08-30"
    cur_datetime = datetime.now()
    cur_date = cur_datetime.strftime("%Y-%m-%d")

    start_date = "2016-04-01"
    print(f"Today is { cur_date }")
    days_interval = date_interval(start_date, cur_date)
    print(f'It has been {days_interval} days since {start_date}')
