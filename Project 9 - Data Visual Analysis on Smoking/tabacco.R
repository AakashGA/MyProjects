# Import needed libraries
library(ggplot2)
library(tidyverse)
library(gridExtra)

# Import source sheet that has code for the gray theme
source("hw.R") # calls to theme_gray() and theme()
# Reads in the counties smoking data set
counties_smoking <- read.csv(file = "counties_smoking.csv", as.is = FALSE)
# Reads in the states smoking data set
states_smoking <- read.csv(file = "states_smoking.csv", as.is = FALSE)
# Reads in the US smoking data set
us_smoking <- read.csv(file = "US_smoking.csv", as.is = FALSE)

# Reorder the regions so the legends & graphs appear in order of the region
counties_smoking2 <- counties_smoking
counties_smoking2$region_name <- factor(counties_smoking2$region_name, 
                                        levels = c('Northeast','West','Midwest','South'), ordered = TRUE)
# Fig 1

#+ fig.width=6, fig.height=4
fig1 <- ggplot(data = counties_smoking2, aes(y = region_name), fill = "grey30") +
  geom_bar(color = "Black") +
  labs(x = "Number of counties",
       y = "Region",
       title = "Figure 1. Bar chart for number of counties in each region") + hw + 
  theme(plot.caption = element_text(hjust=0)) 

# Fig 2
# Reorder the regions so the legends & graphs appear in order of the region
states_smoking2 <- states_smoking
states_smoking2$region_name <- factor(states_smoking2$region_name, c('Northeast','West','Midwest','South'))

#+ fig.width=6, fig.height=4
fig2 <- ggplot(data = states_smoking2, aes(y= region_name, weight = adult_population/1000000), 
               fill = "grey30") +
  geom_bar(color = "Black") +
  labs(x = "Adult population millions",
       y = "Region",
       title = "Figure 2. Bar chart for adult population in each region") + hw + 
  theme(plot.caption = element_text(hjust=0))

# Combine both fig1 and fig2 into a singular figure
grid.arrange(fig1, fig2, nrow = 2)

# Fig 3
states_smoking2$pack_tax_range <- factor(states_smoking2$pack_tax_range, 
                                           levels = c('Less than $1.00','$1.00 - $1.99','$2.00 + '), ordered = TRUE)

#+ fig.width=6, fig.height=4
vert <- ggplot(data = states_smoking2, aes(region_name, fill = fct_rev(pack_tax_range))) +
  geom_bar(position = "dodge", color = "black") +
  labs(y = "# states",
       x = "Region",
       title = paste("Figure 3. Grouped bar chart for number of states", "by region and excise tax per pack", 
                     sep="\n"),
       fill = 'Excise tax per pack') +
  scale_fill_manual(values = c("#ab0730","#fdca44","#7d8f29"), 
                    breaks = c('Less than $1.00','$1.00 - $1.99','$2.00 + ')) + hw + 
  theme(plot.caption = element_text(hjust=0))
vert + coord_flip()

# Fig 4
# Reorder the pack tax range so the legends & graphs appear in order of the packs
counties_smoking2$pack_tax_range <- factor(counties_smoking2$pack_tax_range, 
                                        levels = c('Less than $1.00','$1.00 - $1.99','$2.00 + '), ordered = TRUE)
#+ fig.width=6, fig.height=4
ggplot(data = counties_smoking2, aes(x = adult_smoking_rate, fill = pack_tax_range)) +
  geom_histogram(binwidth = 1, color = "black") + 
  scale_fill_manual(values=c("#ab0730","#fdca44","#7d8f29")) +
  facet_grid(rows = vars(pack_tax_range)) +
  labs(x = "Adult smoking rate (%)",
       y = "# counties",
       title = paste("Figure 4. Histograms for county-level adult smoking rates", "by excise tax per pack", 
                     sep="\n")) + hw + 
  theme(plot.caption = element_text(hjust=0), legend.position= "none")

# Fig 5
# Reorder the pack tax range so the legends & graphs appear in order of the packs
states_smoking2$pack_tax_range <- factor(states_smoking2$pack_tax_range, 
                                           levels = c('Less than $1.00','$1.00 - $1.99','$2.00 + '), ordered = TRUE)
