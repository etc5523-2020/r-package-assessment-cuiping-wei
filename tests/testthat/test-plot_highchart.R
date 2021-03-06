context("Highchart plot")

test_that("plot_highchart", {
    library(magrittr)
    library(coronavirus)
    library(dplyr)
    data("coronavirus")
    data <- coronavirus %>%
      filter(date >= '2020-10-10') %>%
      filter(country %in% c("Afghanistan", "Liberia", "Austria")) %>%
      filter(type == "confirmed")

    p <- plot_highchart(df = data, x = date, y = cases, group = country, ylabs = 'Confirmed cases',
                        xlabs = 'Date', title = 'Highchart for COVID-19')

    expect_error(plot_highchart(data), "No expression to parse")
    expect_error(plot_highchart(data, date, cases), "No expression to parse")
    expect_error(p, NA)
    expect_true(is.highchart(p))
    expect_message(p, NA)
  })
