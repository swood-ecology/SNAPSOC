# library(decisionSupport)
# input_table <- "Grazing_impacts_on_soil_carbon.csv"
# legend_file <- "Soil_carbon_dynamics_legend.csv"
# results_folder <- "Results"
# figures_folder <- "Compound_figures"
#
# # Generate a function for testing the model function 'line by line'
# # by taking a single random sample of the provided estimates
# make_variables<-function(est,n=1)
# { x<-random(rho=est, n=n)
# for(i in colnames(x)) assign(i, as.numeric(x[1,i]),envir=.GlobalEnv)}
# make_variables(estimate_read_csv(input_table))
#
# grazing_soil_carbon_dynamics <- function(x, varnames){
#
# #Eq.(1)
# aboveground_prod_absence_grazing<-12.04-25.18/(0.0083*(mean_temp+273.15))+
#                                   0.72*log(mean_precipitation)
#
# #Eq.(2)
# biomass_absence_grazing<-aboveground_prod_absence_grazing/0.9
#
# #Eq.(3)
# biomass_onset_growing_season<-0.1*biomass_absence_grazing
#
# #Eq.(4)
# biomass_start_grazing_episode<-(biomass_absence_grazing*
#                                 biomass_onset_growing_season)/
#                                 biomass_absence_grazing*2.718^-
#                                 relative_growth_rate*
#                                 time_prior_grazing_episode+
#                                 biomass_onset_growing_season*(1-2.718^-
#                                 relative_growth_rate*
#                                 time_prior_grazing_episode)
# #Eq.(5)
# length_of_plant_growing_season<-22.99*mean_temp-0.94*mean_temp^2+0.073*
#                                 mean_precipitation
#
# #Eq.(6)
# days_end_grazing_to_end_growing<-length_of_plant_growing_season-
#                                  (time_prior_grazing_episode+period_of_stay)
#
# #Eq.(7)
# stocking_density<-(number_of_animals/total_area)*10^-4
#
# #Eq.(8)
# per_animal_daily_consumption<-2*(5300+770*log(mass_grazing_animals))
#
# #Eq.(9)
# relative_loss_biomass_grazing<-stocking_density*per_animal_daily_consumption*
#                                number_of_pastures*10^-4/
#                                biomass_start_grazing_episode
# #Eq.(10)
# biomass_removed_grazing<-period_of_stay*stocking_density*
#                          per_animal_daily_consumption*number_of_pastures*10^-4
#
# #Eq.(11)
# biomass_end_grazing_episode<-(biomass_absence_grazing*
#                               biomass_start_grazing_episode/
#                               biomass_absence_grazing*2.718^-
#                              (relative_growth_rate-
#                               relative_loss_biomass_grazing)*period_of_stay+
#                               biomass_start_grazing_episode*(1-2.718^-(
#                               relative_growth_rate-relative_loss_biomass_grazing)*
#                               period_of_stay))-biomass_removed_grazing
# # Eq.(12)
# biomass_end_growing_season<-biomass_absence_grazing*
#                             biomass_start_grazing_episode/
#                             biomass_absence_grazing*2.718^-relative_growth_rate*
#                             days_end_grazing_to_end_growing+
#                             biomass_end_grazing_episode*(1-2.718^-
#                             relative_growth_rate*
#                             days_end_grazing_to_end_growing)
#
# #Eq.(13)
# aboveground_prod_under_grazing<-(biomass_start_grazing_episode-
#                                  biomass_onset_growing_season)+
#                                 (biomass_end_growing_season-
#                                  biomass_start_grazing_episode)
#
# #Eq.(14)
# belowground_prod_under_grazing<-(0.602*mean_precipitation-0.00038*
#                                  mean_precipitation^2+5.88*mean_temp)*
#                                 (aboveground_prod_under_grazing/
#                                  PU)*APC*(soil_sampling_depth/40)
#
# #Eq.(15)
# biomass_removed_dormant_season<-(per_animal_daily_consumption/2)*
#                                 (365-length_of_plant_growing_season)*
#                                  stocking_density*10^-4
#
# #Eq.(16)
# dung_derived_carbon_input<-lignin_and_cellulose_content*0.45*0.3*
#                           (period_of_stay*per_animal_daily_consumption*
#                            number_of_pastures*stocking_density+
#                            biomass_removed_dormant_season)
#
# #SOC calculations
# baseline_carbon_stocks<-vv(sampling_depth*soil_organic_cab_conc*
#                            bulk_density*(1-sand_percentage/100),
#                            general_CV,n=n_years)
# #Eq.(17)
# daily_microbial_respiration<--0.579+0.00044*exp(10.18)*baseline_carbon_stocks^
#                               1.298
#
# #Eq.(18)
# wetdays<-(0.00044*mean_precipitation-0.025)*length_of_plant_growing_season
#
# #Eq.(19)
# microbial_respiration_rate<-wetdays*(0.7+0.3*sand_percentage/100)*
#                             daily_microbial_respiration
#
# #Eq.(20)
# plant_derived_soil_carbon<-0.45*(lignin_and_cellulose_content*
#                                 (biomass_end_growing_season-
#                                  biomass_removed_dormant_season/2)*
#                                 (1-fire_frequency)+
#                                 (lignin_and_cellulose_content+0.05)*
#                                  belowground_production)*
#                                  belowground_prod_under_grazing
#
# #Eq.(21)
# change_soil_carbon_density<-plant_derived_soil_carbon+
#                             dung_derived_carbon_input-
#                             microbial_respiration_rate
#
# carbon_revenues<-change_soil_carbon_density*price_ton_carbon-
#                  interventions_cost
#
# carbon_stocks_NPV<-discount(carbon_revenues,carbon_discount_rate,
#                    calculate_NPV=TRUE)
#
# return(list(change_soil_carbon_density=change_soil_carbon_density,
#             cashflow_carbon_stocks_NPV=carbon_revenues,
#             carbon_project_NPV=carbon_stocks_NPV))
# }
#
# # Run the Monte Carlo using the decisionSupport function ####
# decisionSupport(inputFilePath = input_table, #input file with estimates
#                 outputPath = results_folder, #output folder
#                 welfareFunction = grazing_soil_carbon_dynamics, #the function created above
#                 numberOfModelRuns = 10000,
#                 functionSyntax = "plainNames",
#                 write_table = TRUE,)
#
#
#
#
#
#
#
