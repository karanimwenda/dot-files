import os
import datetime

# Get day tasks
today_date = datetime.datetime.now()
# today_date = datetime.datetime(2021, 11, 22)
tomorrow_date = today_date + datetime.timedelta(days=1)
today = today_date.strftime("%m/%d/%Y")
tomorrow = tomorrow_date.strftime("%m/%d/%Y")
print(today, tomorrow)

stream = os.popen(
    'gcalcli agenda "{}" "{}" --details end --details calendar --tsv'.format(
        today, tomorrow)
)
output = stream.read()

unprocessed_tasks = output.split("\n")
processed_tasks = []

for task in unprocessed_tasks:
    if task == '':
        continue
    task = task.split("\t")
    task_dict = {
        "start_date": task[0],
        "start_time": task[1],
        "end_date": task[2],
        "end_time": task[3],
        "details": task[4],
        "calendar_source": task[5],
    }
    processed_tasks.append(task_dict)

task_code = ""

with open("../../configs/eww/widgets/cal-event-template.yuck") as file:
    yucky_event_template = file.read()

with open("../../configs/eww/widgets/calendar-template.yuck") as file:
    yucky_cal_template = file.read()

# Create yucky code
for task in processed_tasks:
    eww_task = yucky_event_template
    eww_task = eww_task.replace("{{ details }}", task["details"])
    eww_task = eww_task.replace(
        "{{ time }}", "{} - {}".format(task["start_time"], task["end_time"])
    )
    # print(eww_task)
    task_code = task_code + "\n" + eww_task

yucky_cal_widget = yucky_cal_template.replace("{{ events }}", task_code)

with open("../../configs/eww/widgets/calendar-widget.yuck", 'w') as file:
    file.write(yucky_cal_widget)

os.system("eww open calendar_side")

print(yucky_cal_widget)
# print(task_code)
