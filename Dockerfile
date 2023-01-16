FROM dart:stable AS build

# 参考 https://github.com/dart-lang/samples/blob/master/server/simple/Dockerfile
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart pub get --offline
RUN dart compile exe bin/dart_cloudrun.dart -o /app/start

FROM scratch

COPY --from=build /runtime/ /
COPY --from=build /app/ /app/

CMD ["/app/start"]
