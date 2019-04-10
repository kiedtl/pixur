
![](https://raw.githubusercontent.com/lptstr/lptstr-images/master/screenshots/projects/pixur/propoganda.JPG)
# Pixur
The right way to print pictures in the terminal with PowerShell

## Usage
**NOTE**: Make sure you have ImageMagick installed.

Clone the repository into your project directory, then call the `src/pixure.ps1` file:
```powershell
$ "path/to/picture.png" | pixur
```

You can redirect output to a file:

```powershell
$ "path/to/picture.png" | pixur > image.pxl
```
... and view the saved image with `cat`:

```powershell
$ cat image.pxl
```
## Terminal support
Because Pixur uses ANSI escape codes, not every terminal fully supports Pixur (yet). Indeed, as of September 2018, only the famous Windows Console, once notorious for poor color and Unicode character support fully supports Pixur.

|Terminal|Full Support?|
|--------|---------|
|Windows Console|  ✔ Yes! |
|Alacritty|  ❌ no |
|Cmder|  ❌ no |
|ConEmu|  ❌ no |
|Hyper|  ❌ no |
|Terminus|  ❌ no |

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
