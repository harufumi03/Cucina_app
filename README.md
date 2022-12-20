# アプリ概要
- URL:  http://cucina-app.com/
- アプリ名　Cucina 「クッチーナ」料理人のための仕込み管理アプリケーション  
さまざまな調理の現場では日常業務にあたる「仕込み」を個人で管理し、チーム内での共有ができていない状況があります。  
個人で管理することで「仕込み」に使用する材料が他のメンバーと重なってしまったり、気をつけていても「仕込み」を忘れてしまったりします。
「仕込み」を行うことができないと、それを使用する一部のメニューに影響しお客様に料理を提供できない事もあります。  
自身も過去に調理師として働いていた経験から、そのような問題を少しでも減らしたいという思いでアプリを制作いたしました。
「Cucina」という名前はイタリア語でキッチンという意味です。  
調理師のためのアプリであり、親しみやすい名前で日常業務の負担を減らしたいという思いから名付けました。
アプリケーション上で管理を行う事がで共有がしやすくなり、業務の効率化と改善につながります。

# 開発言語
- Ruby 3.0.1
- Ruby on Rails 6.1.7

# 就職Termの技術
- devise
- Ajaxコメント機能
- AWS

# カリキュラム外の技術
- ransack
- カレンダー機能

# 実行手順
```
$ git clone git@github.com:harufumi03/Cucina_app.git
$ cd cucina_app
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```

# カタログ設計
https://docs.google.com/spreadsheets/d/1PJko9evXqyEJ3GkVqZuZ9pGIOG2l0zS7dEbEDm0SqmM/edit?usp=sharing

# テーブル定義書
https://docs.google.com/spreadsheets/d/1PJko9evXqyEJ3GkVqZuZ9pGIOG2l0zS7dEbEDm0SqmM/edit?usp=sharing

# ワイヤーフレーム
https://miro.com/app/board/uXjVPBTCUF8=/?share_link_id=677190895021

# ER図
![スクリーンショット 2022-12-17 15 59 34](https://user-images.githubusercontent.com/112235965/208229918-b3c2f017-c024-4955-80fd-31b32b5eeb96.png)

# 画面遷移図
![スクリーンショット 2022-11-25 16 52 59](https://user-images.githubusercontent.com/112235965/203929418-1436cfe2-f970-40b8-bbec-6650a9b6432a.png)
