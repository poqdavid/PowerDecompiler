<#
 *      This file is part of PowerDecompiler distribution (https://github.com/poqdavid/PowerDecompiler).
 *      Copyright (c) 2023 contributors
 *
 *      PowerDecompiler is free software: you can redistribute it and/or modify
 *      it under the terms of the GNU General Public License as published by
 *      the Free Software Foundation, either version 3 of the License, or
 *      (at your option) any later version.
 *
 *      PowerDecompiler is distributed in the hope that it will be useful,
 *      but WITHOUT ANY WARRANTY; without even the implied warranty of
 *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *      GNU General Public License for more details.
 *
 *      You should have received a copy of the GNU General Public License
 *      along with PowerDecompiler.  If not, see <https://www.gnu.org/licenses/>.
 #>
 
. $PSScriptRoot\variables.ps1
. $PSScriptRoot\cfr.ps1
. $PSScriptRoot\ff.ps1

function OpenFolders {
    param(
        [Parameter(Position = 0, Mandatory = $true)][string[]]$folders
    )

    $title = "Open output folder(s)"
    $message = "Do you want to open output folder(s)?"
    
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
        "Opens output folder(s)"
    
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
        "Doesn't open output folder(s)"
    
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    
    $result = $host.ui.PromptForChoice($title, $message, $options, 1)
    
    switch ($result) {
        0 {
            foreach ($folder in $folders) {
                Invoke-Item $folder
            }
        }
        1 { "You selected No." }
    }
    
}