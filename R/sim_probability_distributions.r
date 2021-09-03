# script to simulate probability distributions in the example
# in the lecture on probability
library(ggplot2)
library(patchwork)
library(tidyverse)

# simulated data
normal_d <- tibble(outcome = rnorm(100000))
bern_d <- tibble(outcome = as.character(as.integer(rbernoulli(1000, 0.7))))
pois_d <- tibble(outcome = rexp(100000, 5)) 
beta_d <- tibble(outcome = rbeta(100000, 0.5, 0.5)) 
binom_d <- tibble(outcome = rbinom(100000, 15, 0.3))
t_d <- tibble(outcome = rt(100000, 10))

# function to draw plots of continuous variables
cont_plot <- function(data_sample, plot_title) {
  gp <- ggplot(data_sample, aes(outcome)) + 
    geom_density() +
    labs(x = "", y = "", title = plot_title) +
    theme(axis.text.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          plot.title = element_text(hjust = 0.5))
  return(gp)
}

# plot continuous distributions
cont_dist <- map2(list(normal_d, pois_d, 
                       beta_d, t_d),
                  list("Normal", "Poisson", 
                       "Beta (0.5, 0.5)", 
                       "T (df = 10)"),
                 cont_plot)

# plot Bernoulli distribution
bern_plot <- ggplot(bern_d, aes(outcome)) + 
  geom_histogram(stat = "count", fill = "lightgray") +
  labs(x = "", y = "", title = "Bernoulli") +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        plot.title = element_text(hjust = 0.5))

# plot binomial distribution
binom_plot <- ggplot(binom_d, aes(outcome)) + 
  geom_histogram(stat = "count", fill = "lightgray") +
  labs(x = "", y = "", title = "Binomial") +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        plot.title = element_text(hjust = 0.5))

# show plots together
(cont_dist[[1]] | cont_dist[[2]] | cont_dist[[3]]) / 
  (cont_dist[[4]] | binom_plot | bern_plot) + plot_annotation(
    caption = 'Based on simulated data'
  )

# save the resulting figure 
# (needs to be manually moved to lectures\4-probability\img)
ggsave("dist.png")
