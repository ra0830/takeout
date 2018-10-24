# README

## 東京テイクアウト飯

* **概要**
<br>東京でテイクアウト出来る飲食店のレビュー投稿アプリ

* **コンセプト**
<br>*東京都のテイクアウト飯*に絞って情報を集める

* **バーション**
<br>ruby 2.5.1,rails 5.2.1

* **機能一覧**
<br>ログイン機能
<br>ユーザー登録機能
<br>ユーザー管理機能(不適切な投稿、コメントをしたユーザーを削除するため)
<br>投稿一覧表示機能(ジャンル、最寄駅による検索機能(ransackもしくはgemを使わずに)、値段と評価による並び替え機能、ページネーションを実装)
<br>投稿機能（写真も）
<br>編集機能
<br>削除機能
<br>気になる機能(お気に入り)
<br>評価機能(rate機能、投稿された記事に対するもの)
<br>コメント投稿機能（ajaxで）
<br>コメント編集機能
<br>コメント削除機能
<br>（編集、削除は投稿者と管理者のみ可能）


* **カタログ設計**
https://docs.google.com/document/d/1fsc4qsGFAJH2Ybwu4qtdkLoxGM0y3fiAhUM7J8VoSmk/edit?usp=sharing

* **テーブル定義**
https://docs.google.com/spreadsheets/d/11fvp9dEpWX6yE4WEO1e4f4OcUnu2UjwKGJGHkQUMeko/edit?usp=sharing

* **画面遷移図**
https://docs.google.com/spreadsheets/d/1tlAhH53HTv61kPYDDomal7nub-F4VJHIh2PNIXENFsE/edit?usp=sharing

* **画面ワイヤーフレーム**
https://cacoo.com/diagrams/w3QfW4wNdqPBAwDM/8D28A

<br>管理画面はrails_adminをそのまま使用予定

* **使用予定Gem**
<br>・devise
<br>・kaminari
<br>・rails_admin
<br>・carrierwave
<br>・mini_magick
<br>・(ransack)
