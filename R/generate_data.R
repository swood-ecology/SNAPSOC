#' Generate a fake data set based on information about the variables in the model
#'
#' @param data Data input containing values for each of the associated parameters for multiple observations
#' @param obs (numeric) Number of samples to draw for bootstrapping procedure
#' @returns Data frame that can be passed to the data function in snap() or resampled in the samp_data() function
#'
#' @examples {
#' fake_data <- generate_data(input_data, obs = 10000)
#' fake_data$fire_frequency <- rep(0,nrow(fake_data))
#' }
generate_data <- function(data, obs = 1000) {
  mean_annual_rainfall <- rnorm(obs,
    mean = as.numeric(data[which(data$variable=='rain'),'mean']),
    sd = as.numeric(data[which(data$variable=='rain'),'sd'])
  )
  sand_percentage <- rnorm(obs,
    mean = as.numeric(data[which(data$variable=='sand'),'mean']),
    sd = as.numeric(data[which(data$variable=='sand'),'sd'])
  )
  fire_frequency <- rnorm(obs,
    mean = as.numeric(data[which(data$variable=='fire'),'mean']),
    sd = as.numeric(data[which(data$variable=='fire'),'sd'])
  )
  lignin_and_cellulose_content <- rnorm(obs,
    mean = as.numeric(data[which(data$variable=='lignin'),'mean']),
    sd = as.numeric(data[which(data$variable=='lignin'),'mean'])
  )
  soil_organic_cab_conc <- rnorm(obs,
    mean = as.numeric(data[which(data$variable=='soc'),'mean']),
    sd = as.numeric(data[which(data$variable=='soc'),'sd'])
  )
  grazing_intensity <- rnorm(obs,
    mean = as.numeric(data[which(data$variable=='grazing'),'mean']),
    sd = as.numeric(data[which(data$variable=='grazing'),'sd'])
  )
  bulk_density <- rnorm(obs,
    mean = as.numeric(data[which(data$variable=='bd'),'mean']),
    sd = as.numeric(data[which(data$variable=='bd'),'sd'])
  )
  return(data.frame(mean_annual_rainfall, sand_percentage, fire_frequency, grazing_intensity, lignin_and_cellulose_content, soil_organic_cab_conc, bulk_density))
}
