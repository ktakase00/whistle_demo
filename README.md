# whistle_demo

RSpecデモ用のプロジェクトです。何の機能もありません。

## spec実行

```
bundle exec rspec spec/batch/01_daily_batch_spec.rb
bundle exec rspec spec/batch/02_daily_batch_spec.rb
bundle exec rspec spec/batch/03_daily_batch_spec.rb
```

※実行時は`config/database.yml`に適切な値を設定しておくこと。

## メモ

データベース作成からマイグレーション実行までの手順をメモしておく。

### DB準備

#### DBユーザ作成

`postgres`など、新しいユーザを作成できるOSのユーザでDBサーバにログインし、実行する。

```
createuser -d -l -P -r -s docker
```

#### データベース作成

```
createdb -h localhost -U docker -E utf-8 --lc-collate=ja_JP.utf8 -T template0 whistle_demo
createdb -h localhost -U docker -E utf-8 --lc-collate=ja_JP.utf8 -T template0 whistle_demo_test
```

`--lc-collate`に指定できる値は以下のコマンドで確認する。

```
locale -a
```

### Railsプロジェクト作成

```
bundle exec rails new whistle_demo -d postgresql -B
```

Gemfileの `:development, :test` のグループに以下を追加する。

```
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails', '~> 4.0'
```

bundle install実行。

```
bundle install --path=vendor/bundler
```

### RSpec準備

```
bundle exec rails generate rspec:install
```

## scaffold実行

```
bundle exec rails generate scaffold Project project_nm:text start_at:timestamp release_at:timestamp completed_at:timestamp
bundle exec rails generate scaffold Milestones project_id:bigint milestone_nm:text schedule_at:timestamp completed_at:timestamp
bundle exec rails generate scaffold ProjectReport project_id:bigint report_at:timestamp status_cd:text
bundle exec rails generate scaffold MilestoneReport milestone_id:bigint report_at:timestamp status_cd:text
```

実行後、マイグレーションファイルを編集する。

### マイグレーション実行

```
bundle exec rails db:migrate
RAILS_ENV=test bundle exec rails db:migrate
```
