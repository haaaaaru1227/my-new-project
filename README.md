# Hair Counseling
## サービス概要
**Hair Counseling**は、美容室でのカウンセリングを効率化し、お客様に最適なスタイルやメニューの提案をサポートするサービスです。美容師が短時間でお客様のイメージを的確に共有できるようになり、施術の満足度を向上させます。これにより、リピート率の向上や収益アップを目指します。

## サービスの背景と理由
美容師として働く中で、カウンセリングが最も重要です。しかし、カウンセリングに時間をかけすぎると施術が遅れ、他のお客様を待たせるリスクがある一方、短すぎるとお客様の要望やイメージを十分に共有できず、満足度が下がる可能性があります。この問題を解決するため、短時間で効果的なカウンセリングを提供するサービスを開発しました。

## ターゲットユーザー
- メインユーザー: 美容師
美容師が顧客の情報を効率的に管理し、カウンセリング結果や施術履歴を確認することで、より個別に対応したサービスを提供することができます。

- 副次的ユーザー: 美容室を利用する顧客
顧客は匿名でカウンセリングシートに髪質や希望するスタイルを入力し、美容師にその情報を共有できます。また、施術後のフィードバックを提供することでサービスの質向上にも貢献します。

## サービスの利用イメージ
お客様は、カウンセリングツールを利用して、好みや似合うスタイルを診断します。美容師はその診断結果を元に短時間で効果的なカウンセリングを実施し、施術に進むことができます。これにより、お店側はお客様を待たせることなく、的確な施術が可能となります。

## ユーザーの獲得戦略
まずは現在勤めている美容室で導入し、施術後にフィードバックをもらい、お客様の声をマーケティングに活用します。

## サービスの差別化ポイント
他のヘアスタイル診断アプリはありますが、カウンセリング機能を持つものはほとんどありません。本サービスでは、カウンセリング効率化や美容師のスキル向上サポートなど、美容室全体の品質向上を目指し、リピート率向上に特化しています。

## 機能候補

### MVPリリース時に実装したい機能
1. **トップページ**
   - サービスの概要や利用方法を説明するページ。
   - **使用技術**:
     - フロントエンド: HTML, CSS, jQuery

