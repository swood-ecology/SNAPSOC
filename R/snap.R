#' Run the SNAP model
#'
#' @param data Data frame containing individual observations that can be used to calculate soil C for each observation
#' @param input An alternative data source to data. This provides a lower and upper bound, and distribution type, that are sampled from in a bootstrapping procedure
#' @param nsamp (numeric) Number of samples to draw for bootstrapping procedure
#' @param plot_vars Which variables to include in plot of variable importance
#' @returns Output values for multiple variables
#'
#' @examples {
#' cost <- snap(
#'   input = input_table, nsamp = 1000, plot_vars = c("carbon_project_NPV")
#' )
#' head(cost$y)
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
