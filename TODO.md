# Suggestions for further work

- Do box plot and stacked columns by hour
- Explain why we can't say that weekends are safer
- Explain why weekend having lower accidents is 'significant' (because boxes are disjoint?)
- Repeat day-of-week analysis but adjust dates so that day 'starts' at 6am
- Do histogram for Friday data to see what's going on
- Use auto-correlation to mathematically confirm spikes in accidents during week
- Across all the car/bike accidents, what are the most common manouvres?
- ACF on year plot?
- Clustering
  - k-modes (https://arxiv.org/ftp/cs/papers/0603/0603120.pdf)
  - Silhouette to find the best number of clusters
  - Missing values: use Bayes to estimate the likely replacements
  - ONE HOT to make all categories binary
