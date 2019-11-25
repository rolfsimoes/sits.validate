# This script creates amazon data based on the SITS classifications,
# cutting the data with the amazon polygon (from IBGE), hidrography
# and urban areas

require("sits.validate")
setBaseDir("/home/rolf/inpe/Dropbox/Rolf/Geodata/sits/Amazon/")

applyMask <- function(file) {
  years <- c(14, 17)
  year <- file %>%
    basename %>%
    substr(years[1], years[2])

  cat(paste0("Processing year ", year, "\n"))

  year <- year %>% as.numeric()

  file %>%
    raster::raster() %>%
    amazonMask() %>%
    amazonUrbanMask(legend, year) %>%
    amazonWaterMask(legend)
}

processDirectory("post_process_remap", "post_process_masks", applyMask)

# apply amazon forest map for year 2000
file <- sits.validate::getTifFiles("post_process_remap")[1]
out_file <- sits.validate::baseDir(paste("post_process_masks", basename(file), sep = "/"))
file %>%
  raster::raster() %>%
  amazonMask() %>%
  amazonForestMask(legend) %>%
  amazonUrbanMask(legend, 2000) %>%
  amazonWaterMask(legend) %>%
  raster::writeRaster(filename = out_file, overwrite = TRUE,
                      datatype = raster::dataType(raster::raster(file)))
