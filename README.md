# bart26g-spotoptim

Source for the manuscript *Optimization with SpotOptim* by Thomas
Bartz-Beielstein — a report on [`spotoptim`](https://github.com/sequential-parameter-optimization/spotoptim),
a Python toolbox for Sequential Parameter Optimization (surrogate-model-based
optimization of expensive black-box functions).

The manuscript is written in Quarto (`index.qmd`) and rendered to an arXiv-style
PDF via the bundled `arxiv` format extension.

## Setup

The project uses [`uv`](https://docs.astral.sh/uv/) for dependency management and
depends on `spotoptim[torch]` (the neural-network examples use `spotoptim.nn`).
torch is resolved from the CPU-only PyTorch index configured in `pyproject.toml`.

```bash
uv sync                       # create the environment from uv.lock
```

The notebook front matter selects a Jupyter kernel named `spotoptim`. Register it
against the project environment once:

```bash
uv run python -m ipykernel install --user --name spotoptim --display-name spotoptim
```

## Render

```bash
uv run quarto render index.qmd
```

The arXiv submission bundle is in `arxiv_submission/` (and `spotoptim_arxiv.zip`).

## License

GNU Affero General Public License v3.0 — see [LICENSE](LICENSE).
