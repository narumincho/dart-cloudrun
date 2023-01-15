FROM dart:stable

COPY [".", "."]

CMD [ "dart", "run", "./bin/dart_cloudrun.dart" ]
