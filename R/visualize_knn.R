#' Visualizes a knn K selector graph using accuracy and K dataframe
#'
#' @param df Specified dataframe
#' @param x Specified K variable
#' @param y Specified Accuracy variable
#' @param title Specified title of knn plot
#'
#' @return Returns a knn k selector plot using specified data
#' @export
#'
#' @examples
#' K <- c(1,2,4,5,10,18,25)
#' accuracy <- c(0.2,0.4,0.6,0.7,0.4,0.2,0.3)
#' df <- data.frame(K,accuracy)
#' visualize_knn(df,K,accuracy,"lethimcook")
visualize_knn <- function(df, x, y, title) {
  if (!is.data.frame(df)) {
    stop("data should be a data frame")
  }
  if (!is.character(title)) {
    stop("title should be of type string/character")
  }
  plot <- ggplot2::ggplot(df) +
  ggplot2::geom_line(ggplot2::aes(x = {{x}}, y = {{y}})) +
  ggplot2::geom_point(ggplot2::aes(x = {{x}}, y = {{y}})) +
  ggplot2::labs(title = title)+
  ggplot2::xlab("Number of K") +
  ggplot2::ylab("Accuracy") +
  ggplot2::theme(text = ggplot2::element_text(size = 18))
    return(plot)
}