2. **ヘアスタイル診断機能**
   - 顔型や髪質を匿名で入力し、適切なヘアスタイルを提案します。
   - **使用技術**:
     - フロントエンド: HTML, CSS, jQuery
     - バックエンド: Ruby on Rails
     - データベース: MySQL
     - API設計: `POST /api/style-diagnosis`: 顔型や髪質データを送信し、診断結果を取得
     参考: [Qiita記事](https://qiita.com/bstyle6130/items/c3dfebdceaaef8e3860d)

3. **カウンセリングシート作成機能**
   - 顧客識別情報なしで、希望するスタイルや施術内容を入力することができます。
   - **使用技術**:
     - フロントエンド: HTML, CSS, jQuery
     - バックエンド: Ruby on Rails
     - データベース: MySQL
     - API設計: 
       - `POST /api/counseling-sheet`: カウンセリング情報を一時的に送信
       - `GET /api/counseling-sheet-summary`: 美容師がカウンセリング結果を確認できる
     参考: [Qiita記事](https://qiita.com/yukomaki/items/aeb72749b02d8d5325e8)

### 本リリースまでに実装したい機能

1. **美容師用まとめ機能**
   - ヘアスタイル診断結果とカウンセリング情報をまとめ、美容師が一時的に確認できる機能。
   - **使用技術**:
     - フロントエンド: HTML, CSS, jQuery
     - バックエンド: Ruby on Rails
     - データベース: MySQL
     - API設計: `GET /api/summary`: 診断とカウンセリング情報のまとめを取得

2. **admin画面（管理者画面）**
   - **ユーザー管理:** 顧客と美容師の情報を一覧・編集・削除する機能。
   - **カウンセリング情報の確認:** カウンセリングシートや施術履歴を確認し、施術計画に役立てる。
   - **予約・スケジュール管理:** 美容師の予約状況を管理し、顧客の施術スケジュールを把握。
   - **フィードバック管理:** 施術後の顧客からのフィードバックを確認し、サービス向上のための情報を得る。
   - **使用技術**:
     - フロントエンド: HTML, CSS, jQuery
     - バックエンド: Ruby on Rails
     - データベース: MySQL
     - インフラ: AWS, Docker
  - **個人情報の管理方針**: 顧客が登録する個人情報は一切なく、来店時間と施術メニューのみで管理します。

### 画面遷移図
Figma：https://www.figma.com/board/Uv7zOf7NE2IYofRt5cOGV3/Untitled?node-id=0-1&t=XepndVWFu753dt2q-1

### READMEに記載した機能
- [ ] 診断機能（未ログインでも閲覧可能）
- [ ] 診断結果機能（未ログインでも閲覧可能）
- [ ] カウンセリング選択機能（未ログインでも閲覧可能）
- [ ] 管理者登録機能
- [ ] 管理者ログイン機能
- [ ] 管理者パスワード変更機能
- [ ] 管理者メールアドレス変更機能
- [ ] 美容師観覧まとめ機能
- [ ] カウンセリング履歴
- [ ] スケジュール管理
- [ ] メニュー・来店時間保存機能
- [ ] メニュー・来店時間変更機能
- [ ] メニュー・来店時間削除機能
- [ ] フィードバック管理機能
- [ ] メモ機能保存
- [ ] メモ変更機能
- [ ] メモ削除機能
- [ ] いいね解除機能

### 未ログインでも閲覧または利用できるページ
以下の項目は適切に未ログインでも閲覧または利用できる画面遷移になっているか？
- [ ] 診断機能
- [ ] 診断結果機能
- [ ] カウンセリング選択機能

### メールアドレス・パスワード変更確認項目
直接変更できるものではなく、一旦メールなどを介して専用のページで変更する画面遷移になっているか？
- [ ] メールアドレス
- [ ] パスワード

### 各画面の作り込み
画面遷移だけでなく、必要なボタンやフォームが確認できるくらい作り米ているか？
- [ ] 作り込みはある程度完了している（Figmaを見て画面の作成ができる状態にある）

### ER図
（ER図のスクリーンショットの画像）
https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=%E5%90%8D%E7%A7%B0%E6%9C%AA%E8%A8%AD%E5%AE%9A%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB.drawio#Uhttps%3A%2F%2Fraw.githubusercontent.com%2Fhaaaaaru1227%2Fmy-new-project%2Fadd-feature%2F%E5%90%8D%E7%A7%B0%E6%9C%AA%E8%A8%AD%E5%AE%9A%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB.drawio

### 本サービスの概要

本サービスは、カウンセリング機能と診断機能に特化した美容師向けのシステムです。ユーザーが簡単に自分に合ったヘアスタイルを提案されると同時に、美容師側ではその情報を基に最適なスタイリング提案ができるよう支援します。以下の機能を提供します.

### 1. カウンセリング機能
- 顧客がアンケート形式の質問に答え、希望するスタイルや髪の悩みを記録します。
- 美容師はカウンセリングシートを参考に、顧客に合わせた施術提案を行うことが可能です。

### 2. 診断機能
- 顔型や髪質などの情報をもとに、顧客に最適なヘアスタイルを提案します。
- ユーザー登録なしでも利用可能で、顧客が簡単に自分に合うスタイルを診断できます。

### 3. 履歴管理機能
- 顧客ごとの施術履歴を保存し、次回の施術時に参照できます。
- 美容師は履歴を基により個別化されたサービスを提供し、顧客満足度を向上させます。

---

このシステムにより、美容師と顧客の情報共有を効率化し、顧客にとって満足度の高い美容体験を実現することを目指しています。