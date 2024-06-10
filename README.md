# MERS　-Media Emotion Rating System-
## 概要
本アプリケーションは、被験者がメディアを視聴した時の感情を評価し、メディアと感情の関係性を分析するためのデータセットを作成する。

![MERS](https://github.com/ISDL-dev/MERS/assets/119837395/c7d5824b-37b0-4a81-a48d-f272b476bb4e)

## 使用技術
Backend: <img src="https://img.shields.io/badge/-Go-76E1FE.svg?logo=go&style=plastic"> 

Frontend: <img src="https://img.shields.io/badge/-React-61DAFB.svg?logo=react&style=plastic">

Database: <img src="https://img.shields.io/badge/-Mysql-4479A1.svg?logo=mysql&style=plastic">

Container: <img src="https://img.shields.io/badge/-Docker-1488C6.svg?logo=docker&style=plastic">

# 使用にあたって
## 操作方法
### アプリケーションの起動
MERSディレクトリ直下で、以下のコマンドを実行してDockerコンテナのビルドと起動をする。
#### 本番環境
```bash
make build-up prod
```

#### 開発環境
```bash
make build-up dev
```

起動後に`192.168.10.127:4000` にアクセスして実験を行う。  
frontendアプリケーションのbuildに時間がかかるため、上記の起動コマンド実行後に2~3分ほど待つ。

### アプリケーションの停止
MERSディレクトリ直下で、以下のコマンドを実行してDockerコンテナの削除と停止をする。
#### 本番環境
```bash
make stop prod
```

#### 開発環境
```bash
make stop dev
```

# 開発者向け
## 環境構築
### コード生成
1.コード生成のツールをインストールしていない場合

カスタムしたopenapi-generatorとなるjarファイルを生成するため、以下の方法でmavenをインストールする。
- MacOS：`brew install maven`  
- その他のOS：https://maven.apache.org/install.html

また、生成したjarファイルを実行してスキーマを生成するため、Javaの実行環境を用意する。  
- Java Download: https://www.java.com/ja/download/


2.コード生成のツールをインストールが完了している場合

以下のコードを実行することで、jarファイルを生成する。
テストコードのコンパイルやテストの実行をスキップするように指定している。  
```bash
make create-jar
```

以下のコードを実行することで、openapi-generatorによりスキーマを生成する。
現状は、モデル、リクエスト、レスポンスの構造体のみを生成する。  
```bash
make generate
```

### 依存関係のインストール
frontendのディレクトリで以下のコマンドを実行する。
```bash
npm install --frozen-lockfile
```

backendのディレクトリで以下のコマンドを実行する。
```bash
npm install --frozen-lockfile
```

## システム構成図
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

## データベース構成図
データベース構成を以下の図に示す。
```mermaid
erDiagram
    conditions ||--o{ trials:"1:N"
    conditions ||--o{ channels:"1:N"
    trials ||--|| subjects:"1:1"
    rating ||--|| images:"1:1"
    rating ||--|| movies:"1:1"
    trials ||--o{ rating:"1:N"
    trials ||--|| signals:"1:1"
    signals ||--o{ calibrations:"1:N"
    signals ||--o{ trend_ranges:"1:N"
    channels{
        INT id PK
        INT condition_id FK
        INT channel_num
        VARCHAR channel_name
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
        DATETIME pre_started_at
        DATETIME started_at
        DATETIME ended_at
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
        FLOAT head_circumference
        FLOAT distance_nasion_inion
        FLOAT distance_left_right_jaw_hinge
    }

    signals {
        INT trial_id PK
        VARCHAR analyzed_signal_filename
        VARCHAR raw_signal_filename
    }

    calibrations{
        INT id PK
        INT trial_id FK
        VARCHAR calibration
    }

    trend_ranges{
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
