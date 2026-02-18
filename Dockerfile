FROM ruby:3.3-slim AS generate
WORKDIR /app
COPY engine.rb generate.rb rules.rb ./
RUN ruby generate.rb > nginx.conf

FROM nginx:mainline-alpine-slim
COPY --from=generate /app/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
