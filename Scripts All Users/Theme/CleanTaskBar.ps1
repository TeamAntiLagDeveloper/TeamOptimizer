$items = @()
(New-Object -ComObject Shell.Application).NameSpace('shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}').Items() | ForEach-Object {
    $items += $_.Name
}

foreach ($item in $items) {
    Write-Output "Removendo item: $item"
    (New-Object -ComObject Shell.Application).NameSpace('shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}').Delete($item)
}
$keepItems = @('Rede', 'Volume', 'Idioma', 'Data e hora', 'Explorador de Arquivos')
foreach ($item in $keepItems) {
    $targetItem = (New-Object -ComObject Shell.Application).NameSpace('shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}').ParseName($item)
    $targetItem.InvokeVerb('Fixar na barra de tarefas')
}
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'AllowCortana' -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds' -Name 'ShellFeedsTaskbarViewMode' -Value 1
Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Meet.lnk" -Force -ErrorAction SilentlyContinue
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'EnableNotificationCenter' -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowTaskViewButton' -Value 0
