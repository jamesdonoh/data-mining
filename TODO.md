# Revisit/clarify

- Categorisation of Date and Time fields

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

# Random things

- Motorcycles and Congestion
  https://books.google.co.uk/books?id=FRhZTA65kWIC&pg=PA307&lpg=PA307&dq=twmv&source=bl&ots=NhoAvNllMk&sig=sfbXmMRBBxoXOQax_9KZDpHewa8&hl=en&sa=X&ved=0ahUKEwjFvYnxwZHbAhUqCMAKHXlBCukQ6AEISDAL#v=onepage&q=twmv&f=false


# Checking TWMV data notes

14873 interactions of two-wheeled vehicles with one another vehicle (but incl both ways!)
262 duplicated Accident_Indexes - where both vehicles were TWMV
so 14611 if you exclude 'doubles'

There were 82866 accidents involving two vehicles:

```
$ q -H -d , "SELECT COUNT(*) FROM ./dftRoadSafety_Accidents_2016.csv WHERE Number_of_Vehicles = 2"
82866
```
