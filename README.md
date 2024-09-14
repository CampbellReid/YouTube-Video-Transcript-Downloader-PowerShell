# YouTube Video Transcript Downloader for PowerShell
I had a use case where I needed to easily download the transcript of different YouTube videos. I could not find a package which already achieved this, so I decided to write a PowerShell macro to do it.

## How it works
You can run `Get-VideoTranscript <youtube url>` and within a few seconds you should be alerted it has been copied to your clipboard.

## Installation
Prerequisites include Gyan.FFmpeg and yt-dlp.yt-dlp from winget.
I experienced some issues with winget adding ffmpeg to my path, so if it isn't done for you, FFmpeg will install to: `C:\Users\your-user\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-7.0.2-full_build\bin`
Or something like this.

After you must edit your powershell profile and paste the function in there. Once you do so the function will be available as a command in every powershell window.