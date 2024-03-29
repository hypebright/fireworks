% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fireworks.R
\name{fireworksClass}
\alias{fireworksClass}
\alias{Fireworks}
\title{Fireworks R6 Class}
\description{
Create fireworks and start or stop the fireworks.
}
\details{
Create an object to show fireworks as an overlay on the app
or a specific HTML element specified by \code{id}. Then \code{start},
the fireworks show, and \code{stop} the fireworks show.
}
\examples{

## ------------------------------------------------
## Method `Fireworks$new`
## ------------------------------------------------

\dontrun{Fireworks$new()}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-Fireworks-new}{\code{Fireworks$new()}}
\item \href{#method-Fireworks-start}{\code{Fireworks$start()}}
\item \href{#method-Fireworks-stop}{\code{Fireworks$stop()}}
\item \href{#method-Fireworks-clone}{\code{Fireworks$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Fireworks-new"></a>}}
\if{latex}{\out{\hypertarget{method-Fireworks-new}{}}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Fireworks$new(
  id = NULL,
  session = shiny::getDefaultReactiveDomain(),
  options = list()
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{id}}{Id, or vector of ids, of element on which to display the fireworks, if \code{NULL} the fireworks show
will be an overlay on the full HTML document.}

\item{\code{session}}{The Shiny session}

\item{\code{options}}{A list of options to pass to the fireworks}
}
\if{html}{\out{</div>}}
}
\subsection{Details}{
Create fireworks.
}

\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{\dontrun{Fireworks$new()}
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Fireworks-start"></a>}}
\if{latex}{\out{\hypertarget{method-Fireworks-start}{}}}
\subsection{Method \code{start()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Fireworks$start()}\if{html}{\out{</div>}}
}

\subsection{Details}{
Start fireworks.
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Fireworks-stop"></a>}}
\if{latex}{\out{\hypertarget{method-Fireworks-stop}{}}}
\subsection{Method \code{stop()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Fireworks$stop(fadeOut = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{fadeOut}}{Whether to fade out the fireworks before stopping. Note that
this will take 2000ms to complete.}
}
\if{html}{\out{</div>}}
}
\subsection{Details}{
Stop the fireworks
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Fireworks-clone"></a>}}
\if{latex}{\out{\hypertarget{method-Fireworks-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Fireworks$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
