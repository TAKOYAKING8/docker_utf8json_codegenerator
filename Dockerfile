# 懸念点
# sdkは2.0ではなく、2.1でビルドしている(公式はこれしかなかった)
# 「version」という名の変数は使用不可 (nugetの何かとかぶる)

FROM mcr.microsoft.com/dotnet/core/sdk:2.1 AS build
ARG ROOT=src/Utf8Json.UniversalCodeGenerator/Utf8Json.UniversalCodeGenerator.csproj
ARG BRANCH_TAG
WORKDIR /src

# git clone
RUN git clone https://github.com/neuecc/Utf8Json.git . -b $BRANCH_TAG --depth 1 

# restore as distinct layers
RUN dotnet restore $ROOT

# publish app and libraries
RUN dotnet publish $ROOT -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/core/runtime:2.1
WORKDIR /app
COPY --from=build /app .

ENTRYPOINT ["dotnet", "/app/Utf8Json.UniversalCodeGenerator.dll"]
