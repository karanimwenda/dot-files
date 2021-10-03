import os
import datetime


today_date = datetime.datetime.now()
tomorrow_date = today_date + datetime.timedelta(days=1)
today = today_date.strftime("%m/%d/%Y")
tomorrow = tomorrow_date.strftime("%m/%d/%Y")
print(today, tomorrow)

stream = os.popen(
    'gcalcli agenda "{}" "{}" --details end'.format(today, tomorrow)
)
output = stream.read()
print(output)
