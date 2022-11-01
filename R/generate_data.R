# Generate data based on input information
generate_data <- function(data,obs=1000){
  mean_annual_rainfall <- rnorm(obs,
                mean = data %>% filter(variable=='rain') %>% select('mean') %>% as.numeric(),
                sd = data %>% filter(variable=='rain') %>% select('sd') %>% as.numeric())
  sand_percentage <- rnorm(obs,
                mean = data %>% filter(variable=='sand') %>% select('mean') %>% as.numeric(),
                sd = data %>% filter(variable=='sand') %>% select('sd') %>% as.numeric())
  fire_frequency <- rnorm(obs,
                mean = data %>% filter(variable=='fire') %>% select('mean') %>% as.numeric(),
                sd = data %>% filter(variable=='fire') %>% select('sd') %>% as.numeric())
  lignin_and_cellulose_content <- rnorm(obs,
                  mean = data %>% filter(variable=='lignin') %>% select('mean') %>% as.numeric(),
                  sd = data %>% filter(variable=='lignin') %>% select('sd') %>% as.numeric())
  soil_organic_cab_conc <- rnorm(obs,
               mean = data %>% filter(variable=='soc') %>% select('mean') %>% as.numeric(),
               sd = data %>% filter(variable=='soc') %>% select('sd') %>% as.numeric())
  grazing_intensity <- rnorm(obs,
               mean = data %>% filter(variable=='grazing') %>% select('mean') %>% as.numeric(),
               sd = data %>% filter(variable=='grazing') %>% select('sd') %>% as.numeric())
  bulk_density  <- rnorm(obs,
               mean = data %>% filter(variable=='bd') %>% select('mean') %>% as.numeric(),
               sd = data %>% filter(variable=='bd') %>% select('sd') %>% as.numeric())
  return(tibble(mean_annual_rainfall,sand_percentage,fire_frequency,grazing_intensity,lignin_and_cellulose_content,soil_organic_cab_conc,bulk_density))
}

