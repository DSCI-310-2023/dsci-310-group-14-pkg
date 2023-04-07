#' Visualizes a knn model dataframe
#'
#' @param data Specified dataframe
#' @param x Specified x-axis
#' @param y Specified y-axis
#' @param title Specified title of knn plot
#'
#' @return Returns a plot using specified dataframe
#' @export
#'
#' @examples
#' #visualization <- visualize_knn(data_fit,x = height,y = weight,title = "Prediction")
visualize_knn <- function(data, x, y, title) {
  if (!is.data.frame(data)) {
    stop("data should be a data frame")
  }
  if (!is.character(x)) {
    stop("x-axis should be of type string/character")
  }
  if (!is.character(y)) {
    stop("y-axis should be of type string/character")
  }
  if (!is.character(title)) {
    stop("title should be of type string/character")
  }
  plot <- ggplot2::ggplot(df) +
  ggplot2::geom_line(aes(x = x, y = y)) +
  ggplot2::geom_point() +
  ggplot2::labs(title = title)+
  ggplot2::xlab("Number of K") +
  ggplot2::ylab("Accuracy") +
  ggplot2::theme(text = element_text(size = 18))

    return(plot)
}
