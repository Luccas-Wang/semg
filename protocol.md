% Protocol of Work in Takemura Laboratory of Osaka University
% Claudia Sichting

# 2014-02-05

# to big goals

other code: bonato, ramp (mail)
contacting recent researchers

- improving surrounding
    - how u should use it correctly?
- best would be a tool that simulates signal
    - shows results of different algorithms
    - with a click a next signal is generated
    - while that happens a evaluation window appears to show
- average performance per method

# 2014-02-03

- the method AGLRstep implemented by Staude is very robust
- improvement by lookup table does not improve the algorithm

## change in work progress

- planning the next 2 weeks very carefully
- having very small goals that I can reach within a day
- if i can't reach a goal I have to consider a change of plans immediately

## my abilities

- matlab basic coding and plotting
    - simulating step noise signals
    - testing onset time with implem. AGLRstep
    - evaluating AGLRstep with 76000 simulated signals
    - implemented threshold algorithm based on slope of cumsum (bad performance)
- matlab simple GUI programming
- explaining maximum likelihood estimation

- interpretation and understanding problems with paper concerning transformation of formulas to code
- never went deep into code from kuroda

## goals for today

search for other code

so I also have the paper from bonato, statistically based
make a table showing the differences

- videos about log likelihood again
- calculation understanding!
- comparison with code of staude

# categories of semg signal

- time
- variance
- $\mu$
- 

## maybe

- skim over kernel filters

# 2014-01-27

Publication Ethics

# 2014-01-23

For the correct application of onset detection a training signal of the measured movement helps to determine the parameters for the algorithm. Normally these training signals are collected before the actual test

# 2014-01-07

consecutive values!

# 2014-01-06

programming on Test4multipleWithSwich
- no 3 consecutive values

# 2013-12-10

- new on opt-est
- progress on comparison

# 2013-12-02

- add lines theta_a, theta_b and theta_0
- radio buttons link data
- log likelihood

# 2013-11-29

- made matlab GUI to explore graphs

# 2013-11-13

guess i'm stuck on this
- understanding log likelihood
- todo: small research presentation

# 2013-11-19

still the one from before
starting now! *shackin head*


# 2013-11-13

understanding log likelihood
todo: small research presentation

# 2013-11-11

programmed average window function
wrote cheat-sheet

# 2013-11-09

Email Progress Problem

Hi Claudia,

Shall we discuss on Monday?
If you can show something to me, it would be helpful for me to
understand the issues that you have.

Best,
Yoshi


2013/11/9 Claudi <claudia.sichting@uni-weimar.de>:
Dear Kuroda-Sensei,

Sorry for this late e-mail.
I'm having some issues to figure out how to implement the estimators.
I tried by reversing the signal creation process, but I guess, I'm not going anywhere.
It disappoints me, so I feel a lack of motivation .

I created a function taking the variance levels and the signal that is created by simSEMG.
Now i try to write a moving window function over the signal (like a filter) to calculate the log-likelihood ratio. Does that sound promising, or am I missing something? Well, I guess I have to show you on Monday.

Other than that, I would love to turn the signals into sound or try this Muscle Mouse game.
That are only fun ideas and not really relevant research.
I'm looking forward to read the book "Biomechanics and Motor Control of Human Movement" by David A. Winter.
I hope it gives me some insights.

Here some questions and ideas that are crossing my mind:

Is the step-tracking-movement test exciting?
How long takes such a test?
I guess it is a standard test to compare the performance, so changing it would be impossible?
Maybe I could create an interface to make onset time detection easy?
Maybe only improving the process of data gathering?
Last but not least: Could I "play" a little bit with the surface electrodes, to get some hands-on experience?

Sorry for any inconvenience and thanks in advance,
Claudia


# 2013-10-30

If got a goal!

