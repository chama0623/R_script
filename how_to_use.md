# R言語 使い方メモ

## ディレクトリ変更
ディレクトリ取得
```R
getwd()
```

ディレクトリの変更
```
setwd("./R_script)
```

## 単回帰分析

1. データ読み込み
```R
data <- read.csv("ファイル名.csv")
```

2. 単回帰分析の実行
```R
result <- lm(従属変数~説明変数,data=data)
summary(result)
```

3. グラフの描画
```R
plot(data$x,data$y,xlab="x軸ラベル",ylab="y軸ラベル")
abline(result)
```

## 重回帰分析
```R
data <- read.csv("ファイル名.csv")
```

2. 単回帰分析の実行
```R
result <- lm(従属変数~説明変数1+説明変数2+...,data=data)
summary(result)
```

3. グラフの描画
```R
plot(data$x,data$y,xlab="x軸ラベル",ylab="y軸ラベル")
abline(result)
```

ステップワイズ法で変数選択を行う場合はstepwise.Rを実行する.
```R
source("stepwise.R")
```
