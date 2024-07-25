$url = "https://cdn.discordapp.com/attachments/1227390294417346573/1265957854381215744/Wallpaper.png?ex=66a366a0&is=66a21520&hm=1aee0fcb26b44da9147f4c3a0afa1d885f8e359e45dff907841cd91ec77ec89b&"
$caminho = "C:\Windows\Wallpaper.png"
Invoke-WebRequest -Uri $url -OutFile $caminho
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name Wallpaper -Value $caminho
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name WallpaperStyle -Value 2
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name TileWallpaper -Value 0
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet=CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    public const int SPI_SETDESKWALLPAPER = 0x0014;
    public const int SPIF_UPDATEINIFILE = 0x0001;
    public const int SPIF_SENDCHANGE = 0x0002;
    public static void SetWallpaper(string path) {
        SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, path, SPIF_UPDATEINIFILE | SPIF_SENDCHANGE);
    }
}
"@
[Wallpaper]::SetWallpaper($caminho)