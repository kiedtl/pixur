
![](https://raw.githubusercontent.com/lptstr/lptstr-images/master/screenshots/projects/pixur/propoganda.JPG)
# Pixur
The right way to print pictures in the terminal with PowerShell

## Usage
Clone the repository into your project directory, then call the `bin/pixure.ps1` file:
```powershell
$pixur = "$psscriptroot\..\lib\pixur\bin\pixur.ps1"
"path/to/picture.png" | & $pixur -r 4 -c 2
```

## Terminal support
Because Pixur uses ANSI escape codes, not every terminal fully supports Pixur (yet). Indeed, as of September 2018, only the famous Windows Console, once notorious for poor color and Unicode character support fully supports Pixur.

|Terminal|Full Support?|
|--------|---------|
|Windows Console|✔|
|Alacritty|❌|
|Cmder|❌|
|ConEmu|❌|
|Hyper|❌|
|Terminus|❌|

### Windows Console
As of 2018, the glorious Windows Console seems to support full RGB color:
![](https://raw.githubusercontent.com/lptstr/lptstr-images/master/screenshots/projects/pixur/conhost_win10.JPG)

### Alacritty
![](https://raw.githubusercontent.com/lptstr/lptstr-images/master/screenshots/projects/pixur/alacritty.JPG)

### Cmder
![](https://raw.githubusercontent.com/lptstr/lptstr-images/master/screenshots/projects/pixur/cmder.JPG)

### ConEmu
![](https://raw.githubusercontent.com/lptstr/lptstr-images/master/screenshots/projects/pixur/conemu.JPG)

### Hyper
![](https://raw.githubusercontent.com/lptstr/lptstr-images/master/screenshots/projects/pixur/hyper.JPG)

### Terminus
![](https://raw.githubusercontent.com/lptstr/lptstr-images/master/screenshots/projects/pixur/terminus.JPG)
