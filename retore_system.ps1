function Install-Winget {
    try {
        # Check if Winget is already installed
        winget --version | Out-Null
    } catch {
        # Winget is not installed, so install it using PowerShell
        Set-ExecutionPolicy RemoteSigned -Scope CurrentUser; iex ((New-Object System.Net.WebClient).DownloadString('https://winget.ms/install.ps1'))
    }
}

# Install Winget if it's not already installed
Install-Winget

# Read the list of programs from a text file
$programList = Get-Content -Path "programList.txt"

# Loop through the list of programs and install each one using Winget with the --silent option
foreach ($program in $programList) {
    Write-Host "Installing $program ..."
    winget install $program --silent
}

# Display a message when all programs have been installed
Write-Host "All programs have been installed."