1.  implement \`EstOp\` in matlab

2.  also \`AGLRstep\` and \`AGLRramp\`

3.  compare performance

# 2013-10-29

## matlab

-   still matlab overview (kuroda's research)

-   signal averaging (wiki matlab code)

-   sEMG overview: [](http://www.delsys.com/Attachments\_pdf/WP\_SEMGintro.pdf)

2008ben-itzak 2009botzer

# 2013-10-28

summary of kurodas matlab research question catalog

**my goal out of wich papers** What do I need for this goal?

# 2013-10-15

-   installing mathlab

-   looking at git

-   configuration stuff

-   paper order

# 2013-10-09

## TC3 Algorithm

**Input:** sEMG signal $x_y$

**Output:** onset time of sEMG activity $t_0$ 1. compute quasi tension signal $y_k$

*Input:* from sEMG signal $x_y$

*Output:* compute quasi tension signal $y_k$ 2.

*Input:* from sEMG signal $x_y$

*Output:* compute quasi tension signal $y_k$

# 2013-10-08

What I know till now about electromyography and Joshihiro's Research

Electromyography is used to measure electrical signals to the muscles. These signals are fired before the muscle contracts. This offset is used by Joshihiro to guess wrist movements before they are happening. This is important for real-time interaction with a haptic interface. He proved that before the hand starts to move one can detect a cubic signal growth.

Verläufe von Punkt-zu-Punkt-Bewegungen (8,9,11)

<http://science.howstuffworks.com/prosthetic-limb4.htm>

Because muscles generate small electrical signals when they contract, electrodes placed on the surface of the skin can measure muscle movements. Although no buttons are physically pressed by the muscles in this case, their contractions are detected by the electrodes and then used to control the prosthetic limb -- in a way similar to the switch control method that was just described. Prosthetic limbs that function in this way are called myoelectric.

# 2013-10-06

use cases: prosthesis or *predictive haptic displays*

-   2008 Shenoy `Online Electromyographic Control of a Robotic Prosthesis` - 2012 Kuroda `Prior estimation of motion using recursive perceptron with     sEMG: A case of wrist angle`

Methods for onset detection in sEMG

Threshold-based: *Muscle activation onset* is detected when the *sEMG* signal exceeds critical threshold.

-   1996 Hodges `A comparison of computer-based methods for the determination of     onset of muscle contraction using electromyography`

Statistically optimal decision: it assumes statistical properties of signals, estimates the parameters of the assumed distributions, and detects onset when these parameters change. Comparison:

-   2001 Stande `Onset detection in surface electromyographic signals: a     systematic comparison of methods, Eurasip Journal on Applied` - 2011 Lopez `Surface Electromyographic Onset Detection Based On Statistics and     Information Content` - 2008 Rosa `A novel electromyographic signal     simulator     for muscle contraction studies`

because performance is noise-sensitive - no *appropriate* method

-   During movement, muscles are *recruited* gradually + temporal properties of *recruitment* are expressed in the *sEMG* signal + under a specific movement *sEMG* would reflect its temporal characteristics - method proposed:`robust     real-time sEMG onset detection` by `beginning-of-motion template matching`

Point to point movements:

-   2008 Ben-Itzhak `The Minimum Acceleration with Constraints model [11]     suggests that at the beginning of movement, the third derivative of     position, jerk, changes abruptly from zero to some constant value, resulting     in a position trajectory that can be described as a cubic power of time     after onset.`

Minimum Acceleration Criterion with Constraints Implies Bang-Bang Control as an Underlying Principle for Optimal Trajectories of Arm Reaching Movements \# 2013-10-04

## Prior Estimation of Motion Using Recursive Perceptron with sEMG: A Case of Wrist Angle

[2012kuroda][]

**sEMG** surface electromyography

**sEMG** measures the amount of naturally emitted electrical activity your muscles release when contracting. A dynamic test is performed with EKG stick-on electrodes while the user goes through a series of movements (bending, rotating, flexing, ...). It is a technique for evaluation and recording the electrical activity produced by skeletal muscles. The instrument measures the *electrical potential* generated by muscle cells. The *electrical potential* at a point is the amount of electric potential energy that a unitary point charge would have when located at that point.

# 2013-10-03

## Automatic Cropping Method of Chest Radiographs Based on Adaptive Binarization

[2013imura][]

-   Image Analysis - known processes: adaptive binarization - not sure about use

-   not to much new medical words **future** - improvement of speed and accuracy

    -   other body parts - should be in software soon - radiologist able to identify - else new training data created

# 2013-09-30

## goal finding

-   what do I want to do?

## gesture recognition

[1987zimmerman][]

-   glove for 3d-hand reconstruction - hand position and orientation

**object manipulation**

-   pick up - rotate - throw - squeeze **commands**

-   draw a line - produce a sound - set a color

**signs**

-   *static* victory / peace sign - *dynamic* waving hand

normal mouse interaction:

-   select object - select operation

## timeline

-   now what... ask the Japanese `Tomoki`? - met `Jojo`, a Mongolian guy - ate `Ku`-something Soba... not again - searched features of `Asus Xtion Pro` (`kinect` like camera) - searched paper about gesture recognition (see: material)

  [material \notes-on-real-time-onset-detection-of-surface-electrmyography-in-step-tracking-wrist-movements]:
    ./material/notes-on-real-time-onset-detection-of-surface-electrmyography-in-step-tracking-wrist-movements.pdf
  [2012kuroda]: ./material/2013kuroda-novel-algorithm-for-real-time-onset-detection-of-surface-electrmyography-in-step-tracking-wrist-movements.pdf
  [2013imura]: ./material/2013imura-automatic-cropping-method-of-chest-radiographs-based-on-adaptive-binarization.pdf
  [1987zimmerman]: ./material/gesture-recognition/1987zimmerman-a-hand-gesture-interface-device.pdf
