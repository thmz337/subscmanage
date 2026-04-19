# サブスク管理

## サービス概要

サブスク管理は、自分が利用しているサブスクを確認することができるサービスです。ユーザーは、自分が利用しているサブスクのプラン・金額・支払いタイミングを登録することができます。また、登録しているサブスクの支払いタイミングをサービスがメールで通知してくれます。

## URL
https://www.subscmanage.com

## スクリーンショット
<img width="545" height="672" alt="スクリーンショット 2026-04-19 21 52 29" src="https://github.com/user-attachments/assets/110988d6-4005-413e-a15d-1d437eb249f4" />

<img width="502" height="519" alt="スクリーンショット 2026-04-19 21 52 54" src="https://github.com/user-attachments/assets/81b95451-900d-4d95-80d6-1ffdf4f6bc72" />

## 動作環境

* Ruby 3.4.7
* Ruby on Rails 8.1.1

## 環境構築

### リポジトリの取得
```
git clone https://github.com/thmz337/subscmanage.git
cd subscmanage
bin/setup
```

### アプリの起動
```
foreman start -f Procfile.dev
```
