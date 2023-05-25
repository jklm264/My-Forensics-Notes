# System.Speech PowerShell

Add-Type -AssemblyName System.speech
$a=New-Object System.Speech.Synthesis.SpeechSynthesizer
$b="I am leet"
$a.Speak($b)
$a.GetInstalledVoices().VoiceInfo
$a.SelectVoice("Microsoft David Desktop")


Sources:

- [Tweet that started it all](https://twitter.com/Wietze/status/1660643279690428418)
- https://dev.to/adbertram/how-to-convert-text-to-speech-with-powershell-2227
