# MERS



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
