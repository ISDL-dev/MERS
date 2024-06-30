# MERS 　-Media Emotion Rating System-
<div align="center">
    <img width="719" alt="image" src="https://github.com/ISDL-dev/MERS/assets/119837395/49f5acc0-fd6e-4cf9-b90c-1eec0b8d9539">
</div>

## 目次
1. [Overview](#Overview)
2. [Technologies](#Technologies)
3. [Environments](#Environments)
4. [Usage](#Usage)
5. [ER Diagram](#ER)


## Overview

This application is designed to evaluate the emotions of participants when they view media and to create a dataset for analyzing the relationship between media and emotions.

![MERS](https://github.com/ISDL-dev/MERS/assets/119837395/c7d5824b-37b0-4a81-a48d-f272b476bb4e)

## Technologies

Backend: <img src="https://img.shields.io/badge/-Go-76E1FE.svg?logo=go&style=plastic">

Frontend: <img src="https://img.shields.io/badge/-React-61DAFB.svg?logo=react&style=plastic">

Database: <img src="https://img.shields.io/badge/-Mysql-4479A1.svg?logo=mysql&style=plastic">

Container: <img src="https://img.shields.io/badge/-Docker-1488C6.svg?logo=docker&style=plastic">

## Environments

### Code Generation

1.If you haven't installed the code generation tools

To generate a customized openapi-generator jar file, install Maven as follows:

- MacOS：`brew install maven`
- Other OS: https://maven.apache.org/install.html

Additionally, to run the generated jar file and create the schema, set up a Java runtime environment.

- Java Download: https://www.java.com/ja/download/

2.If the code generation tools are already installed

Execute the following code to generate the jar file. This command skips the compilation of test code and the execution of tests.

```bash
make create-jar
```

Execute the following code to generate the schema using openapi-generator. Currently, it generates only the structure of models, requests, and responses.

```bash
make generate
```

### Dependency Installation

Run the following command in the frontend directory:

```bash
npm install --frozen-lockfile
```

Run the following command in the backend directory:

```bash
npm install --frozen-lockfile
```
## Usage
### How to activate the application

Run the following command in the root directory of MERS to build and start the Docker containers.

#### Production Environment

```bash
make build-up prod
```

After startup, access 192.168.10.127:4000 to conduct experiments. For detailed settings of the production environment, refer to MERS Documents.

#### Development Environment

```bash
make build-up dev
```

After startup, access http://localhost:4000 to check the operation.

### How to deactivate the application

Run the following command in the root directory of MERS to delete and stop the Docker containers.

#### Production Environment

```bash
make stop prod
```

#### Development Environment

```bash
make stop dev
```

## ER Diagram

The database schema is illustrated in the following diagram.

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
