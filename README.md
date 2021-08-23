# DFT of a Pitch Class Set

This is the repository for a web-app built with R and Shiny to compute and display the characteristic function and discrete fourier transform ([DFT](https://en.wikipedia.org/wiki/Discrete_Fourier_transform)) of a pitch class set ([PCS](https://en.wikipedia.org/wiki/Set_(music))). The app allows the user to create any PCS by selecting notes on the [circle of fifths](https://en.wikipedia.org/wiki/Circle_of_fifths), a well-known concept in western music theory.

A thorough reference on the use of the discrete fourier transform in music theory is [this book](https://www.springer.com/gp/book/9783319455808) by Emmanuel Amiot.

In this repository, you will find:

* This *README.md* file.
* The *ui.R* and *server.R* files that used to create the Shiny Application.
* The *Notes.csv* data set used in the code in *server.R*.
* A *dataset_construction.Rmd* file detailing the creation of the *Notes.csv* data set.
