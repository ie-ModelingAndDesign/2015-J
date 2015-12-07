# GAG

##アプリ概要
ゲームの課金に費やした金額を記録・集計する。月間・週間統計の課金額グラフ化機能、「このペースで課金すると来年までにいくら課金することになるか」のような予想額計算機能、「課金額で米がxキロ買えた」のような換算機能などを有する。

##機能リスト

- どのゲームに、いつ、いくら課金したかを記録
	- ゲームタイトルごとに課金額を記録できる
	- 日本円と海外通貨の換算機能
- 週間、月間、全期間での統計結果を表示
-	統計結果を各種グラフ化
	-	指定期間ごとの課金額を示す棒グラフ
	-	合計課金額のゲーム別内訳を示す円グラフ
- 課金抑止補助機能
	- 月ごとの課金限度額や収入などを自由に設定、現時点で何割を課金に消費したかを確認できる
	- 課金額を他の物の値段に換算（米xキロ分、ラーメンx杯分、など）
- ゲームのやりすぎ抑止機能
	-	ほかのゲームアプリの起動時間を計測、集計する

##GitHubの使い方

###setup

1. gitが入ってるか確認  
>$ git --version

	git version ほげほげって書いてあれば入ってる  	
	入ってなかったらHomebrewやらなんやらで入れる!  

1. リモートレポジトリ(webに上がってるディレクトリ)を置く場所に移動  
	例えば，~/modering/project/ に置く場合  
>$ cd ~/  
$ mkdir modering && cd modering  
$ mkdir project && cd project

	作業したいとこに置くといいと思う．

1. リモートレポジトリを取ってくる
	今回うちらの開発するやつは  
	https://github.com/ie-ModelingAndDesign/2015-J
	に置いてあるから
>$ git clone https://github.com/ie-ModelingAndDesign/2015-J

	すると作業したいとこにwebに上がってるやつがそこにあるはず！！  

1. アップロード時の設定
>$ git remote add origin git@github.com:ie-ModelingAndDesign/2015-J.git

1. SSHの設定
参考サイトに書いてあるのでやってみてくださいいい

これで作業準備完了 

###作業開始！の前に
ブランチってやつがあるから，使う  
これは，開発ラインを分けて作れる！！ってやつ  
新しく機能を追加する時とかにやるといいかも  
(詳しい情報はslackに投げた資料とかネットで調べて！)  
  
例えば，今のやつに出力機能を追加する時  
2. 新しいブランチを作る
>$ git checkout -b outputline(新しいブランチの名前，今回はoutputlineとする)

2. 今あるブランチを見てみる  
>$ git branch 

	これを実行すると新しく作ったやつとか誰かが作ったブランチ，メインのmasterブランチとかが表示されて，今どこかって表示してくれる

2. ブランチの移動
>$ git branch ブランチ名

	これで好きなブランチに移動できる
	また一つ前のブランチに戻るには,このコマンドを実行する．  
>$ git branch -
	

2. メインのmasterブランチに同期する  
ひと段落してエラーもないなーって時にメインのブランチと同期してみる．  
> $ git checkout master 
> $ git merge --no-ff 同期するブランチ名

###自分が作成したファイルをアップロードする時
自分が作ったやつの動作テストとかも終わってコードをwebに乗っける時  

3. git statusコマンドを実行すると新しく追加，内容変更したファイルがずらっと出てくる．  
>$ git status

3. そのファイルを追加したぞって記録する
>$ git add (ファイル名)

	すべてのファイルを追加する場合は  
>$ git add .

3. 状態を見てみるとさっきと変わってるはず!!
>$ git status

3. 最後にコメントつけてレポジトリに記録
>$ git commit -m "ここにコメント書く"
	
	コメントには，どこどこ変更したとか，どういう処理を追加したとか書いたほうがいい？

3. アップロード
> $ git push -u origin ブランチ名

###参考サイト
- Gitの基本的な使い方メモ  
http://qiita.com/opengl-8080/items/451c5967cbbc262f4f0d  

- MacでGitHubを使う手順 - SSHKeysの登録 / リポジトリの作成 / 基本コマンド  
http://mae.chab.in/archives/2306  

- GitHub - Error: Permission denied (publickey)  
https://help.github.com/articles/error-permission-denied-publickey/  

- 初心者Git日記その五～GitHubにSSH公開鍵登録～  
http://design1.chu.jp/setucocms-pjt/?p=580  


test