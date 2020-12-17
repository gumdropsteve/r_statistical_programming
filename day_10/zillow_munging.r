library(dplyr)
library(ggplot2)
library(tidyr)

# read in the first n_files (+1) CSV files
link = "https://github.com/gumdropsteve/datasets/raw/master/zillow/properties_2016_part_0.csv"
n_files = 4
for(n in 0:n_files){
  link = substr(link, start=1, stop=80)
  link = paste0(link, n, '.csv')
  # if it's the first file, create the dataframe
  if(n == 0){
    properties = read.csv(link)
  }else{
    # not the first file, missing column names, add it to the bottom of the dataframe
    new_properties = read.csv(link)
    colnames(new_properties) = colnames(properties)
    properties = rbind(properties, new_properties)
  }
}
properties = as_tibble(properties)
properties

# load in train data (transactions)
link <- 'https://github.com/gumdropsteve/datasets/raw/master/zillow/train_2016_v2.csv'
transactions <- read.csv(link)
transactions <- as_tibble(transactions)
transactions

# check for matches in properties and transactions data
matches = inner_join(transactions, properties, by='parcelid')

# convert all NULL values to 0
matches[is.na(matches)] = 0
matches

# load sample submissions file
sample_submissions = read.csv('https://raw.githubusercontent.com/gumdropsteve/datasets/master/zillow/sample_submission.csv')


# reference: https://www.kaggle.com/philippsp/exploratory-analysis-zillow
# rename columns so they're more understandable
properties <- properties %>% rename(
  id_parcel = parcelid,
  build_year = yearbuilt,
  area_basement = basementsqft,
  area_patio = yardbuildingsqft17,
  area_shed = yardbuildingsqft26, 
  area_pool = poolsizesum,  
  area_lot = lotsizesquarefeet, 
  area_garage = garagetotalsqft,
  area_firstfloor_finished = finishedfloor1squarefeet,
  area_total_calc = calculatedfinishedsquarefeet,
  area_base = finishedsquarefeet6,
  area_live_finished = finishedsquarefeet12,
  area_liveperi_finished = finishedsquarefeet13,
  area_total_finished = finishedsquarefeet15,  
  area_unknown = finishedsquarefeet50,
  num_unit = unitcnt, 
  num_story = numberofstories,  
  num_room = roomcnt,
  num_bathroom = bathroomcnt,
  num_bedroom = bedroomcnt,
  num_bathroom_calc = calculatedbathnbr,
  num_bath = fullbathcnt,  
  num_75_bath = threequarterbathnbr, 
  num_fireplace = fireplacecnt,
  num_pool = poolcnt,  
  num_garage = garagecarcnt,  
  region_county = regionidcounty,
  region_city = regionidcity,
  region_zip = regionidzip,
  region_neighbor = regionidneighborhood,  
  tax_total = taxvaluedollarcnt,
  tax_building = structuretaxvaluedollarcnt,
  tax_land = landtaxvaluedollarcnt,
  tax_property = taxamount,
  tax_year = assessmentyear,
  tax_delinquency = taxdelinquencyflag,
  tax_delinquency_year = taxdelinquencyyear,
  zoning_property = propertyzoningdesc,
  zoning_landuse = propertylandusetypeid,
  zoning_landuse_county = propertycountylandusecode,
  flag_fireplace = fireplaceflag, 
  flag_tub = hashottuborspa,
  quality = buildingqualitytypeid,
  framing = buildingclasstypeid,
  material = typeconstructiontypeid,
  deck = decktypeid,
  story = storytypeid,
  heating = heatingorsystemtypeid,
  aircon = airconditioningtypeid,
  architectural_style= architecturalstyletypeid
)
transactions <- transactions %>% rename(
  id_parcel = parcelid,
  date = transactiondate
)

properties <- properties %>% 
  mutate(tax_delinquency = ifelse(tax_delinquency=="Y",1,0),
         flag_fireplace = ifelse(flag_fireplace=="Y",1,0),
         flag_tub = ifelse(flag_tub=="Y",1,0))

# view the renamed dataframe
View(properties)


# visualize missing values
missing_values <- properties %>% summarize_each(funs(sum(is.na(.))/n()))

missing_values <- gather(missing_values, key="feature", value="missing_pct")
missing_values %>% 
  ggplot(aes(x=reorder(feature, -missing_pct), y=missing_pct)) +
  geom_bar(stat="identity",fill="red")+
  coord_flip()+theme_bw()


# when were the houses built?
properties %>% 
  ggplot(aes(x=build_year))+geom_line(stat="density", color="red", size=1.2)+theme_bw()


# extract census tractnumber and block number from rawcensustractandblock column
# note: unfinished
# converting from python: https://github.com/eswar3/Zillow-prediction-models/blob/master/Step%202a-Approach1.ipynb
matches$rawcensustractandblock
matches$census_tractnumber <- substring(matches$rawcensustractandblock,
                                        first=5,
                                        last=11)
matches$block_number = substring(matches$rawcensustractandblock, first=12)
matches$block_number  
matches$block_number = paste0(substring(matches$block_number, first=1, last=5), '.', substring(matches$block_number, first=6))
#df_train['block_number']=df_train['block_number'].apply(lambda x: int(round(float(x),0)) )
#df_train['block_number']=df_train['block_number'].apply(lambda x: str(x).ljust(4,'0') )
