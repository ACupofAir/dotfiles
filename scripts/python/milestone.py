from datetime import datetime

# 定义起始日期
start_date = datetime(2016, 4, 1)

# 获取当前日期
current_date = datetime.now()

# 计算天数间隔
days_difference = (current_date - start_date).days

print(f"从2013年9月1日到今天的间隔天数是：{days_difference}天")
