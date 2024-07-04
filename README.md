# MERS 　-Media Emotion Rating System-
<div align="center">
    <img width="719" alt="image" src="https://github.com/ISDL-dev/MERS/assets/119837395/49f5acc0-fd6e-4cf9-b90c-1eec0b8d9539">
</div>

## 目次
1. [プロジェクトについて](#プロジェクトについて)
2. [使用技術](#使用技術)
3. [開発環境構築](#開発環境構築)
4. [使用方法](#使用方法)
5. [ER図](#ER図)


## プロジェクトについて

本アプリケーションは，被験者がメディアを視聴した時の感情を評価し，メディアと感情の関係性を分析するためのデータセットを作成する．

![MERS](https://github.com/ISDL-dev/MERS/assets/119837395/c7d5824b-37b0-4a81-a48d-f272b476bb4e)

## 使用技術

Backend: <img src="https://img.shields.io/badge/-Go-76E1FE.svg?logo=go&style=plastic">

Frontend: <img src="https://img.shields.io/badge/-React-61DAFB.svg?logo=react&style=plastic">

Database: <img src="https://img.shields.io/badge/-Mysql-4479A1.svg?logo=mysql&style=plastic">

Container: <img src="https://img.shields.io/badge/-Docker-1488C6.svg?logo=docker&style=plastic">

## 開発環境構築

### コード生成

1.コード生成のツールをインストールしていない場合

カスタムした openapi-generator となる jar ファイルを生成するため，以下の方法で maven をインストールする．

- MacOS：`brew install maven`
- その他の OS：https://maven.apache.org/install.html

また，生成した jar ファイルを実行してスキーマを生成するため，Java の実行環境を用意する．

- Java Download: https://www.java.com/ja/download/

2.コード生成のツールをインストールが完了している場合

以下のコードを実行することで，jar ファイルを生成する．
テストコードのコンパイルやテストの実行をスキップするように指定している．

```bash
make create-jar
```

以下のコードを実行することで，openapi-generator によりスキーマを生成する．
現状は，モデル，リクエスト，レスポンスの構造体のみを生成する．

```bash
make generate
```

### 依存関係のインストール

frontend のディレクトリで以下のコマンドを実行する．

```bash
npm install --frozen-lockfile
```

backend のディレクトリで以下のコマンドを実行する．

```bash
npm install --frozen-lockfile
```

## 使用方法
### アプリケーションの起動

MERS ディレクトリ直下で，以下のコマンドを実行して Docker コンテナのビルドと起動をする．

#### 本番環境

```bash
make build-up prod
```

起動後に`192.168.10.127:4000` にアクセスして実験を行う． 
本番環境の詳細な環境設定に関して，MERS Documentsを参考にすること．

#### 開発環境

```bash
make build-up dev
```

起動後に`http://localhost:4000` にアクセスして動作確認を行う．  


### アプリケーションの停止

MERS ディレクトリ直下で，以下のコマンドを実行して Docker コンテナの削除と停止をする．

#### 本番環境

```bash
make stop prod
```

#### 開発環境

```bash
make stop dev
```

## ER図

データベース構成を以下の図に示す．

```mermaid
erDiagram
    conditions ||--o{ trials:"1:N"
    channel_types ||--o{ channel_relations:"1:N"
    channel_relations }o--|| channels:"N:1"
    trials }|--|| channel_types:"N:1"
    trials ||--|| subjects:"1:1"
    rating }o--|| images:"N:1"
    rating }o--|| movies:"N:1"
    trials ||--o{ rating:"1:N"
    trials ||--|| signals:"1:1"
    signals ||--|{ calibrations:"1:N"
    signals ||--|{ trend_ranges:"1:N"

    channel_types {
        INT id PK
        VARCHAR channel_type_name
    }

    channel_relations {
        INT id PK
        INT channel_type_id FK
        INT channel_number
        INT channel_id FK
    }

    conditions {
        INT id PK
        VARCHAR condition_name
        VARCHAR location
        VARCHAR mediatype
        INT number_of_media
        INT rating_second_by_media
        VARCHAR dataset
        VARCHAR platform
    }

    trials {
        INT id PK
        INT condition_id FK
        INT channel_type_id FK
        DATETIME pre_started_at
        DATETIME started_at
        DATETIME ended_at
    }

    channels {
        INT id PK
        VARCHAR channel_name
    }

    subjects {
        INT trial_id PK
        VARCHAR name
        INT age
        VARCHAR gender
        VARCHAR handedness
        VARCHAR vision
        VARCHAR vision_aid
        VARCHAR education
        VARCHAR alcohol_consumption
        VARCHAR coffee_consumption
        VARCHAR tea_consumption
        VARCHAR tobacco_consumption
        VARCHAR drug_consumption
        VARCHAR syndroms
        FLOAT hours_of_sleep_last_night
        FLOAT normal_hours_of_sleep
        VARCHAR level_of_alertness
        FLOAT head_circumference
        FLOAT distance_nasion_inion
        FLOAT distance_left_right_jaw_hinge
    }

    signals {
        INT trial_id PK
        VARCHAR analyzed_signal_filename
        VARCHAR raw_signal_filename
    }

    calibrations {
        INT id PK
        INT trial_id FK
        VARCHAR calibration
    }

    trend_ranges {
        INT id PK
        INT trial_id FK
        TEXT trend_range
    }

    images {
        INT id PK
        VARCHAR filename
    }

    movies {
        INT id PK
        VARCHAR filename
    }

    rating {
        INT id PK
        INT trial_id FK
        INT image_id FK
        INT movie_id FK
        FLOAT valence
        FLOAT arousal
        FLOAT liking
        FLOAT dominance
        FLOAT famility
    }
```
