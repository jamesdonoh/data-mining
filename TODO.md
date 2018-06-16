# Data Choice

- Summarise/discuss Hill's clustering approaches (two-step, CHAID, cross-tabulation)

# Preparation

- Talk about data preparation/cleaning processes in general
- Document/describe 'Two-vehicle accidents involving motorcycles' workflow
- "pointless to even consider concepts that involved redundant or impossible combinations of attribute values"
  Witten - https://www.safaribooksonline.com/library/view/data-mining-4th/9780128043578/xhtml/chp001.xhtml#st0120

# Clustering

- k-modes (https://arxiv.org/ftp/cs/papers/0603/0603120.pdf)
  also: http://www.irma-international.org/viewtitle/10828/
- Silhouette to find the best number of clusters
- Missing values: use Bayes to estimate the likely replacements
- ONE HOT to make all categories binary

# Classification

- Explain that judiciously removing attributes can improve performance and comprehensibility
  see https://www.youtube.com/watch?v=XySEe4uNsCY&list=PLm4W7_iX_v4NqPUjceOGd-OKNVO4c_cPD&index=6

# Revisit/clarify

- Spreadsheet of attribute types
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

# Critical Review

- Explain why to use both KNIME and WEKA - compare strengths
- Importance of sanity checking attribute values - get close to your data
- CRISP-DM process: https://www.safaribooksonline.com/library/view/data-mining-4th/9780128043578/xhtml/chp001.xhtml#chp001titl
- Different ways of handling missing data in Weka: https://machinelearningmastery.com/how-to-handle-missing-values-in-machine-learning-data-with-weka/
- For each algorithm used, talk about:
  - Limitations
  - Performanc
- How to evaluate quality of clusters?
- "Different learning algorithms correspond to different concept description spaces searched with different biases." -- Witten, https://www.safaribooksonline.com/library/view/data-mining-4th/9780128043578/xhtml/chp001.xhtml#st0120

- Evaluating classifiers
  - Independent test set? i.e. other years
  - Percentage splits, repeated ('repeated holdout')
    - Rule of thumb is to use percentage split for lots of data
  - Cross-validation (systematic way of doing repeated holdout)
    - For less data usually - don't need it for large data sets
    - Stratified even better
  - Do a table like in https://www.youtube.com/watch?v=dGF475wS5eY&list=PLm4W7_iX_v4NqPUjceOGd-OKNVO4c_cPD&index=13 to compare results (show reduction in variance)
- If trying multiple algorithms use three-way split: training/test/validation
  https://www.safaribooksonline.com/library/view/Data+Mining,+4th+Edition/9780128043578/xhtml/chp005.xhtml#s0010

# Random things

- Motorcycles and Congestion
  https://books.google.co.uk/books?id=FRhZTA65kWIC&pg=PA307&lpg=PA307&dq=twmv&source=bl&ots=NhoAvNllMk&sig=sfbXmMRBBxoXOQax_9KZDpHewa8&hl=en&sa=X&ved=0ahUKEwjFvYnxwZHbAhUqCMAKHXlBCukQ6AEISDAL#v=onepage&q=twmv&f=false
- k-modes improvements
  https://www.researchgate.net/publication/259741897_Cluster_center_initialization_algorithm_for_K-modes_clustering?ev=prf_pub
- KNIME: To code or not to code?
  https://www.knime.com/blog/to-code-or-not-to-code-is-that-the-question

# Checking TWMV data notes

We know there were 82866 accidents involving two vehicles (see charts):

```
$ q -H -d , "SELECT COUNT(*) FROM ./dftRoadSafety_Accidents_2016.csv WHERE Number_of_Vehicles = 2"
82866
```

14735 'interactions' of two-wheeled vehicles with one another vehicle (but incl both ways!)
14473 if you exclude 'doubles' (where both vehicles were TWMV) = 262


# Weka YouTube

## 1.5 Using a filter

- Remove instances
- Remove attributes to improve performance/increase comprehensibility

## 1.6 Visualising

- Select areas and click 'submit' to exclude others (e.g. to exclude outliers)
- Classification errors - square boxes represent errors
  - click to view (compare with confusion matrix)
  - use supervised attribute AddClassification filter to add class as extra attribute

## 2.1 Evaluation

- UserClassifier - produce a 'perfect' tree (but note that J48 uses a top-down approach)
- Importance of using different data to evaluate model than to train it
- Using percentage spit you should expect variation in results
- WEKA resets RNG before runs to ensure repeatable results
  - Try different values for random seed 2..10
  - Calculate sample mean, variance, stddev
- Classifiers to try: J48, NaiveBayes, IBk, PART
- ZeroR: 'guesses' by looking at most popular class - this gives us a baseline
  - First thing you should do
  - Sometimes baseline might give you best results!
  - Consider whether differences in performance are likely to be significant


## DATA TEA

- Classification (supervised)
  - Use Naive Bayes on maneouvres (will converge with Hill's results for cross-tabulating maneouvres using chi-squared)
  - Mention counting bikes twice here
  - Will predict - given two maneovres will predict severity

- Clustering
  - Convert all categorical attributes that have an ordering to numbers (for ones it makes sense)
  - Extract hour of day
  - Use k-means; scale to 0..1, voroni tesselation
- Further study
  - Subtract map of population/where bikes are registered
