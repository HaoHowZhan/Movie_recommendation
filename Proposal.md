Also available in
<a href="https://docs.google.com/document/d/110yPmJoNke28D6c9xQQpSHwOgi7fKRKA4LKcMNl0Z70/">Google Docs</a>

Project presentation in <a href="https://docs.google.com/presentation/d/1N6QNuUNMGp3I7v9GrSEZg01742ASuTnYSRyvAYJRfoM/edit?usp=sharing">Google Slides</a>

Project presentation script in <a href="https://docs.google.com/document/d/1YjZDlltbpcWSE2YjnmCCjqqEZ04ZlB7bU_IVPtddAV0/edit">Google Docs</a>

# Proposal for Math 571

Bozhou Chen             b\*\*\*7@hawk.iit.edu

Hao Zhan                 h\*\*\*4@hawk.iit.edu

Xiangyu Zhao             x\*\*\*5@hawk.iit.edu

## Introduction

Recommendation systems are active area of research in artificial intelligence. The algorithms of recommendation systems are based on machine learning. Data mining algorithms extract knowledge from unstructured data, for example collaborative filtering, content filtering, association rules, and clustering. Movie recommendation is one of the specific application of that.

## State of Problem & Plan

Recommendation is widely used by many kinds of websites such as Amazon,Facebook etc. 

We group members are more interested in movies, thus we would like to make efforts on how to build a model by using data sets from movie audience and collected features from movie website.We are focused on two possible types of models.

* One of our possible model is **movie recommendation model** based on users’ previous rates,tags or other metrics of movies they have watched. 
* Another model is the one which describes how to produce a new movie that would be highly likely successful after training data sets of movies from top to bottom of ranking according to their actors, director,themes,plots and etc, we want to find potential relationship between  movie ratings and movies’ possible features. 

## Data Set

Our preliminary data set may be from the website with this link: http://grouplens.org/datasets/movielens/20m/.

But there is a low of data points and not a lot of explanatory variables, so we need to supplement from other data sources.

Additional information may be necessary, thus we may use some applicable APIs to collect necessary data sets from other website such as IMDB. http://www.imdb.com/


## Project Objectives

* Know well about the whole process of data mining,modeling and data analysis.
* Successfully build the movie recommendation model with satisfying outcomes.
* To know how to manage the data analysis project & control the process within schedule.

## KPI we’ll use

To make our project under schedule, our team created plan on Asana and would like to share ideas and progress on Github.

Asana

<https://app.asana.com/0/530285168250295/544940434897027/f>

Github

<https://github.com/HaoHowZhan/MATH571Project>

## Data Preparation

* Combine data tables
  
  Our datasets include different tables which should be combined or merged based on particular attribute.(e.g User Table & Movie Feature Table)

* Look for errors
  
  Dealing with invalid values or missing values is also necessary

* Transform data
  
  Some of the variables in our models should be numeric, so we have to transform categorical features into dummy variables. 

* Segment data

  To avoid overfitting, we should divide our model into two parts, one as training sets, the other as testing sets.

## Project Objectives

* To know well about the whole process of data mining,modeling and data analysis.

* To Successfully build the movie recommendation model with satisfying outcomes.

* To know how to manage the data analysis project & control the process within schedule.

## Final Deliverables

Our project’s final deliverables will be showed like following format:

* Report of project process, including what algorithms we used, how to finish each step such as data collecting & data cleaning & adjustment of model & final test of model.

* A small website  to demo how our model performs by receiving data input from users and return the outcome.
