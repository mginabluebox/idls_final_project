# Predicting Political Ideology of Large Social Media Networks

## Overview 
In this project, we examine the effectiveness of node embeddings as features in domain ideology scoring, following the work of Megan et al. [1]. Specifically, we use node2vec [2] to embed a Reddit subreddit-to-domain network and evaluate the downstream performance using Robertson et al.'s [3] ideology scores for common domains as the ground truth. 

Megan et al. [1] compared performance of 5 different network embeddings (DeepWalk, node2vec, LINE, SINE, GraphSAGE) in ideology scoring tasks on both Reddit and Twitter networks. They found that LINE outperformed other methods in domain ideology scoring for the Reddit subreddit-to-domain network. However, only default hyperparameters were evaluated for each embedding method, although some methods require careful tuning to maximize their performance. In particular, we are interested in exploring node2vec's [2] potential to achieve a better performance on this task, since it performs differently with different random walk lengths and exploration-exploitation ratio.

## Experiment Design 
### Basic Training Framework
- Node2vec is trained unsupervised on the Reddit subreddit to domain dataset. The dataset contains 1,000,161 edges (subreddit-domain pairs) and 300,353 nodes. 
- The downstream task for the embeddings is to predict the ideology of a domain node. We have ideology scores for 9,804 out of domains in the Reddit dataset for evaluation. 
- Following [1], we use domain ideology scores from Robertson et al.'s [3] paper. To monitor the embedding performance on downstream task, we split the evaluation domains into train (64%), validation (16%) and test (20%). 
- In each epoch of training, we train a predictor on train and report the mean squared error on both train and validation. We evaluate Ridge Regression, Random Forest and Gradient Boosting as predictors.

### Experiment Framework
- First, we tune for the best node2vec parameters one by one, controlling for other parameters. We early stop at epoch 30 to trade computation resources per experiment (B) for more experiments (n). The model parameters include p, q (which control how fast the random walk explores and leaves the neighborhood of starting node), and random walk length. We also tune learning rate and batch size.
- With the best performing parameters, we evaluate the effectiveness of data parallelism by measuring training time with 1, 2 and 4 GPUs.
- We obtain the best performing node2vec model by training for a longer epoch (100).
- With the best performing model, we tune the respective parameters for the 3 types of predictors and identify the best predictor. We tune alpha for Ridge, n_estimators for RF, and n_estimator & learning rate for GB.

## Repo Structure
    .
    ├── data                                                          # training and evaluation data
        ├── reddit_index.json                                         # map from domain url to integer index
        ├── reddit_subreddit_to_domain__gt-01-urls.csv                # training network
        └── robertson_et_al.csv                                       # domain ideology scores for use as labels
    ├── data_parallel                                                 # code for data parallel experiments 
        ├── run_[1,2,4]_v100.sbatch                                   # sbatch scripts for submitting jobs on HPC
        ├── reddit.py                                                 # main python script for training 
        └── node2vec_impl_dp.py                                       # data parallel implementation of pytorch geometric node2vec
    ├── predictor_tuning
    
## Examples

## Results
### Hyperparameter Tuning 
### Data Parallellism
### Best Performing Model

## References
[1] Megan A Brown et al. “Network Embedding Methods for Large Networks in Political Science”. In: Available at SSRN 3962536 (2021).

[2] Aditya Grover, Jure Leskovec. "node2vec: Scalable Feature Learning for Networks". KDD : Proceedings. International Conference on Knowledge Discovery & Data Mining. 2016: 855–864. arXiv:1607.00653  (2016)

[3] Ronald E. Robertson et al. “Auditing Partisan Audience Bias within Google Search”. In: Proc. ACM Hum.-Comput. Interact.2.CSCW (Nov. 2018). doi: 10.1145/3274417. url: https://doi.org/10.1145/3274417.

## Contributors 
Charlotte Ji 

Aneri Patel

