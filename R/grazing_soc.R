#' Equations for SNAP model, including cost and revenue calculations
#'
#' @param x (data frame) Data input containing values for each of the associated parameters
#' @returns list of key variables
grazing_soc <- function(x) {
  # Model functions as described in:
  # Ritchie ME. 2014. Plant compensation to grazing and soil carbon dynamics in a tropical grassland.
  # PeerJ 2:e233 https://doi.org/10.7717/peerj.233

  # Eq.(1)
  maximum_aboveground_production <- (0.84 * mean_annual_rainfall - 27.5) *
    (1.33 - 0.0075 * sand_percentage)
  # Eq. (4)
  proportion_leaf_biomass <- 0.6 + 0.24 * grazing_intensity

  # Eq.(3)
  leaf_area_index <- proportion_leaf_biomass / (0.6 - 0.015 *
    exp(4.6 * grazing_intensity))

  # Eq.(2)
  grazer_modified_production <- leaf_area_index *
    maximum_aboveground_production

  # Eq.(5)
  estimate_aboveground_productivity <- maximum_aboveground_production *
    (proportion_leaf_biomass / (0.6 - 0.015 *
      exp(4.6 * grazing_intensity)))

  # Eq. (6)
  belowground_production <- 917.4 - 0.763 * mean_annual_rainfall

  # Eq.(7)
  plant_derived_carbon <- 0.45 * (lignin_and_cellulose_content *
    grazer_modified_production *
    (1 - grazing_intensity) * (1 - fire_frequency) +
    (lignin_and_cellulose_content + 0.05) *
      belowground_production)

  # Eq.(8)
  dung_derived_carbon <- lignin_and_cellulose_content * 0.45 *
    grazing_intensity * grazer_modified_production

  # Eq.(9)
  wetdays <- (0.00044 * mean_annual_rainfall - 0.025) * 240

  # SOC calculations
  baseline_carbon_stocks <- sampling_depth * soil_organic_cab_conc *
    bulk_density * (1 - sand_percentage / 100)

  # Eq.10
  maximum_microb_resp_rate <- wetdays * (0.7 + 0.3 * sand_percentage / 100) *
    (0.00044 * baseline_carbon_stocks - 0.579)

  # Eq.11
  change_carbon_stocks <- plant_derived_carbon + dung_derived_carbon -
    maximum_microb_resp_rate

  # Eq. 12
  soc_eq <- (plant_derived_carbon + dung_derived_carbon + wetdays * 0.579 *
    (0.7 + 0.3 * sand_percentage / 100)) / (0.00044 * wetdays * (0.7 + 0.3 * sand_percentage / 100))

  carbon_revenues <- change_carbon_stocks * price_ton_carbon - interventions_cost

  carbon_stocks_NPV <- discount(carbon_revenues, carbon_discount_rate, calculate_NPV = TRUE)

  return(list(
    change_carbon_stocks = change_carbon_stocks,
    equilibrium_soc = soc_eq,
    cashflow_carbon_stocks_NPV = carbon_revenues,
    carbon_project_NPV = carbon_stocks_NPV
  ))
}
