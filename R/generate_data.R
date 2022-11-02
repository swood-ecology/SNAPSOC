#' Generate data based on input information
#'
#' @param data Data input containing values for each of the associated parameters for multiple observations
#' @param obs (numeric) Number of samples to draw for bootstrapping procedure
#'
#' @return data base
#'
#' @examples \dontrun{
#' article_pdf_download(infilepath = "/data/isi_searches", outfilepath = "data")
#' }
generate_data <- function(data, obs = 1000) {
  mean_annual_rainfall <- rnorm(obs,
    mean = as.numeric(input_data[which(input_data$variable=='rain'),'mean']),
    sd = as.numeric(input_data[which(input_data$variable=='rain'),'sd'])
  )
  sand_percentage <- rnorm(obs,
    mean = as.numeric(input_data[which(input_data$variable=='sand'),'mean']),
    sd = as.numeric(input_data[which(input_data$variable=='sand'),'sd'])
  )
  fire_frequency <- rnorm(obs,
    mean = as.numeric(input_data[which(input_data$variable=='fire'),'mean']),
    sd = as.numeric(input_data[which(input_data$variable=='fire'),'sd'])
  )
  lignin_and_cellulose_content <- rnorm(obs,
    mean = as.numeric(input_data[which(input_data$variable=='lignin'),'mean']),
    sd = as.numeric(input_data[which(input_data$variable=='lignin'),'mean'])
  )
  soil_organic_cab_conc <- rnorm(obs,
    mean = as.numeric(input_data[which(input_data$variable=='soc'),'mean']),
    sd = as.numeric(input_data[which(input_data$variable=='soc'),'sd'])
  )
  grazing_intensity <- rnorm(obs,
    mean = as.numeric(input_data[which(input_data$variable=='grazing'),'mean']),
    sd = as.numeric(input_data[which(input_data$variable=='grazing'),'sd'])
  )
  bulk_density <- rnorm(obs,
    mean = as.numeric(input_data[which(input_data$variable=='bd'),'mean']),
    sd = as.numeric(input_data[which(input_data$variable=='bd'),'sd'])
  )
  return(tibble(mean_annual_rainfall, sand_percentage, fire_frequency, grazing_intensity, lignin_and_cellulose_content, soil_organic_cab_conc, bulk_density))
}
