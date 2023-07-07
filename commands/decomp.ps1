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

param(
    [Parameter(Position = 0, Mandatory = $true)][ValidateSet('Java')][ValidateNotNullOrEmpty()][string]$type,
    [Parameter(Position = 1, Mandatory = $true)][ValidateSet('CFR', 'FF')][ValidateNotNullOrEmpty()][string]$mode,
    [Parameter(Position = 2, Mandatory = $true)][ValidateNotNullOrEmpty()][string]$file,
    [Parameter(Position = 3, Mandatory = $false)][string]$prof,
    [Parameter(Position = 4, Mandatory = $false)][string]$opt
)

. $PSScriptRoot\libs\variables.ps1
. $PSScriptRoot\libs\functions.ps1

switch -wildcard ($type) {
    "Java" {
        switch -wildcard ($mode) {
            "CFR" {

                if ([string]::IsNullOrWhitespace($prof)) {
                    CFR "ciffalse" $opt
                    CFR " " $opt
                    OpenFolders -folders $cfr.out.default, $cfr.out.ciffalse
                }
                else {
        
                    if ($prof.ToLower().Contains("ciffalse")) {
                        CFR "ciffalse" $opt
                        OpenFolders $cfr.out.ciffalse
                    }
                    else {
                        CFR " " $opt
                        OpenFolders $cfr.out.default
                    }
                }
            }
            "FF" {
                
                if ([string]::IsNullOrWhitespace($prof)) {
                    FF "profile1" $opt
                    FF " " $opt
                    OpenFolders -folders $ff.out.default, $ff.out.p1
                }
                else {
        
                    if ($prof.ToLower().Contains("profile1")) {
                        FF "profile1" $opt
                        OpenFolders $ff.out.p1
                    }
                    else {
                        FF " " $opt
                        OpenFolders $ff.out.default
                    }
                }
            }
            default { Write-Host "Invalid/Unsupported mode" }
        }
    }
    default { Write-Host "Invalid/Unsupported type" }
}