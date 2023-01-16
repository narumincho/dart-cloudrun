FROM dart:stable AS build

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart pub get --offline
RUN dart compile exe bin/dart_cloudrun.dart -o ./bin/start

FROM scratch

COPY --from=build ./bin/start .

CMD ["/app/start"]
