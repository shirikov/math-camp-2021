library("here")
library("magrittr")
library("tidyverse")
library("ggplot2")
library("latex2exp")
library(showtext)

#  custom ggtheme, based on theme_mgd()
source(here("R/theme_mathcamp.R"))
theme_set(theme_mathcamp()) # set default theme


# suppress version on html output folders
options(htmltools.dir.version = FALSE)


# colors to match the slides and graphics
primary <- "#9b0000"
secondary <- "#0479a8"



# Xaringan settings

library("xaringan")
library("xaringanthemer")

style_duo_accent(primary_color = primary, 
           secondary_color = secondary, 
           header_font_google = google_font("Cabin"),
           text_font_google = google_font("Roboto"),
           code_font_google = google_font("Inconsolata"),
           header_h1_font_size = "2.4rem",
           header_h2_font_size = "1.9rem",
           header_h3_font_size = "1.4rem",
           code_font_size = "0.8rem",
           code_inline_background_color    = "#F5F5F5",
           table_row_even_background_color = "white",
           extra_css = 
             list(".remark-slide-number" = list("display" = "none"),
                  ".remark-inline-code" = list("background" = "#F5F5F5",
                                                #e7e8e2; /* darker */
                                               "border-radius" = "3px",
                                               "padding" = "4px")))
  

  

# chunks:
# hide code and messages
# cache everything
knitr::opts_chunk$set(eval = TRUE, echo = FALSE, 
                      warning = FALSE, message = FALSE,
                      cache = TRUE,
                      fig.retina = 3,
                      fig.align = "center", dpi = 200)

