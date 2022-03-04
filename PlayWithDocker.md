# Play with Docker マニュアル
このドキュメントは、[Play with Docker](https://labs.play-with-docker.com/)で[DentsuTool](https://github.com/NT-Dentsu/dentsuTools)を動作させるためのマニュアルです。

## Play with Docker とは
Web上でDockerの実行環境を使用できるサービスです。

SSHで操作したり、ポートを開放してWebサーバを建てることもできます。

Play with Docker を開始してから4時間経つと自動でインスタンスが削除されます。

Play with Dockerを使用するには、Docker IDが必要です。[Docker Hub](https://hub.docker.com/)でSign upしてください。

## Play with Docker で Dentsu Tool を動作させる手順
1. Play with Docker にアクセスしてインスタンスを生成
   * 端末に`pwd`コマンドを実行しカレントディレクトリが`/root`であることを確認
2. [DentsuTool](https://github.com/NT-Dentsu/dentsuTools) と [lamp_docker](https://github.com/NT-Dentsu/lamp_docker) をインタンス上にcloneする
   * `git clone https://github.com/NT-Dentsu/dentsuTools.git`
   * `git clone https://github.com/NT-Dentsu/lamp_docker.git`
3. lamp_docker の`copy.sh`を編集
   * `source_dir="~/dentsu/"`を`source_dir="/root/"`に変更(DentsuToolディレクトリの配置場所が異なるときは、その場所に合わせる)
     * editorはvimとかで編集
4. `bash copy.sh`を実行
5. lamp_dockerディレクトリ内で`docker-compose up --build -d`を実行
   * Imageのダウンロードから始まるので、3~4分くらい時間かかります
6. 80番ポートを開いたのでOPEN PORTボタンをクリックし`80`と入力
   * そうすると勝手にWebページが開きます

lamp_docker周りの手順は、GitHubの[lamp_docker](https://github.com/NT-Dentsu/lamp_docker)ページに書かれてあるのと同様です。

コンテナを削除する場合は`docker-compose down`を実行してください。

# 参考文献
* [Docker 入門にはインストールなしで使える「Play with Docker」がいいと思う - Qiita](https://qiita.com/tag1216/items/ec7228440f6eaf849cd6)
* [入門 Docker](https://y-ohgi.com/introduction-docker/)

