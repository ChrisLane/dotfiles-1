#!/usr/bin/python

from test_widget import TestWidget
from workspace_widget import WorkspaceWidget
from panel_help import *

colors = [
  "#FF0000",
  "#00FF00",
  "#0000FF"
]

separator = " | "

left_items = [
  WorkspaceWidget(),
]

middle_items = []

right_items = []

def main():
  start_widgets()

  while 1:
    print_full_text()

def print_full_text():
  full_text = get_full_text()
  print(full_text)

def start_widgets():
  for w in all_widgets():
    w.start_thread()

def get_full_text():
  left_text = get_items_text(left_items)
  middle_text = get_items_text(middle_items)
  right_text = get_items_text(right_items)

  full_text = "%%{l}%s%%{c}%s%%{r}%s" % (left_text, middle_text, right_text)

  return full_text
    
def get_items_text(items):
  all_text = [i.text for i in items]
  colored_text = [set_color(all_text[i], colors[i % len(colors)]) for i in range(len(all_text))]
  full_text = separator.join(colored_text)

  return full_text

def all_widgets():
  return left_items + middle_items + right_items
    
if __name__ == "__main__":
  main()
