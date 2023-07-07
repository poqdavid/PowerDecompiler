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
 
function CFR {
    param(
        [Parameter(Position = 0, Mandatory = $false)][string]$prof,
        [Parameter(Position = 1, Mandatory = $false)][string]$opt
    )

    Write-Host $file
    
    if ($prof.ToLower().Contains("ciffalse")) {
        Write-Host "Running > " -NoNewline -ForegroundColor Red
        Write-Host "java.exe -jar $($cfr.bin) $file --caseinsensitivefs true --outputdir $($cfr.out.ciffalse)" -ForegroundColor Yellow

        [System.IO.Directory]::CreateDirectory("$($cfr.out.ciffalse)")

        if ([string]::IsNullOrWhitespace($opt)) {
            & $javaexe -jar $cfr.bin $file --caseinsensitivefs false --outputdir $cfr.out.ciffalse
        }
        else {
            & $javaexe -jar $cfr.bin $file --caseinsensitivefs false $opt --outputdir $cfr.out.ciffalse
            Write-Host "Options: $($opt)" -ForegroundColor Yellow
        }

        Write-Host ""
    
        Write-Host "Out > " -NoNewline -ForegroundColor Red
        Write-Host $cfr.out.ciffalse -ForegroundColor Yellow
            
        Write-Host ""
    }
    else {
        Write-Host "Running > " -NoNewline -ForegroundColor Red
        Write-Host "java.exe -jar $($cfr.bin) $file --outputdir $($cfr.out.default)" -ForegroundColor Yellow

        [System.IO.Directory]::CreateDirectory("$($cfr.out.default)")

        if ([string]::IsNullOrWhitespace($opt)) {
            & $javaexe -jar $cfr.bin $file --outputdir $cfr.out.default
        }
        else {
            & $javaexe -jar $cfr.bin $file $opt --outputdir $cfr.out.default
            Write-Host "Options: $($opt)" -ForegroundColor Yellow
        }

        Write-Host ""
    
        Write-Host "Out > " -NoNewline -ForegroundColor Red
        Write-Host $cfr.out.default -ForegroundColor Yellow
    
        Write-Host ""
    } 

}