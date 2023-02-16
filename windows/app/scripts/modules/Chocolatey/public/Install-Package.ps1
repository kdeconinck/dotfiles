# ======================================================================================================================
# == LICENSE:       Copyright (c) 2023 Kevin De Coninck
# ==
# ==                Permission is hereby granted, free of charge, to any person
# ==                obtaining a copy of this software and associated documentation
# ==                files (the "Software"), to deal in the Software without
# ==                restriction, including without limitation the rights to use,
# ==                copy, modify, merge, publish, distribute, sublicense, and/or sell
# ==                copies of the Software, and to permit persons to whom the
# ==                Software is furnished to do so, subject to the following
# ==                conditions:
# ==
# ==                The above copyright notice and this permission notice shall be
# ==                included in all copies or substantial portions of the Software.
# ==
# ==                THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# ==                EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# ==                OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# ==                NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# ==                HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# ==                WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# ==                FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# ==                OTHER DEALINGS IN THE SOFTWARE.
# ======================================================================================================================

<#
    .SYNOPSIS
        Install a single package using Chocolatey.

    .DESCRIPTION
        Install a package by it's name using Chocolatey.

    .PARAMETER PackageName
        The name of the package to install.
#>
function Install-Chocolatey-Package {
    param(
        [Parameter(Mandatory = $true)]
        [String]
        $PackageName
    )

    # Import the module to ensure that the environment can be refreshed after the package is installed.
    Import-Module "$(Convert-Path "$((Get-Command choco).Path)\..\..")\helpers\chocolateyProfile.psm1"

    # Install the package.
    choco install $PackageName --confirm

    # Refresh the environment.
    refreshenv
}
