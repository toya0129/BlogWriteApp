# README

* Name:

BlogWriteApp

* Overview:
  - 本システムはブログ記事の作成、記事に対するコメントの書き込み
  - つぶやきの投稿と返信機能
  - ユーザ同士のフォロー機能
  - Sign UpやLoginも可能（現在はLogin時のみ全ての機能を扱える）
などが行えるアプリケーション


* Ruby version
  - Ruby 2.4.1
  - Rails 5.2.2

* Database creation
  - articles(ブログの記事) title, user_id, contents, picture
  - comments(ブログ記事に対するコメント) article_id, user_id, body
  - follows(フォロー機能) user_id, follow_id
  - tweets(つぶやき)　user_id, contents, reply_id
  - users(ユーザーの管理) name, password_digest

* Test and Run
  - ターミナルでRailsを起動
  - localhost:3000にアクセスするとsign_up画面に遷移
  - sign_up or login後, 上部のボタンから各ページに遷移できる(記事の作成, つぶやき)
