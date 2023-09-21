import sublime
import sublime_plugin
import os
import subprocess

class DprintFmtCommand(sublime_plugin.TextCommand):

  def description(self):
    return "Formats source code using dprint."

  def run(self, edit):
    try:
      file_path = self.view.file_name()
      if file_path is not None:
        extension = os.path.splitext(file_path)[1].replace(".", "")
        dir_path = os.path.dirname(file_path)

        file_region = sublime.Region(0, self.view.size())
        file_text = self.view.substr(file_region)
        formatted_text = dprint_exec.format_text(dir_path, file_path, file_text)

        if file_text != formatted_text:
          self.view.replace(edit, file_region, formatted_text)
          print("dprint: Formatted " + file_path)

    except Exception as err:
      print("dprint: " + str(err))

class DprintExec:
  def format_text(self, dir_path, file_path, file_text):
    from subprocess import Popen, PIPE

    p = Popen(["dprint", "fmt", "--stdin", os.path.basename(file_path)],
      stdin=PIPE, stdout=PIPE, stderr=PIPE, cwd=dir_path)
    stdout, stderr = p.communicate(bytes(file_text, "utf8"))

    if p.returncode == 0:
      return stdout.decode("utf8")
    else:
      raise Exception("Error formatting: " + stderr.decode("utf8"))

dprint_exec = DprintExec()
