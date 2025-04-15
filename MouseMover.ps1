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
