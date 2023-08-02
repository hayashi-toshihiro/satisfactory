# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


form_addの挙動について。
--目的--
・臨んだところに要素を追加できるフォームの樹形図を作る。

---必要な条件--
・ボタンの名前が被らないこと。
・２度同じボタンを押した場合でも、違う名前のボタンが作成されること。

--達成する為の挙動--
・ボタンを押すと、新しいボタンを生成する。同時に、自分のボタンの名前も変更することで、２度目押しても違う名前のボタンを生成できる。

--実際の挙動--
・１列目のボタン（初期値0-0-0）
　１回目(0-0-0)
  　ボタンを作成(0-1-0)同時に、自分のボタンの名前も変更(0-0-1)
  ２回目(0-0-1)
  　ボタンを作成(0-1-1)同時に、自分のボタンの名前も変更(0-0-2)・・・

・２列目のボタン(例：初期値0-1-0)
  １回目(0-1-0)
  　ボタンを作成(1-1-0)同時に、自分のボタンの名前も変更(0-2-0)
  ２回目(0-2-0)
  　ボタンを作成(1-2-0)同時に、自分のボタンの名前も変更(0-3-0)
　　
