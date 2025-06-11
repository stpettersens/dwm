import std.file;
import std.stdio;
import std.string;
import std.process;

void dmenu_poweroff_menu() {
    string menu = "printf 'exit\npoweroff\nreboot\ncancel'";
    menu ~= " | dmenu -i -l 4 -p 'Quit?'";
    auto returned = executeShell(menu);
    string command = strip(returned.output);
    if (command == "cancel") {
        // Cancel does nothing.
        return;
    }
    else if (command == "exit") {
       // Get process IDs for dwmblocks and dwm.
       auto processes = executeShell("pgrep dwm | xargs printf '%d,'");
       string[] pids = chop(strip(processes.output)).split(",");
       foreach (pid; pids) {
           // Kill each dwm related process.
           executeShell(format("kill %s", pid));
       }
       return;
    }

    // Poweroff and reboot runs with doas.
    executeShell(format("doas %s", command));
}

int main() {
    dmenu_poweroff_menu();
    return 0;
}
