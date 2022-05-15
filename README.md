# Predicting Political Ideology of Large Social Media Networks

## Overview
In this project, we examine the effectiveness of node embeddings as features in domain ideology scoring, following the work of Megan et al. [1]. Specifically, we use node2vec [2] to embed a Reddit subreddit-to-domain network and evaluate the downstream performance using Robertson et al.'s [3] ideology scores for common domains as the ground truth. 

Megan et al. [1] compared performance of 5 different network embeddings (DeepWalk, node2vec, LINE, SINE, GraphSAGE) in ideology scoring tasks on both Reddit and Twitter networks. They found that LINE outperformed other methods in domain ideology scoring for the Reddit subreddit-to-domain network. However, only default hyperparameters were evaluated for each embedding method, although some methods require careful tuning to maximize their performance. In particular, we are interested in exploring node2vec's [2] potential to achieve a better performance on this task, since it performs differently with different random walk lengths and exploration-exploitation ratio.

## Experiment Design 

## Repo Structure

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

