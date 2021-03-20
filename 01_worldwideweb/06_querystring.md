前回は動的コンテンツに値を渡す方法について紹介しました。

1. 今日の日付などサーバーの環境に応じた値
2. ブラウザから渡された値
3. データベースなど他のサーバーから得る値

前回はこのうち1の例として現在時刻を表示しました。
きょうは2の例としてブラウザから値を渡してみましょう。

その前に前回のおさらいも兼ねて環境変数を表示してみます。
前回と同様に動的コンテンツのURLを表示してみます。

http://localhost:8080/cgi-bin/07/env.pl

この中で注目してほしい値がこれです。

```
QUERY_STRING = 
REQUEST_METHOD = GET
REQUEST_SCHEME = http
REQUEST_URI = /cgi-bin/07/env.pl
SCRIPT_FILENAME = /var/www/cgi-bin/07/env.pl
SCRIPT_NAME = /cgi-bin/07/env.pl
```

今度は同じURLに `?abc` という文字列をつけてアクセスしてみましょう。

http://localhost:8080/cgi-bin/07/env.pl?abc

```
QUERY_STRING = abc
REQUEST_METHOD = GET
REQUEST_SCHEME = http
REQUEST_URI = /cgi-bin/07/env.pl?abc
SCRIPT_FILENAME = /var/www/cgi-bin/07/env.pl
SCRIPT_NAME = /cgi-bin/07/env.pl
```

`REQUEST_URI`と`QUERY_STRING`に `abc` という値がつきましたね。

ブラウザは `?` に続けて文字をサーバーに送ることができます。これを「クエリ文字列」とか「URLパラメーター」といいます。

またWebサーバーではこの `?` より後の文字を `QUERY_STRING` という環境変数に格納することになっています。
つまりプログラムはこの `QUERY_STRING` という環境変数を使ってブラウザから渡された値を受け取ることができるわけです。

例としてクエリ文字列に名前を渡して、ページに出力してみましょう。

```perl
#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;

say("Content-Type: text/html");
say("");
say("Hello, ", $ENV{'QUERY_STRING'})
```

出力結果：3種類（yamada, tanaka, suzuki）

今回はPerlというプログラミング言語を使いました。PHPと時と同じように `$ENV` という値に環境変数が入っているので、そこから `QUERY_STRING` の値を受け取って出力しているのが分かってもらえるのではないでしょうか。


