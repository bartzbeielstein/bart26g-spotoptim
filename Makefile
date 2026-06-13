# Makefile for the "Optimization with SpotOptim" manuscript.
#
# `make render` builds the arXiv PDF with the environment configured
# automatically: it runs Quarto inside the uv-managed project venv and points
# QUARTO_PYTHON at that interpreter, so no Jupyter-kernel registration or manual
# environment activation is needed. (A bare `quarto render` picks up the system
# Python, which has no Jupyter, and fails.)

DOC  := index.qmd
VENV := .venv

# Make Quarto use the project venv's interpreter (which has Jupyter + spotoptim).
QUARTO_PYTHON := $(CURDIR)/$(VENV)/bin/python3
export QUARTO_PYTHON

# `uv run` ensures the venv exists and matches uv.lock before invoking Quarto.
QUARTO := uv run quarto

.PHONY: help render preview clean

help:           ## Show available targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-9s\033[0m %s\n", $$1, $$2}'

render:         ## Render the manuscript to PDF (index.pdf)
	$(QUARTO) render $(DOC)

preview:        ## Live-preview the manuscript (rebuilds on change)
	$(QUARTO) preview $(DOC)

clean:          ## Remove Quarto render artifacts (incl. the _freeze cache)
	rm -rf .quarto _freeze _manuscript index_files index.tex index.pdf
