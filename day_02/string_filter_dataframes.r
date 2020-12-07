# read csv file (create dataframe) from github raw url
real_df = read.csv('https://github.com/gumdropsteve/datasets/raw/master/december_real_estate.csv')

# display dataframe
real_df


# focus location columns
real_df$location

# filter by string
real_df[real_df$location == 'pleasanton', ]

# filter by not string
real_df[real_df$location != 'pleasanton', ]

# filter by alphabeticals
real_df[real_df$location > 'pleasanton', ]

real_df[real_df$location > 'oakland', ]


# focus dates column
real_df$ds

# filter by exact date
real_df[real_df$ds == '12/14/2019', ]

# filter by exact not date
real_df[real_df$ds != '12/14/2019', ]

# filter by date ranges
real_df[real_df$ds > '12/14/2019', ]

real_df[real_df$ds >= '12/14/2019', ]

real_df[real_df$ds < '12/17/2019', ]

real_df[real_df$ds <= '12/17/2019', ]
