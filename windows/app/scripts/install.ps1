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

# Import the modules that are required.
Import-Module $PSScriptRoot\modules\TLS\TLS.psm1 -DisableNameChecking -Force
Import-Module $PSScriptRoot\modules\Chocolatey\Chocolatey.psm1 -DisableNameChecking -Force
Import-Module $PSScriptRoot\modules\Fonts\Fonts.psm1 -DisableNameChecking -Force
Import-Module $PSScriptRoot\modules\VSCode\VSCode.psm1 -DisableNameChecking -Force

# Install or update Chocolatey.
Install-Or-Update-Chocolatey

# Install the required software using Chocolatey.
Install-Chocolatey-Package -PackageName git
Install-Chocolatey-Package -PackageName gh
Install-Chocolatey-Package -PackageName vscode
Install-Chocolatey-Package -PackageName dotnet-sdk
Install-Chocolatey-Package -PackageName golang
Install-Chocolatey-Package -PackageName googlechrome -NoChecksum

# Configure GIT.
git config --global user.email "kevin.dconinck@gmail.com"
git config --global user.name "Kevin De Coninck"

# Install the fonts.
Install-Fonts -Folder "..\fonts"

# Configure VS Code.
Install-VSCode-Extension -ExtensionId EditorConfig.EditorConfig
Install-VSCode-Extension -ExtensionId ms-vscode.powershell
Install-VSCode-Extension -ExtensionId vscode-icons-team.vscode-icons
Install-VSCode-Extension -ExtensionId mhutchie.git-graph
Install-VSCode-Extension -ExtensionId usernamehw.errorlens
Install-VSCode-Extension -ExtensionId golang.go
Install-VSCode-Extension -ExtensionId ms-dotnettools.csharp
Apply-VSCode-Configuration -ConfigPath "..\config\VSCode\settings.json"
