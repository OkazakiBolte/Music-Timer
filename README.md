# Music-Timer

- ある時刻になったらYouTube上のLo-Fiを流したい
- `cron`を使ってこれを実現する

## `crontab`の内容

- `cron`については色んな所に説明がある
- Bash上で`crontab -e`を実行して設定を書き込む
- ちょっとトリッキーだった

```
10 06 * * * /usr/bin/bash /home/okazaki/my_palace/bgm/play.sh >> /home/okazaki/my_palace/bgm/play.log 2>&1
40 08 * * * /usr/bin/bash /home/okazaki/my_palace/bgm/pid-killer.sh

00 18 * * * /usr/bin/bash /home/okazaki/my_palace/bgm/play.sh >> /home/okazaki/my_palace/bgm/play.log 2>&1
00 21 * * * /usr/bin/bash /home/okazaki/my_palace/bgm/pid-killer.sh
```

- `>> /tmp/cron.log 2>&1`のようにエラーと標準出力をファイルに書き出すことで、`cron`が動かなくてもエラー内容を確認できた

## `play.sh`

- （僕がいないときに爆音で再生されると、近隣住民の迷惑になるので）音量は確実にちょうどいい感じ（50%とか）にしてから実行する
- なぜか下の内容で`~/.asoundrc`というファイルを作らないとデバイスを見つけられないようだった（だれが？）

```
defaults.pcm.card 1
defaults.ctl.card 1
```

- `youtube-dl`だとうまくいかない。`mpv`を使うのが良さそう
- また`mpv`と`youtube-dl`は同じディレクトリにいないと動かないようだった。`whereis`とか`which`コマンドで場所を探して、違っていればシンボリックリンクを貼ったところうまく行った
- 別で音を出してるとうまく行かない

## `pid-killer.sh`

これは`mpv`のプロセスを見つけて`kill`するやつ。定刻になったら音楽を停止させるのに使う。