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

function FF {
    param(
        [Parameter(Position = 0, Mandatory = $false)][string]$prof,
        [Parameter(Position = 1, Mandatory = $false)][string]$opt
    )

    Write-Host $file

    if ($prof.ToLower().Contains("profile1")) {
        Write-Host "Running > " -NoNewline -ForegroundColor Red
        Write-Host "java.exe -jar $($ff.bin) -nns=1 $file $($ff.out.p1)" -ForegroundColor Yellow
        
        [System.IO.Directory]::CreateDirectory("$($ff.out.p1)")

        if ([string]::IsNullOrWhitespace($opt)) {
            & $javaexe -jar $ff.bin -nns=1 $file $ff.out.p1
        }
        else {
            & $javaexe -jar $ff.bin -nns=1 $opt $file $ff.out.p1
            Write-Host "Options: $($opt)" -ForegroundColor Yellow
        }
    
        Write-Host ""
    
        Write-Host "Out > " -NoNewline -ForegroundColor Red
        Write-Host $ff.out.p1 -ForegroundColor Yellow
            
        Write-Host ""
    }
    else {
        Write-Host "Running > " -NoNewline -ForegroundColor Red
        Write-Host "java.exe -jar $($ff.bin) $file $($ff.out.default)" -ForegroundColor Yellow

        [System.IO.Directory]::CreateDirectory("$($ff.out.default)")

        if ([string]::IsNullOrWhitespace($opt)) {
            & $javaexe -jar $ff.bin $file $ff.out.default
        }
        else {
            & $javaexe -jar $ff.bin $opt $file $ff.out.default
            Write-Host "Options: $($opt)" -ForegroundColor Yellow
        }

        Write-Host ""
    
        Write-Host "Out > " -NoNewline -ForegroundColor Red
        Write-Host $ff.out.default -ForegroundColor Yellow
    
        Write-Host ""
    } 

}