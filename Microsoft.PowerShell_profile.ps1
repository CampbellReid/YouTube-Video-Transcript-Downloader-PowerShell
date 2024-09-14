function Get-VideoTranscript {
    param (
        [string]$video
    )

    # we need to pass --no-simulate otherwise --print implies that we should be simulating the download
    $subtitleFile = yt-dlp --write-subs --write-auto-subs --sub-langs "en" --sub-format "vtt" --quiet --skip-download --output "%(id)s.%(ext)s" --print "%(id)s.en.vtt" --no-simulate $video
    
    $outputText = ""

    # Load the file content into memory once
    $fileContent = Get-Content $subtitleFile

    # Variable to store the previous line for comparison
    $previousLine = ""

    # Use a simple loop to track the line number and process lines efficiently
    for ($lineNumber = 1; $lineNumber -le $fileContent.Length; $lineNumber++) {
        $line = $fileContent[$lineNumber - 1]
        
        # Skip the first 4 lines
        if ($lineNumber -le 4) {
            continue
        }

        # Skip empty lines or whitespace
        if ([string]::IsNullOrWhiteSpace($line)) {
            continue
        }

        # Skip lines that match the specific patterns (e.g., timestamps, brackets, HTML tags)
        if ($line -match '^$|-->|[\[\]]|<') {
            continue
        }

        # Check if the current line is the same as the previous line to avoid duplicates
        if ($line -eq $previousLine) {
            continue
        }

        # Add the line to $outputText with a newline character
        $outputText += $line + "`n"

        # Update the previous line tracker
        $previousLine = $line
    }

    $outputText | Set-Clipboard
    Write-Output "Transcript copied to clipboard"
}