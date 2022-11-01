samp_data <- function(data,n=10000){
  mean_annual_rainfall <- density(data$mean_annual_rainfall)
  soil_organic_cab_conc <- density(data$soil_organic_cab_conc)
  bulk_density <- density(data$bulk_density)
  fire_frequency <- density(data$fire_frequency)
  lignin_and_cellulose_content <- density(data$lignin_and_cellulose_content)
  sand_percentage <- density(data$sand_percentage)
  grazing_intensity <- density(data$grazing_intensity)

  mean_annual_rainfall <- approx(
    cumsum(mean_annual_rainfall$y)/sum(mean_annual_rainfall$y),
    mean_annual_rainfall$x,
    runif(n)
  )$y

  soil_organic_cab_conc <- approx(
    cumsum(soil_organic_cab_conc$y)/sum(soil_organic_cab_conc$y),
    soil_organic_cab_conc$x,
    runif(n)
  )$y

  bulk_density <- approx(
    cumsum(bulk_density$y)/sum(bulk_density$y),
    bulk_density$x,
    runif(n)
  )$y

  lignin_and_cellulose_content <- approx(
    cumsum(lignin_and_cellulose_content$y)/sum(lignin_and_cellulose_content$y),
    lignin_and_cellulose_content$x,
    runif(n)
  )$y

  fire_frequency <- approx(
    cumsum(fire_frequency$y)/sum(fire_frequency$y),
    fire_frequency$x,
    runif(n)
  )$y

  sand_percentage <- approx(
    cumsum(sand_percentage$y)/sum(sand_percentage$y),
    sand_percentage$x,
    runif(n)
  )$y

  grazing_intensity <- approx(
    cumsum(grazing_intensity$y)/sum(grazing_intensity$y),
    grazing_intensity$x,
    runif(n)
  )$y

  return(
    tibble(mean_annual_rainfall,
           soil_organic_cab_conc,
           bulk_density,
           fire_frequency,
           lignin_and_cellulose_content,
           sand_percentage,
           grazing_intensity)
  )
}
