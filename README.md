# Mouse-Jiggler-Mover-for-Work-PC
This script requires no admin rights, and keeps your status on Teams active
This script just moves your mouse curser 1 pixel to the right every 30 seconds and then 1 pixel to the left 30 seconds after that. 


1. Create a new Note pad (right click desktop, then NEW, then choose notepad or Text Document)

2. Copy and Paste the Script below inside a Notepad or text document and name it MouseMover.ps1 (or download MouseMover.ps1)

3. Place the script in "My Documents"

4. Open Windows PowerShell (search PowerShell in task bar)

5. Go to My Documents directory by typing this command     cd C:\Users\********\Documents 
     Replace ***** with your username, or open file explorer and right click my documents and chose "Copy as Path" 
             If you Copied as Path you will need to delete the "        "   before entering the directory 

6. After youve navigated to My documents in PowerShell type this command to start the script     ./MouseMover.ps1

Must keep PowerShell open (minimized is ok) but once you close PowerShell the script will stop running
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# MoveMouse.ps1
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class MouseMover {
    [DllImport("user32.dll")]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, UIntPtr dwExtraInfo);

    private const int MOUSEEVENTF_MOVE = 0x0001;

    public static void MoveMouse(int x, int y) {
        mouse_event(MOUSEEVENTF_MOVE, (uint)x, (uint)y, 0, UIntPtr.Zero);
    }
}
"@

while ($true) {
    # Move mouse 1 pixel to the right
    [MouseMover]::MoveMouse(1, 0)
    Start-Sleep -Seconds 30
    # Move mouse back 1 pixel to the left
    [MouseMover]::MoveMouse(-1, 0)
    Start-Sleep -Seconds 30
}
