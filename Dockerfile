FROM mcr.microsoft.com/dotnet/sdk:6.0 AS base


ARG BUILD_VERSION=1.0.0
RUN echo BUILD_VERSION $BUILD_VERSION

WORKDIR /app
COPY app/ .

# Build project
RUN mkdir build
RUN dotnet restore "MyWebApp.csproj"
RUN dotnet build "MyWebApp.csproj" -c Release -o /app/build --no-restore

# Publish project
RUN mkdir publish
RUN dotnet publish "MyWebApp.csproj" -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS final
WORKDIR /app
COPY --from=base /app/publish .
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000
ENTRYPOINT [ "dotnet", "MyWebApp.dll" ]
