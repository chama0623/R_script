# stepwise法の関数
step_mra_fun <- function(dat,fn){
  colnames(dat)[1] <- "y" # ターゲットのカラム名をyに変更
  ans <- lm(dat$y~., data=dat) # yを従属変数, それ以外を説明変数として回帰分析
  ans <- step(ans) # stepwise法による変数選択
  s.ans <- summary(ans) # 実行結果をs.ansに代入
  coe <- s.ans$coefficient # 傾き
  N <- nrow(dat) # サンプルサイズ
  aic <- AIC(ans) # 赤池情報量基準
  conf <- confint(ans,levels=(0.95)) # 95%CI
  R2 <- summary(ans)$r.squared # 決定係数
  result <- cbind(coe,conf,R2,aic,N)
  colnames(result)[5:6] <- c("RR95%CI.low","RR95%CI.up")
  e2 <- deviance(ans)
  MSE <- e2 / N
  
  if(nrow(result)>=2){
    result[2:nrow(result),7:9] <- ","
  }
  
  #write.table(cbind("E2",e2,"MSE",MSE),fn,append=T,quote=F,sep=",",row.names=F,col.names=F)
  #write.table(matrix(c(",",colnames(result)),nrow=1),fn,append=T,quote=F,sep=",",row.names=F,col.names=F)
  #write.table(result,fn,append=T,quote=F,sep=",",row.names=T,col.names=F)
  #write.table(",",fn,append=T,quote=F,sep=",",row.names=F,col.names=F)
}

df <- read.csv("multiple_regression_sample2.csv")
dat = df[,c(0,1:10)]
colnames(dat)[1] = "y"
fn = "stepwise_out.csv"
step_mra_fun(dat,fn)