# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import absolute_import, division, print_function

# You can import any python module as needed.
import os
import subprocess

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command


# Any class that is a subclass of "Command" will be integrated into ranger as a
# command.  Try typing ":my_edit<ENTER>" in ranger!
class my_edit(Command):
    # The so-called doc-string of the class will be visible in the built-in
    # help that is accessible by typing "?c" inside ranger.
    """:my_edit <filename>

    A sample command for demonstration purposes that opens a file in an editor.
    """

    # The execute method is called when you run this command in ranger.
    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filename = self.rest(1)
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filename = self.fm.thisfile.path

        # This is a generic function to print text in ranger.
        self.fm.notify("Let's edit the file " + target_filename + "!")

        # Using bad=True in fm.notify allows you to print error messages:
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        # This executes a function from ranger.core.acitons, a module with a
        # variety of subroutines that can help you construct commands.
        # Check out the source, or run "pydoc ranger.core.actions" for a list.
        self.fm.edit_file(target_filename)

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
    def tab(self, tabnum):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()


class fzf_find_select(Command):
    def execute(self):
        # Define the command to list files using fdfind
        fdfind_command = "fdfind --type f"

        # Define the fzf command with bat preview
        fzf_command = "fzf --border --margin=0,1 --preview 'bat -f -P --plain {}'"

        # Combine the commands
        full_command = f"{fdfind_command} | {fzf_command}"

        # Execute the command and capture the output
        fzf = self.fm.execute_command(full_command, stdout=subprocess.PIPE, shell=True)
        stdout, _ = fzf.communicate()

        if fzf.returncode == 0:
            # Get the selected file path
            selected_file = stdout.decode("utf-8").strip()
            selected_file_path = os.path.abspath(selected_file)

            if os.path.exists(selected_file_path):
                # If it's a directory, change to it
                if os.path.isdir(selected_file_path):
                    self.fm.cd(selected_file_path)
                else:
                    # If it's a file, select it
                    self.fm.select_file(selected_file_path)
