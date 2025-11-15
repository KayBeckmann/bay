# Build Flutter web bundle
FROM cirrusci/flutter:3.24.0 AS build
WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get
COPY . .
RUN flutter build web --release --no-tree-shake-icons

# Serve via Nginx
FROM nginx:1.25-alpine AS runtime
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
