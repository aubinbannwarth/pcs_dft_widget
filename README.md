# DFT of a Pitch Class Set

This is the repository for a [web-app](https://aubinbannwarth.shinyapps.io/pcs_dft_widget/) built with R and Shiny to compute and display the characteristic function and discrete fourier transform ([DFT](https://en.wikipedia.org/wiki/Discrete_Fourier_transform)) of a pitch class set ([PCS](https://en.wikipedia.org/wiki/Set_(music))). The app allows the user to create any PCS by selecting notes on the [circle of fifths](https://en.wikipedia.org/wiki/Circle_of_fifths), a well-known concept in western music theory.

A thorough reference on the use of the discrete fourier transform in music theory is [this book](https://www.springer.com/gp/book/9783319455808) by Emmanuel Amiot.

In this repository, you will find:

* This *README.md* file.
* The *ui.R* and *server.R* files that used to create the Shiny Application.
* The *Notes.csv* data set used in the code in *server.R*.
* A *dataset_construction.Rmd* file  and compiled *dataset_construction.html* file, detailing the creation of the *Notes.csv* data set. This document is visible [at this address](https://aubinbannwarth.github.io/pcs_dft_widget/dataset_construction.html).
* A *help.Rmd* file  and compiled *help.html* file, providing instructions on how to use the app. This document is visible [at this address](https://aubinbannwarth.github.io/pcs_dft_widget/help.html), and is also linked to within the app.
* A *reproducible_pitch.Rpres* file and compiled *reproducible_pitch.hmtl* file for a brief html5 presentation on the application. This was built using RStudio Presenter, and can be accessed [here](https://aubinbannwarth.github.io/pcs_dft_widget/reproducible_pitch.html). Note that due to the assignment constraints of being less than 5 pages, this presentation cannot possibly explain the application in detail, so refer to the other links on this page where appropriate.

