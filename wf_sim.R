# Wright-Fischer Simulation of a Diploid Population that starts with all alleles being distinct and runs until one of them is fixed

for(i in c(10,20,30,40)){ # Calculations done @ populationsizes of 10,20,30,& 40
 N<-i
 num.sim<-100 #Number of simulations
 total_gens<-0

 for(i in 1:num.sim){
  alleles<-1:(2*N)    #initial alleles
  count<-0	      #Initializing generation counts for a simulation
  while(length(unique(unlist(alleles))) > 1){
   newalleles<-rep(0,2*N)     #start a blank list of alleles
   count<-count + 1	      #increments the counter for another generation
   for(ind in 1:N){           # for each offspring
		par<-sample(1:N,2,replace=FALSE)    # choose two parents at random. This is WF!

		which.allele<-sample(c(-1,1),1)    # choose an allele from the mother
		newalleles[2*ind-1]<- alleles[2*par[1] +ifelse(which.allele==1,0,-1)]     # update the offspring's maternal allele

		which.allele<-sample(c(-1,1),1)   # choose an allele from the father
		newalleles[2*ind]<- alleles[2*par[2] +ifelse(which.allele==1,0,-1)]     # update the offspring's paternal allele
   }   # Next offspring, please
   alleles<-newalleles		 # offspring alleles are now parent alleles
  }			
  total_gens<-total_gens + count # Sums total count of generations
 }
 print(paste(c("Mean time to Fixation -", total_gens/num.sim, "(pop_size =", N, ")"), collapse = " ")) # Calculates and prints Mean
}


