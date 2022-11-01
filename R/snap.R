#' Run SNAP model
#'
#' @param data Data input containing values for each of the associated parameters for multiple observations
#' @param bootstrap (logical) Whether to run a bootstrapping procedure
#' @param nsamp (numeric) Number of samples to draw for bootstrapping procedure
#' @param input_table Input data to use when using single values per variable
#' @param plot_vars Which variables to include in plot of variable importance
#'
#' @return Output values for multiple variables
#'
#' @examples \dontrun{ article_pdf_download(infilepath = "/data/isi_searches", outfilepath = "data")}

snap <- function(data=NA,bootstrap=FALSE,nsamp=10000,input_table=NA,plot_vars=NA){
  if(bootstrap==TRUE){
      mcSimulation_results <- decisionSupport::mcSimulation(
        estimate = input_table,
        model_function = grazing_soc,
        numberOfModelRuns = nsamp, #run 1,000 times
        functionSyntax = "plainNames"
      )
      if(!is.na(plot_vars)){
        for(i in 1:length(plot_vars)){
          print(
            plot_pls(plsr.mcSimulation(object = mcSimulation_results,
                                       resultName = names(mcSimulation_results$y)[which(names(mcSimulation_results$y)==plot_vars[i])],
                                       ncomp = 1),
                     threshold = 0)
          )
        }
      }
      return(mcSimulation_results)
  }
  else{
    return(
      grazing_soc(data)
    )
  }
}
