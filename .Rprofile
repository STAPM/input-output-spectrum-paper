source("renv/activate.R")



### Create directories if they don't already exist

folder_paths <- c("data",
                  "intermediate",
                  "output",
                  "output/templates")

sapply(folder_paths, function(fpath) {
  outputDir <- fpath
  if(!dir.exists(here::here(outputDir))) {dir.create(here::here(outputDir))}
})

rm(folder_paths)
