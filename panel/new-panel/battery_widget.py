#!/usr/bin/python

from number_widget import NumberWidget
from panel_help import *
import os
import re

class BatteryWidget(NumberWidget):

  def __init__(self):
    super(BatteryWidget, self).__init__('B')
    
    self.update_time = 30

    self.battery_command = "upower -i $(upower -e | grep 'BAT') |\
      grep -E 'state|time\ to|percentage'"

  def update_number(self):
    battery = self.get_battery_dump()
    
    self.state = battery[0][-1]
    self.number = int(battery[2][-1][:-1])
 
  """
  def update_char(self):
    if self.number > 66:
      self.character = '\uf004\uf004\uf004'
    elif self.number > 33:
      self.character = '\uf004\uf004\uf08a'
    elif self.number > 10:
      self.character = '\uf004\uf08a\uf08a'
    else:
      self.character = '\uf08a\uf08a\uf08a'
  """

  def get_battery_dump(self):
    f = os.popen(self.battery_command)
    return [re.compile("\s+").split(line) for line in f.read().split('\n')]
