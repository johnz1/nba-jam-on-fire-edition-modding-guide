#
# This script was created with ChatGPT (GPT-4o-4k)
#
# For pair of .DDS files and texture files (without a file extension), 
# this script will copy the contents of the .DDS image to the texture 
# file and preserve the original file header.
#


# Get all .DDS files in the current directory
$ddsFiles = Get-ChildItem -Path . -Filter *.dds

foreach ($ddsFile in $ddsFiles) {
    # Define the target file with no extension
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($ddsFile.FullName)
    $targetFile = Join-Path -Path $ddsFile.DirectoryName -ChildPath $baseName

    # Check if the target file exists
    if (-Not (Test-Path $targetFile)) {
        Write-Host "Error: Target file '$baseName' not found. Skipping $ddsFile." -ForegroundColor Red
        continue
    }

    # Get file sizes
    $ddsFileSize = (Get-Item $ddsFile.FullName).Length
    $targetFileSize = (Get-Item $targetFile).Length

    # Calculate the acceptable size range for comparison
    $minSize = $targetFileSize * 0.95
    $maxSize = $targetFileSize * 1.05

    # Check if the DDS file size is within 5% of the target file size
    if ($ddsFileSize -lt $minSize -or $ddsFileSize -gt $maxSize) {
        Write-Host "Error: Size of '$ddsFile' is not within 5% of '$baseName'. Skipping file." -ForegroundColor Red
        continue
    }

    # Read the .DDS file from 0x80 to the end
    $ddsBytes = [System.IO.File]::ReadAllBytes($ddsFile.FullName)
    $dataToCopy = $ddsBytes[0x80..($ddsBytes.Length - 1)]

    # Read the target file bytes
    $targetBytes = [System.IO.File]::ReadAllBytes($targetFile)

    # Ensure the target file is large enough to accommodate the new data
    if ($targetBytes.Length -lt 0x80 + $dataToCopy.Length) {
        # Resize the target file array
        $newSize = 0x80 + $dataToCopy.Length
        $newTargetBytes = New-Object byte[] $newSize
        [Array]::Copy($targetBytes, $newTargetBytes, $targetBytes.Length)
        $targetBytes = $newTargetBytes
    }

    # Copy the data into the target file starting at 0x80
    [Array]::Copy($dataToCopy, 0, $targetBytes, 0x80, $dataToCopy.Length)

    # Write the modified bytes back to the target file
    [System.IO.File]::WriteAllBytes($targetFile, $targetBytes)

    Write-Host "Processed $ddsFile"
}

# Wait for any key press before closing
Write-Host "Press any key to continue..."
[System.Console]::ReadKey($true) > $null
