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
snap_data <- function(input = NA) {
    return(
      grazing_soc_data(input)
    )
}
