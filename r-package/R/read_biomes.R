#' Download official data of Brazilian biomes as an sf object.
#'
#' This data set includes  polygons of all biomes present in Brazilian territory and coastal area.
#' The latest data set dates to 2019 and it is available at scale 1:250.000. The 2004 data set is at
#' the scale 1:5.000.000. The original data comes from IBGE. More information at https://www.ibge.gov.br/apps/biomas/
#'
#' @param year A date number in YYYY format (defaults to 2019)
#' @param simplified Logic TRUE or FALSE, indicating whether the function returns the 'original' dataset with high resolution or a dataset with 'simplified' borders (Defaults to TRUE)
#' @param showProgress Logical. Defaults to (TRUE) display progress bar
#'
#' @export
#' @family general area functions
#' @examples \donttest{
#'
#' library(geobr)
#'
#' # Read biomes
#'   b <- read_biomes(year=2019)
#'
#'}
#'
read_biomes <- function(year=2019, simplified=TRUE, showProgress=TRUE){

  # Get metadata with data url addresses
  temp_meta <- select_metadata(geography="biomes", year=year, simplified=simplified)

  # list paths of files to download
  file_url <- as.character(temp_meta$download_path)

  # download files
  temp_sf <- download_gpkg(file_url, progress_bar = showProgress)
  return(temp_sf)
}
