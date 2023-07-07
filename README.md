## PowerDecompiler

A PowerShell script to help with running decompilers

### Licence

PowerDecompiler is licenced under the [GPL-3.0](https://www.gnu.org/licenses/).

### Running from command line

`decomp [-type <type>] [-mode <mode>] [-file <file>] <profile> "<options>"`

##### Examples:

```
decomp -type Java -mode FF -file .\binary.jar profile1 "-e=c:\Java\rt.jar -e=c:\Java\commons-io.jar"

decomp -type Java -mode FF -file .\binary.jar profile1

decomp -type Java -mode FF -file .\binary.jar
```

```
decomp -type Java -mode CFR -file .\binary.jar ciffalse "--extraclasspath c:\Java\rt.jar;c:\Java\commons-io.jar"

decomp -type Java -mode CFR -file .\binary.jar ciffalse

decomp -type Java -mode CFR -file .\binary.jar
```