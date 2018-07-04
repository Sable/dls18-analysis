# src: https://www.harding.edu/fmccown/r/

plot_figure_v2 <- function(data_path, my_title){
  input <- read.table(data_path, header = FALSE)
  max_y <- max(input)
  max_g <- max(input[c(4,5,6,7),])
  if(my_title == 'q4'){
    max_y <- max(max_y, max_g * 1.8)
  }
  if(my_title == 'q22'){
    max_y <- max_y * 1.1
  }
  #max_y <- max(max_y, max_g * 1.2)
  plot_colors <- c("black", "blue", "red")
  
  plot(input[[1]], type="o", col=plot_colors[2], pch = 21,cex.lab = 2,
       ylab = "hello",
       ylim=c(0,max_y), axes=FALSE, ann=FALSE, cex=1.5) # HorseIR-Opt (blue)
  
  axis(1, at=1:7, labels=c("T1", "T2", "T4", "T8", "T16", "T32", "T64"), cex.axis=1.4)
  axis(2, ylim=c(0,max_y), cex.axis=1.4)
  box()
  lines(input[[3]], type="o", pch=6, lty=2,col=plot_colors[1], cex=1.5)  # HorseIR-Nonopt (black)
  lines(input[[2]], type="o", pch=4, lty=2,col=plot_colors[3], cex=1.5)  # MonetDB (red)
  #title(main=my_title, adj = 0.3, line = -3)
  title(main=my_title, cex.main=1.5)
  mtext("(ms)", side=2, line=2.2, cex=1.2)
  
  if(my_title == 'q16'){
    legend_pos <- 1 # left
  }
  else {
    legend_pos <- 3.3 # right
  }
  legend(legend_pos, y = max_y,
         legend=c("HorseIR-Nonopt", "HorseIR-Opt", "MonetDB"),
         cex=1.3, col=plot_colors,  pch=c(6,21,4), lty=1:3, y.intersp=0.9); # png: intersp=1.5
  # y.intersp controls vertical spaces between texts
  # print(exp(mean(log(input[[2]]/input[[1]])))) #geomeans
}

plot_queries_v2 <- function(sf){
  #png(filename=paste("dls18/",sf,".png", sep=""), height=400, width=1100, bg="white")
  setEPS()
  postscript(file=paste("dls18/",sf,".eps", sep=""), onefile = FALSE, height=5, width=12, bg="white")
  par(mfrow=c(2,4), mar = c(2,3.5,2,1), ps=10) # ps: font size
  # par(mfrow=c(2,4), mar = c(1,2,1,1) + 1, ps=20) # ps: font size (png)
  for (qid in c("q1", "q4", "q6", "q12", "q14", "q16", "q19", "q22")){
    plot_figure_v2(paste("dls18/", sf, "/", qid, ".dat", sep=""), qid)
  }
}

plot_queries_v2("sf1")
#plot_queries_v2("sf2")
#plot_queries_v2("sf4")
#plot_queries_v2("sf8")
#plot_queries_v2("sf16")
dev.off()
