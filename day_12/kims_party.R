#######################################
####### Kims Party Example ############
#######################################

# Create columns for our datafram
place <- c("outdoors", "porch", "indoors")
weather <- c("sun", "rain")
proba <- c(0.4, 0.6)
value <- c(100, 20, 40, 0, 90, 50)

# Create the dataframe object with columns
df <- data.frame(place, weather, proba, value)

decision_a <- function(dataframe) {
  
  # Create new dataframe that calculates uncertainty values
  new = dataframe["proba"] * dataframe["value"]
  # Add column indication place
  new[,"place"] = place
  # Aggregate based on place and sum the related proba columns together
  agg_place <- aggregate(x=new$proba, by=list(new$place), FUN=sum )
  
  # Merge results with dataframe on "place" and "Group.1"
  datafame = merge(df, agg_place, by.x="place", by.y="Group.1")
  
  # Filter rows based on max value found in calculated uncertainty column "x"
  #dataframe = datafame[datafame$x == max(datafame[,5]),]
  
  # Filter rows for most valuable route
  dataframe = datafame[datafame$x == max(datafame[,5]),]
  
  # Filter for most valuable row based on value column
  dataframe = dataframe[dataframe$value == max(dataframe[,4]),]
  
  print(dataframe)
  
}

decision_a(df)