# Create a custome colored pallette and assign the hex values
coloredpal <- c("#ab0730","#fdca44","#7d8f29")
set.seed(4977)

#+ fig.width=6, fig.height=3
fig5 <- ggplot(data = states_smoking2, aes(x = pack_tax_range, y = adult_smoking_rate, color = pack_tax_range)) + 
  geom_boxplot(position = "dodge") + 
  geom_jitter(position = position_jitter(set.seed(4977))) +
  labs(y = "Smoking rate (%)",
       x = "Excise tax per pack",
       title = "Figure 5. Box plots for state-level smoking rates") + hw +
  theme(plot.caption = element_text(hjust=0), legend.position = "none")
fig5 + scale_color_manual(values = coloredpal)

# Fig 6

#+ fig.width=6, fig.height=3
ggplot(data = states_smoking2, aes(x = pack_tax_range, y = adult_smoking_rate, fill = pack_tax_range))  +
  geom_violin() +
  scale_fill_manual(values=c("#ab0730","#fdca44","#7d8f29")) +
  labs(y = "Smoking rate (%)",
       x = "Excise tax per pack",
       title = "Figure 6. Violin plots for state-level smoking rates") + hw + 
  theme(plot.caption = element_text(hjust=0), legend.position = "none")

# Fig 7
# Create the panel num for the facet
panel_num <- c(as.integer((5:29)/5), 6L, 6 + as.integer((5:29)/5))

# Before adding panel numbers to the data frame, reorder it so states w/ smallest percent 
# change are at the beginning. These states will be in the first panel. 
states_smoking_2 <- states_smoking[order(-states_smoking$adult_smoking_rate),]

# Add the panel num variable to our new states smoking dataframe
states_smoking_2$panel_num <- panel_num

# Because states are a factor, ggplot() will put the states names along the y axis in 
# increasing level order starting at the BOTTOM of the graph. Need to reorder the factor levels
# of states, so states w/ the largest changes have the lowest level numbers
states_smoking_2$state <- reorder(states_smoking_2$state, states_smoking_2$adult_smoking_rate)

# Must factor the pack tax range for the fill
states_smoking_2$pack_tax_range <- factor(states_smoking_2$pack_tax_range, 
                                       levels = c('Less than $1.00','$1.00 - $1.99','$2.00 + '), ordered = TRUE)

#+ fig.width=6, fig.height=8
ggplot(data = states_smoking_2, aes(x = adult_smoking_rate, y = state, fill = pack_tax_range)) + 
  geom_point(shape = 21, size = 2) +
  scale_fill_manual(values = c("#ab0730","#fdca44","#7d8f29")) +
  scale_x_continuous(breaks = seq(10, 26, by = 2)) + 
  labs(x ="Percent smoking (%)", 
       y = "State",
       title = paste("Figure 7. Row-labeled plot for", "state-level smoking rates", 
                     sep="\n"),
       fill = 'Excise tax per pack ($)') + hw + guides(fill = guide_legend(reverse = FALSE)) +
  facet_grid(vars(panel_num), space = "free", scales = "free") +
  theme(strip.text=element_blank())

# Fig 8
#+ fig.width=6, fig.height=5
ggplot(data = us_smoking, aes(x = year)) + 
  geom_line(aes(y = male_smokers), color = "#19a0aa") + 
  geom_line(aes(y = female_smokers), color = "#f15f36") +
  scale_x_continuous(breaks= seq(1996, 2016, by = 2)) + 
  scale_y_continuous(breaks= seq(16, 24, by = 4)) + 
  geom_text(aes(x = 2016, y = 18.5, label = "Men")) + 
  geom_text(aes(x = 2015.75, y = 14.5, label = "Women")) +
  labs(x = "Year",
       y = "Smoking rate (%)",
       title = "Figure 8. Line graph for US adult smoking rates (1995-2017)",
       caption = paste("Source: National Health Interview Survey (NHIS).", 
                       "In 2006, the NHIS implemented a new simple design.", 
                       sep="\n")) + hw +
  theme(plot.caption = element_text(hjust=0), legend.position = "none") 


# Clean Up, reset memory as well clear our env pane
rm(list=ls())
gc(verbose = TRUE, reset = TRUE)
format(memory.size(), units = "MB")

