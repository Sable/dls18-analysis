# src: https://www.harding.edu/fmccown/r/

plot_figure <- function(data_path, my_title){
  input <- read.table(data_path, header = FALSE)
  max_y <- max(input)
  #max_g <- max(input[c(1)])
  #max_y <- max(max_y, max_g * 2)
  #plot_colors <- c("black", "blue", "red", "black", "black", "black" , "black")
  plot_colors <- c("blue", "red")
  
  plot(input[[1]], main=my_title,
       type="o", ylim=c(0,max_y), pch=21, col=plot_colors[1],
       axes=FALSE, ann=FALSE)  #T1
  box()
  axis(1, at=1:5, labels=c("SF1", "SF2", "SF4", "SF8", "SF16"), cex.axis=1)
  axis(2, ylim=c(0,max_y), cex.axis=1)
  #title(main=my_title, adj = 0.3, line = -3)
  #title(main=my_title, cex.main=1)
  mtext("(Geometric Mean Time: ms)", side=2, line=2.2, cex=1)
  lines(input[[2]], type="o", pch=4, lty=2,col=plot_colors[2], cex=1.5) # T2
  #lines(input[[2]], type="o", pch=6, lty=2,col=plot_colors[1], cex=1.5) # T2
  #lines(input[[3]], type="o", pch=7, lty=2,col=plot_colors[1], cex=1.5) # T4
  #lines(input[[4]], type="o", pch=8, lty=2,col=plot_colors[1], cex=1.5) # T8
  #lines(input[[5]], type="o", pch=6, lty=2,col=plot_colors[2], cex=1.5) # T16
  #lines(input[[6]], type="o", pch=10, lty=2,col=plot_colors[1], cex=1.5) # T32
  #lines(input[[7]], type="o", pch=4, lty=2,col=plot_colors[3], cex=1.5) # T64
  
  legend(1, 990,
         legend=c("HorseIR", "MonetDB"),
         cex=0.8, col=plot_colors,  pch=c(21,4), lty=1:2, y.intersp=0.9); # png: intersp=1.5
  
  # y.intersp controls vertical spaces between texts
  # print(exp(mean(log(input[[2]]/input[[1]])))) #geomeans
}

plot_queries <- function(file_name){
  #png(filename=paste("dls18/",sf,".png", sep=""), height=400, width=1100, bg="white")
  setEPS()
  postscript(file=paste("dls18/",file_name,".eps", sep=""), onefile = FALSE, height=2.5, width=5, bg="white")
  par(mar = c(2,3.5,1,1))
  plot_figure("dls18/geomeans.dat", "Geometric means for three threads across all SFs")
  #par(mfrow=c(2,4), mar = c(2,3.5,2,1), ps=10) # ps: font size
  # par(mfrow=c(2,4), mar = c(1,2,1,1) + 1, ps=20) # ps: font size (png)
  #for (qid in c("q1", "q4", "q6", "q12", "q14", "q16", "q19", "q22")){
  #  plot_figure_v2(paste("dls18/", sf, "/", qid, ".dat", sep=""), paste(qid, ""))
  #}
}

plot_queries("geomeans")
#plot_queries_v2("sf2")
#plot_queries_v2("sf4")
#plot_queries_v2("sf8")
#plot_queries_v2("sf16")
dev.off()
