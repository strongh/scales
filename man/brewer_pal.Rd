\name{brewer_pal}
\alias{brewer_pal}
\title{Color Brewer palette (discrete).}
\usage{brewer_pal(type="seq", palette=1)}

\description{
  Color Brewer palette (discrete).
}
\references{\url{http://colorbrewer2.org}}
\arguments{
  \item{type}{One of seq (sequential), div (diverging) or qual (qualitative)}
  \item{palette}{If a string, will use that named palette.  If a number, will
index into the list of palettes of appropriate \code{type}}
}
\examples{show_col(brewer_pal()(10))
show_col(brewer_pal("div")(5))
show_col(brewer_pal(pal = "Greens")(5))

# Can use with gradient_n to create a continous gradient
cols <- brewer_pal("div")(5)
show_col(gradient_n_pal(cols)(seq(0, 1, length = 30)))}
