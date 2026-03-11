# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy solution and project files first (for better caching)
COPY BlazoriseOutlookClone.sln .
COPY BlazoriseOutlookClone/BlazoriseOutlookClone.csproj BlazoriseOutlookClone/
COPY BlazoriseOutlookClone.UI/BlazoriseOutlookClone.UI.csproj BlazoriseOutlookClone.UI/
COPY BlazoriseOutlookClone.Data/BlazoriseOutlookClone.Data.csproj BlazoriseOutlookClone.Data/
COPY BlazoriseOutlookClone.Models/BlazoriseOutlookClone.Models.csproj BlazoriseOutlookClone.Models/

# Restore dependencies
RUN dotnet restore BlazoriseOutlookClone/BlazoriseOutlookClone.csproj

# Copy all source code
COPY . .

# Build and publish
RUN dotnet publish BlazoriseOutlookClone/BlazoriseOutlookClone.csproj -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

# Copy published files
COPY --from=build /app/publish .

# Expose port
EXPOSE 8080

# Set environment
ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production

# Run the app
ENTRYPOINT ["dotnet", "BlazoriseOutlookClone.dll"]
