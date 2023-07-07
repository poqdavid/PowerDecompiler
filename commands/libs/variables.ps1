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
 
##General
$file = $file -replace '.\\', ""
$fileoutdirname = $file -replace '.jar', ""

##Java
$javaexe = "$env:JAVA_HOME\bin\java.exe"

$RootDir = (get-item $PsScriptRoot ).parent.parent.FullName

##CFR
$cfr = [PSCustomObject]@{
    bin = "$($RootDir)\Java\cfr\cfr-0.152.jar"
    out = [PSCustomObject]@{
        default  = "$($RootDir)\Java\output\CFR\$fileoutdirname\"
        ciffalse = "$($RootDir)\Java\output\CFR\ciffalse_${fileoutdirname}\"
    }
}

#FF
$ff = [PSCustomObject]@{
    bin = "$($RootDir)\Java\fernflower\fernflower.jar"
    out = [PSCustomObject]@{
        default = "$($RootDir)\Java\output\FF\$fileoutdirname\"
        p1      = "$($RootDir)\Java\output\FF\p1_${fileoutdirname}\"
    }
}