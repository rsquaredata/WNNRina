#' Weighted Nearest Neighbors Forecast
#'
#' @param train_y A numeric vector of historical power consumption.
#' @param window_size Integer. Size of the pattern to match (e.g., 96).
#' @param k Integer. Number of nearest neighbors.
#' @param forecast_h Integer. Horizon of the forecast.
#' @export
predict_wnn <- function(train_y, window_size = 96, k = 5, forecast_h = 96) {
    n <- length(train_y)
    current_window <- train_y[(n - window_size + 1):n]
    
    search_limit <- n - window_size - forecast_h
    distances <- sapply(1:search_limit, function(i) {
        past_window <- train_y[i:(i + window_size - 1)]
        sum((current_window - past_window)^2)
    })
    
    neighbor_indices <- order(distances)[1:k]
    weights <- 1 / (distances[neighbor_indices] + 1e-6)^2
    weights <- weights / sum(weights)
    
    predictions_matrix <- sapply(neighbor_indices, function(idx) {
        train_y[(idx + window_size):(idx + window_size + forecast_h - 1)]
    })
    
    return(as.numeric(predictions_matrix %*% weights))
}