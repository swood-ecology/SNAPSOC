#' Equations for SNAP model
#' @param x (data frame) Data input containing values for each of the associated parameters
#' @return list of key variables
#' @export
grazing_soc_data <- function(x) {
  # Model functions as described in:
  # Ritchie ME. 2014. Plant compensation to grazing and soil carbon dynamics in a tropical grassland.
  # PeerJ 2:e233 https://doi.org/10.7717/peerj.233

  # Eq.(1)
  maximum_aboveground_production <- (0.84 * x$mean_annual_rainfall - 27.5) *
    (1.33 - 0.0075 * x$sand_percentage)
  # Eq. (4)
  proportion_leaf_biomass <- 0.6 + 0.24 * x$grazing_intensity

  # Eq.(3)
  leaf_area_index <- proportion_leaf_biomass / (0.6 - 0.015 *
    exp(4.6 * x$grazing_intensity))

  # Eq.(2)
  grazer_modified_production <- leaf_area_index *
    maximum_aboveground_production

  # Eq.(5)
  estimate_aboveground_productivity <- maximum_aboveground_production *
    (proportion_leaf_biomass / (0.6 - 0.015 *
      exp(4.6 * x$grazing_intensity)))

  # Eq. (6)
  belowground_production <- 917.4 - 0.763 * x$mean_annual_rainfall

  # Eq.(7)
  plant_derived_carbon <- 0.45 * (x$lignin_and_cellulose_content *
    grazer_modified_production *
    (1 - x$grazing_intensity) * (1 - x$fire_frequency) +
    (x$lignin_and_cellulose_content + 0.05) *
      belowground_production)

  # Eq.(8)
  dung_derived_carbon <- x$lignin_and_cellulose_content * 0.45 *
    x$grazing_intensity * grazer_modified_production

  # Eq.(9)
  wetdays <- (0.00044 * x$mean_annual_rainfall - 0.025) * 240

  # SOC calculations
  baseline_carbon_stocks <- x$sampling_depth * x$soil_organic_cab_conc *
    x$bulk_density * (1 - x$sand_percentage / 100)

  # Eq.10
  maximum_microb_resp_rate <- wetdays * (0.7 + 0.3 * x$sand_percentage / 100) *
    (0.00044 * baseline_carbon_stocks - 0.579)

  # Eq.11
  change_carbon_stocks <- plant_derived_carbon + dung_derived_carbon -
    maximum_microb_resp_rate

  # Eq. 12
  soc_eq <- (plant_derived_carbon + dung_derived_carbon + wetdays * 0.579 *
    (0.7 + 0.3 * x$sand_percentage / 100)) / (0.00044 * wetdays * (0.7 + 0.3 * x$sand_percentage / 100))

  return(list(
    change_carbon_stocks = change_carbon_stocks,
    equilibrium_soc = soc_eq
  ))
}
