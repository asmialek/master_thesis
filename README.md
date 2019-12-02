# Bryson First Chapter

## Differential equations:
`differential_systems\translational_motion.m` is composed from Bryson equations (1.12) and (1.13). That makes a following linear system:
\[
\ \begin{bmatrix}  \delta\dot{u} \\ \delta\dot{v} \\ \delta\dot{w} \\ \delta\dot{x} \\ \delta\dot{y} \\ \delta\dot{z} \end{bmatrix}
\ =
\ \begin{bmatrix}
\ 0 & 0 & 0 & -n^2 & 0 & 0 \\
\ 0 & 0 & 0 & 0 & -n&2 & 0 \\
\ -n & 0 & 0 & 0 & 0 & 2n^2 \\
\ 1 & 0 & 0 & 0 & 0 & 0 \\
\ 0 & 1 & 0 & 0 & 0 & 0 \\
\ 0 & 0 & 1 & -1 & 0 & 0
\ \end{bmatrix}
\ \begin{bmatrix}  \delta u \\ \delta v \\ \delta w \\ \delta x \\ \delta y \\ \delta z \end{bmatrix}
\ +
\ \begin{bmatrix}
\ T_x/m \\
\ T_y/m \\
\ T_z/m \\
\ 0 \\
\ 0 \\
\ 0
\ \end{bmatrix}
\]
`differential_systems\rotational_motion.m` Is composed from  Bryson (1.19)-(1.21) and transformed (1.37), which assuming that (1.37) can be rewritten as:
\[
\ \begin{bmatrix}
\ p \\
\ q \\
\ r
\ \end{bmatrix}
\ =
\ G
\ \begin{bmatrix}
\ \dot{\Phi} \\
\ \dot{\Theta} \\
\ \dot{\Psi}
\ \end{bmatrix} - Fn
\]   
which after transformation gives:
\[
\ \begin{bmatrix}
\ \dot{\Phi} \\
\ \dot{\Theta} \\
\ \dot{\Psi}
\ \end{bmatrix}
\ =
\ G^{-1}\left(
\ \begin{bmatrix}
\ p \\
\ q \\
\ r
\ \end{bmatrix}
\ - Fn\right)
\]
so rotational motion is in the end described with:
\[
\ \begin{bmatrix}
\ \dot{p} \\
\ \dot{q} \\
\ \dot{r} \\
\ \dot{\Phi} \\
\ \dot{\Theta} \\
\ \dot{\Psi}
\ \end{bmatrix}
\ =
\ \begin{bmatrix}
\ 1/I_x & 0 & 0 \\
\  0 & 1/I_y & 0 \\
\  0 & 0 & 1/I_x \\
\ & G^{-1}\left(
\ \begin{bmatrix}
\ p \\
\ q \\
\ r
\ \end{bmatrix}
\ - Fn\right)
\ \end{bmatrix}
\]



.

.
## Project
Everything can be opened by opening `master_thesis_matlab.prj` in MATLAB, as it adds required paths to matpath. As far as I know, `bryson_first_chapter.m` also does that, if run from it's folder (at least on my machine).

## Scripts and simulations
`bryson_first_chapter.m` is a script for setup of simulation and runs a numerical integration for both translational and rotational motion - with only first element of the input vector set up to unit step.

`sim_first_chapter.slx` does the same, but as a Simulink simulation, for manipulation of input signals.

## Comments
I am not sure whether I have used correct system for rotational motions, but as translational is set for circular orbit, that's what I have found for rotational. I want to read a bit more into following chapters and I will do that over the next few days.

