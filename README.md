# インシデントアプリ

## 目的

1. 学習中に発生した事象を記録しておき、同じような事象が起きた際に参考にする。
2. 質問する際に記録した内容を共有することで、教育者と、生徒との齟齬をなくす。
3. 過去事象を参考にすることで調査時間の短縮

## アプリ概要

インシデントを共有し、他ユーザが事象解決を迅速化するためのアプリです。

1. スクール
    - 先生
        
        生徒から質問を受けたときに、時系列がわかるので対応しやすい
        
        フォーマットが決めることで必要情報が揃いやすい
        
    - 生徒
        
        フォーマットに従い事象を記載することで質問が具体的になる
        
        過去事象を探すことで、インシデント解決につながる
        
2. 個人利用
    - 過去事象を探すことで、インシデント解決につながる
    - 自身が以前遭遇したインシデントを記録しておくことで、次回発生時解決が迅速化する

## 背景

現職では、ユーザの問い合わせやエラー発生時、有識者への対応依頼、質問を実施し事象を解決しています。

また、発生した際は対応方法記録の記録を取り、次回発生時その情報をもとに対応できるようにしています。

そして、この方法が学習中にわからないことが発生した際に、講師に質問することと同じであると気づきました。

そこで現職で用いているインシデント管理アプリを学習者向けにカスタマイズすることで、学習効率を挙げられると考え、本アプリを作成しました。

現状、学習中にわからないことを調査している際に感じることを以下にまとめます。

1. 同じような事象を何回も調査し、時間を要する
2. google検索では間口が広すぎて、欲しい情報にたどり着くのに時間を要する
3. 質問をする際、すべてを伝えられない場合がある
    1. OS、バージョン情報、言語など
    2. 自身で実施した内容

以下を実施することで事象解消が迅速化すると考えました。

1. わからないことを調査した際は必ず、記録する
2. 範囲を限定することでほしい情報の取得時間を短縮
3. 予め入力項目を決めておくことで情報漏れを防ぐ

本アプリにて上記事項の解消ができるよう作成いたしました。

## 特に見てほしい点

同一スクール受講生に使ってもらい、見直しを実施した。

ここに感想を挿入予定

単体テスト、複合テストを実施した。

## 開発で苦労したこと

- データベースを利用したダミーデータの挿入がなかなかうまく行かなかった
- ログインをメールアドレスから、ユーザIDに変更したら管理者画面にログイン不可となった。
- 記事投稿機能を実施するのが難しかった。
- 一覧画面のテーブル表示をモバイル利用時カード型にするのが難しかった。

## その他工夫したこと

- herokuで利用する本番環境のみに使う定数を設定した。
- ダミーデータを入れて、利用している状況を生み出しながら実装していった。
- 行き詰まったり乗り気にならない場合、タスクを小さく分解しながら作業を実施した。
- ストロングパラーメータを利用して、予想外のデータが挿入されないようにした。
- 理想の実装をはじめから実装するのではなく、簡単な機能を実装後拡張していくようにした。

## 機能一覧

- ログイン機能
- インシデント投稿機能
- インシデント内に記事投稿機能
- 検索機能
- ソート機能
- ページネーション機能
- レスポンシブ対応
- プルダウン入力
- 画像投稿(実装予定)
- Rspecテスト実装（実装予定）

## 使用イメージ

イメージをgifを作る

## テーブル設計

- usersテーブル（ユーザーを情報管理するテーブル）

[無題](https://www.notion.so/014fbf1862f8443d917f2750d7222b9b)

- incidentsテーブル（インシデント内容を管理するテーブル）

[無題](https://www.notion.so/e81a8db6da114d2693ed72f3fbc43e21)

- coding_langsテーブル（プログラミング言語を管理するテーブル）

[無題](https://www.notion.so/481269f28bf04c8388179a15fb39a748)

- statusesテーブル（ステータスを管理するテーブル）

[無題](https://www.notion.so/e146bac0fe124098a3950cfe6594045c)

- os_nameテーブル（OSを管理するテーブル）

[無題](https://www.notion.so/5094483ffd96437d82e5a3d414843b44)

- articlesテーブル（コメントを管理するテーブル）

[無題](https://www.notion.so/9d767d6793fe47c3b4339bfba42fed46)

## 画面設計・機能

[無題](https://www.notion.so/07f0832183494693bcf3066bad881650)

## ER図

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/254d4bc7-d951-44f7-aaba-2d11d44ce405/Untitled.png)

## インフラ構成図

herokuのため現在未記載

## 今後追加予定機能

- Slack投稿機能
- github連携
- 管理者画面
- ジャンルごと検索
- 添付ファイルを投稿機能

## 開発環境

言語：Ruby (2.7.2)

フレームワーク：Ruby on Rails (6.1.3.2)

フロントエンド：HTML&CSS/Bootstrap/JavaScript/jQuey

DB：PostgreSQL

テスト：Rspec

インフラ：Heroku→AWS

ソースコード管理：GitHub(issueで、タスク管理する)
