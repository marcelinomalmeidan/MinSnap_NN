# MinSnap_NN
Neural networks trained to guess time allocations for minimum snap problems

The nnet_dts.m file takes as inputs a vector of ranges and angles in the form:

```
v = [range1;
     angle1;
     range2;
     angle2;
     ...
     rangeN;
     angleN];
```

The function nnet_dts return a set of time allocations:

```
dt_out = [dt1;
          dt2;
          ...
          dt(N-1)];
```

These time allocations can be used with minimum snap algorithms as an initial guess for the optimal time allocations, instead of using 
standard time-consuming gradient descents.
