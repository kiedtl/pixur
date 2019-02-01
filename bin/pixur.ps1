# Usage: pixur [file(s)] [options]
# Summary: A PowerShell script to print full-color pictures in the terminal.
# Help: Print full-color RGB pictures in the terminal. Supports PNG, JPEG, and BMP formats.
#
# Options:
#   -c, -columns  [number]      Print every [number] columns to fit image 
#                                     in the terminal. The lower the number, the higher
#                                     the resolution. (default: 4) 
#   -r, -rows     [number]      Print every [number] rows to fit image 
#                                     in the terminal. The lower the number, the higher
#                                     the resolution. (default: 2)
#   -f, -full                   Print the image full size. 
#   -k, -char                   The pixel char. (default: space)
#   -i, -invert                 Swap background and foreground colors.
# 
#   -h, -help                   Print this help message.
#

param (
	[parameter(mandatory=$true,valuefrompipeline=$true)]
	$path,
	[alias('c')]
	$columns = 4,
	[alias('r')]
	$rows = 2,
	[alias('k')]
	$char = " ",
	[alias('f')]
	[switch]$full,
	[alias('i')]
	[switch]$invert,
	[alias('h')]
	[switch]$help
)

############################################################ 

function usage($text) {
    $text | Select-String '(?m)^# Usage: ([^\n]*)$' | ForEach-Object { "Usage: " + $_.matches[0].groups[1].value }
}

function summary($text) {
    $text | Select-String '(?m)^# Summary: ([^\n]*)$' | ForEach-Object { $_.matches[0].groups[1].value }
}

function help_msg($text) {
    $help_lines = $text | Select-String '(?ms)^# Help:(.(?!^[^#]))*' | ForEach-Object { $_.matches[0].value; }
    $help_lines -replace '(?ms)^#\s?(Help: )?', ''
}

#################################################################

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.drawing")

$meow = "$psscriptroot\..\lib\bin\meow.ps1"

if ($help) {
	try {
		$text = (Get-Content $MyInvocation.PSCommandPath -raw)
	} catch {
		$text = (Get-Content $PSCOMMANDPATH -raw) 
	}
	$helpmsg = usage $text 
	$helpmsg += "`n"
	$helpmsg += summary $text 
	$helpmsg += "`n"
	$helpmsg += help_msg $text 
	$helpmsg | & $meow
	break
}

#####################################################################

if ($char -eq " ") { $invert = $True}

$E = [char]27

$col = $host.UI.RawUI.BufferSize.Width.ToString() -or 80
$row = $host.UI.RawUI.BufferSize.Height.ToString() -or 24

$mrows = $rows
$mcols = $columns
	
if ($invert) {
	foreach ($item in $path) {			
		$img = [System.Drawing.Bitmap]::FromFile((Get-Item $Item).fullname)
	
		#if ($img.Width -gt $col -or ($img.Height / 2) -gt $row) {
		#	$mrows = ((($img.Height) / $row)) % 6
		#	$mcols = ($mrows / 2) % 6
		#}
	
		$i = 1
		$n = 1
		
		if (!$full) {
			foreach ($y in (1..($img.Height-1))) {
				if (($i % $mrows) -eq ($mrows - 1)) {
					foreach ($x in (1..($img.Width-1))) {
						if (($n % $mcols) -eq ($mcols - 1)) {
							$pixel = $img.GetPixel($x, $y)
							$r = $pixel.r
							$g = $pixel.g
							$b = $pixel.b
							Write-Host "$E[48;2;${r};${g};${b}m$char$E[38;2;150;150;150m" -NoNewline 
						}
						$n++
					}
					""
				}
				$i++
			}
	
		} else {
			foreach ($y in (1..($img.Height-1))) {
				foreach ($x in (1..($img.Width-1))) {
						$pixel = $img.GetPixel($x, $y)
						$r = $pixel.r
						$g = $pixel.g
						$b = $pixel.b
						Write-Host "$E[48;2;${r};${g};${b}m$char$E[38;2;150;150;150m" -NoNewline 
				}
				""
			}
	
		}
	}		
} else {
	foreach ($item in $path) {			
		$img = [System.Drawing.Bitmap]::FromFile((Get-Item $Item).fullname)
	
		#if ($img.Width -gt $col -or ($img.Height / 2) -gt $row) {
		#	$mrows = ((($img.Height) / $row)) % 6
		#	$mcols = ($mrows / 2) % 6
		#}
	
		$i = 1
		$n = 1
		
		if (!$full) {
			foreach ($y in (1..($img.Height-1))) {
				if (($i % $mrows) -eq ($mrows - 1)) {
					foreach ($x in (1..($img.Width-1))) {
						if (($n % $mcols) -eq ($mcols - 1)) {
							$pixel = $img.GetPixel($x, $y)
							$r = $pixel.r
							$g = $pixel.g
							$b = $pixel.b
							Write-Host "$E[38;2;${r};${g};${b}m$char$E[38;2;150;150;150m" -NoNewline 
						}
						$n++
					}
					""
				}
				$i++
			}
	
		} else {
			foreach ($y in (1..($img.Height-1))) {
				foreach ($x in (1..($img.Width-1))) {
						$pixel = $img.GetPixel($x, $y)
						$r = $pixel.r
						$g = $pixel.g
						$b = $pixel.b
						Write-Host "$E[38;2;${r};${g};${b}m$char$E[38;2;150;150;150m" -NoNewline 
				}
				""
			}
	
		}
	}		
}