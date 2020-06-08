# これは何か?
dockerfile
- ソースコードからビルドしてUtf8Json.UniversalCodeGeneratorを作る
- Utf8Json.UniversalCodeGeneratorを実行する

# 作成理由
[Utf8Json - Fast JSON Serializer for C#](https://github.com/neuecc/Utf8Json)をAndroidで使用するときはPre Code Generationを行わなければならないが、それを行う実行バイナリ(Utf8Json.UniversalCodeGenerator)が以下の条件の時は動作しない。
- Mac

[詳しくはこちら Pre Code Getneration](https://github.com/neuecc/Utf8Json#pre-code-generationunityxamarin-supports)

# 使い方
1. <>のパスを埋めていく
1. docker-compose.yml.sampel から<.sample>拡張子を取り除く
1. docker-compose build
1. docker-compose run --rm utf8json

[Pre Code Getnerationのオプションはこちら](https://github.com/neuecc/Utf8Json#pre-code-generationunityxamarin-supports)

# バージョンの更新
[Utf8Json - Fast JSON Serializer for C#](https://github.com/neuecc/Utf8Json)が更新されたら、docker-compose.ymlの<BRANCH_TAG>を更新する。  
現在はv1.3.7に固定している。


# 懸念点
- sdkは2.0ではなく、2.1でビルドしている(公式はこれしかなかった)
- 「version」という名の変数は使用不可 (nugetの何かとかぶる)






