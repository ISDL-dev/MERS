# MERS　-Media Emotion Rating System-
本アプリケーションは、被験者がメディアを視聴した時の感情を評価し、メディアと感情の関係性を分析するためのデータセットを作成する。

# 使用技術
### バックエンド：<img src="https://img.shields.io/badge/-Go-76E1FE.svg?logo=go&style=plastic">

### フロントエンド：<img src="https://img.shields.io/badge/-React-61DAFB.svg?logo=react&style=plastic">

### データベース：<img src="https://img.shields.io/badge/-Mysql-4479A1.svg?logo=mysql&style=plastic">

### コンテナ：<img src="https://img.shields.io/badge/-Docker-1488C6.svg?logo=docker&style=plastic">

# システム構成図
システム構成を以下の図に示す。
```mermaid
flowchart LR
  frontend-->|HTTP POST trial| APIserver[APIServer]
  SignalServer-->|send signal| APIserver[APIServer]
  APIserver-->|insert trial record| DB[(Database)]
  APIserver-->|insert subjct record| DB[(Database)]
  APIserver-->|insert emotion record| DB[(Database)]
  APIserver-->|insert signal record| DB[(Database)]
```

# データベース構成図
データベース構成を以下の図に示す。
```mermaid
erDiagram
    trials ||--|| subjects:"1:1"
    trials ||--|| signals:"1:1"
    rating ||--|| images:"1:1"
    rating ||--|| movies:"1:1"
    trials ||--o{ rating:"1:N"

    trials {
        INT id PK
        VARCHAR location
        VARCHAR platform
        DATETIME pre_started_at
        DATETIME started_at
        DATETIME ended_at
        INT rating_second_by_media
        INT number_of_medias
    }

    subjects {
        INT trial_id PK
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
        BOOLEAN distribute_physiological_recordings
        FLOAT head_circumference
        FLOAT distance_nasion_inion
        FLOAT distance_left_right_jaw_hinge
    }

    signals {
        INT trial_id PK
        TEXT trend_range
        VARCHAR channel_types
        VARCHAR calibration
        VARCHAR analyzed_signal_filename
        VARCHAR raw_signal_filename
    }

    images {
        INT id PK
        VARCHAR dataset
        VARCHAR filename
    }

    movies {
        INT id PK
        VARCHAR dataset
        VARCHAR filename
    }

    rating {
        INT id PK
        FLOAT valence
        FLOAT arousal
        FLOAT liking
        FLOAT dominance
        FLOAT famility
        INT trial_id PK
        INT image_id FK
        INT movie_id FK
    }
```

# 環境構築
## カスタムしたopenapi-generatorを生成するための準備
カスタムしたopenapi-generatorとなるjarファイルを生成するため、以下の方法でmavenをインストールする。
- MacOS：`brew install maven`  
- その他のOS：https://maven.apache.org/install.html

また、生成したjarファイルを実行してスキーマを生成するため、Javaの実行環境を用意する。  
- Java Download: https://www.java.com/ja/download/

## カスタムしたopenapi-generatorによるスキーマの生成
以下のコードを実行することで、jarファイルを生成する。
オプションは、テストコードのコンパイルやテストの実行をスキップするように指定している。  
`make create-jar`

以下のコードを実行することで、openapi-generatorによりスキーマを生成する。
現状は、モデル、リクエスト、レスポンスの構造体のみを生成する。  
`make generate`

# 開発
## Dockerコンテナの起動方法
MERSディレクトリ直下で以下のコマンドを実行する。
```bash
docker-compose up -d --build
```

## Dockerコンテナの停止方法
MERSディレクトリ直下で以下のコマンドを実行する。
```bash
docker-compose stop
```

## Dockerコンテナの停止および削除方法
MERSディレクトリ直下で以下のコマンドを実行する。
```bash
docker-compose down
```