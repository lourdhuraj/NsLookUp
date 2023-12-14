# Code by Lourdhu Raj
# Function to perform nslookup
function Get-NsLookupResults {
    param (
        [string]$domain
    )

    try {
        $result = Resolve-DnsName -Name $domain -ErrorAction Stop
        $result
    } catch {
        Write-Host "Error looking up $($domain): $_"
    }
}

# Read input file with domain names
$inputFile = "C:\Path\To\Input\Input.txt"
$domains = Get-Content $inputFile

# Output file
$outputFile = "C:\Path\To\Output\Output.txt"

# Loop through each domain, perform nslookup, and store the output in the text file
foreach ($domain in $domains) {
    $nslookupResult = Get-NsLookupResults -domain $domain
    $nslookupResult | Out-File -Append -FilePath $outputFile
}
