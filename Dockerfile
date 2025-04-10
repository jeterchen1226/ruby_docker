FROM ruby:3.2.8-alpine

LABEL maintainer="Jeter <jeter.chen@highercloud.com.tw>"

RUN apk add --no-cache \
    build-base \
    postgresql-dev \
    yaml-dev \
    tzdata \
    nodejs \
    yarn

# 進到容器內就等於直接進到 app 資料夾
WORKDIR /app

# 將 Gemfile 相關檔案複製到 docker image 中目前工作目錄(app)
COPY Gemfile* .

RUN bundle install

# 將專案中所有文件複製到 docker 容器中
COPY . .

# docker 監聽的 port
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]