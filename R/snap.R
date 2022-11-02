#' Run SNAP model
#'
#' @param data (logical) Binary of whether data are being used
#' @param nsamp (numeric) Number of samples to draw for bootstrapping procedure
#' @param input Input data to use
#' @param plot_vars Which variables to include in plot of variable importance
#'
#' @return Output values for multiple variables
#'
#' @examples \dontrun{
#' article_pdf_download(infilepath = "/data/isi_searches", outfilepath = "data")
#' }
snap <- function(data = NA, input = NA, nsamp = 10000, plot_vars = NA) {
  if (is.na(data)) {
    if (nrow(input$marginal) > 8) {
      mcSimulation_results <- decisionSupport::mcSimulation(
        estimate = input,
        model_function = grazing_soc,
        numberOfModelRuns = nsamp, # run 1,000 times
        functionSyntax = "plainNames"
      )
      if (!is.na(plot_vars)) {
        for (i in 1:length(plot_vars)) {
          print(
            decisionSupport::plot_pls(
              decisionSupport::plsr.mcSimulation(
                object = mcSimulation_results,
                resultName = names(mcSimulation_results$y)[which(names(mcSimulation_results$y) == plot_vars[i])],
                ncomp = 1
              ),
              threshold = 0
            )
          )
        }
      }
      return(mcSimulation_results)
    } else if (nrow(input$marginal == 8)){
      mcSimulation_results <- decisionSupport::mcSimulation(
        estimate = input,
        model_function = grazing_soc_noprice,
        numberOfModelRuns = nsamp, # run 1,000 times
        functionSyntax = "plainNames"
      )
      if (!is.na(plot_vars)) {
        for (i in 1:length(plot_vars)) {
          print(
            decisionSupport::plot_pls(
              decisionSupport::plsr.mcSimulation(
                object = mcSimulation_results,
                resultName = names(mcSimulation_results$y)[which(names(mcSimulation_results$y) == plot_vars[i])],
                ncomp = 1
              ),
              threshold = 0
            )
          )
        }
      }
      return(mcSimulation_results)
    }
  } else if (!is.na(data)){
    return(
      grazing_soc_data(data)
    )
  }
}
