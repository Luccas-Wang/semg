# sEMG


This is a repository for notes about my work in Osaka.

My work is about `Surface Electromyography` (sEMG).

## Surface Electromyography sEMG

- electrodes sticking on the skin measure microvolt signals of skeletal muscles over time
- with a muscle contraction a signal increase is measured

## Step-Tracking Wrist Movements

- wrist movements from point-to-point
- muscles involved: ulnar flexor muscle of right arm (flexor carpi ulnaris )
![medical picture of arm muscle positions](http://medimages.hostzi.com/album2/ARTO%20SUPERIORE/Spalla/muscoli%20avambraccio%20gomito.jpg)

## Real Time Onset Detection

- the sEMG signal increase is measured before the movement
- the idea is to detect the beginning of motion with template matching
- the template is a cubic function 
