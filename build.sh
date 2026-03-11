#!/bin/bash
# Install .NET 9.0 SDK
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 9.0 --install-dir ~/.dotnet
export PATH="$HOME/.dotnet:$PATH"

# Build the Client project
dotnet restore BlazoriseOutlookClone.Client/BlazoriseOutlookClone.Client.csproj
dotnet publish BlazoriseOutlookClone.Client/BlazoriseOutlookClone.Client.csproj -c Release -o output
