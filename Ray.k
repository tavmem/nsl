// scalar ray-tracer
//  http://www.ffconsultancy.com/free/ray_tracer/comparison.html
//  http://ompf.org/ray/sphereflake/#files
//  http://shootout.alioth.debian.org/sandbox/benchmark.php?test=raytracer&lang=all&sort=fullcpu

/ ray_sphere
S:{[r;s]:[0>d:_sqr[s 1]+_sqr[b:v _dot r 1]-v _dot v:s[0]-*r;0i;0>t:b+e:_sqrt d;0i;0<u:b-e;u;t]}

/ unit vector
 U:{x%_sqrt x _dot x}           /orig
/U:{x%_sqrt x _dot x+0* \ x}    /display x

/ intersect (S,U)
I:{[r;h;o]:[~4:*o;:[~S[r;*o]<*h;h;h _f[r]/o 1];~h[0]>l:S[r]o;h;(l;U r[0]-o[0]-l*r 1)]}

/ ray_trace (I)
T:{[r;o;d;z;l]:[0i=*h:I[r;z]o;0.;~0>g:h[1]_dot l;0.;0i=*I[(r[0]+(r[1]**h)+d*h 1;-l);z]o;-g;0.]}

/ inner loop: 0-15 (T,U)
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+4_vs!16}          /orig
/N:{[n;o;i] {x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+4_vs!16}          /no init val
/N:{[n;o;i]0{x+T[(0 0 -4.;U((\ i)+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+4_vs!16}      /copy of orig (show i)
/N:{[n;o;i]0{x+T[(0 0 -4.;U(   i +(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}       /simpler
/N:{[n;o;i]0{x+T[(0 0 -4.;U((\ i)+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}       /show i
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4)-n%2),n,0# \ x);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}    /show x: 4 oc
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4)-n%2),n,0# \ y);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}    /show y: 4 oc
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs(!4), 0# \ n} /show n: 4 oc: 2.0
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs(!4), 0# \ o} /show o: 4 oc:(1 -1 0.0;1.0)  
/N:{[n;o;i]0{x+T[(0 0 -4.;U((\ i)+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+4_vs!16}      /show i: 
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/(0 0;0 1)}         /simpler
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.](-0.2672612 -0.8017837 0.5345225)}/(0 0;0 1)}  /simpler
/N:{[n;o;i]0{x+T[(0 0 -4.;-0.7071068 -0.7071068,2);o;_sqrt 2^-42;0i,,3#0.](-0.2672612 -0.8017837 0.5345225)}/(0 0;0 1)}  /simpler
/N:{[n;o;i]0{x+T[(0 0 -4.;-0.7071068 -0.7071068,2);o;4.768372e-07;0i,,3#0.](-0.2672612 -0.8017837 0.5345225)}/(0 0;0 1)} /same A
/N:{[n;o;i]0{x+T[(0 0 -4.;-0.7071068 -0.7071068,2);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}    /same B
/N:{[n;o;i]0{x+T[(0 0 -4.;-0.7071068 -0.7071068,n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}    /same C
/N:{[n;o;i]0{x+T[(0 0 -4.;-0.8 -.06,n);            o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}    /same D
/N:{[n;o;i]0{x+T[(0 0 -4.;U(0+(0 0%4)-2.0%2),n);   o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}    /same E
/N:{[n;o;i]0{x+T[(0 0 -4.;U(0+(0 1%4)-2.0%2),n);   o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}    /same F
/N:{[n;o;i]0{x+T[(0 0 -4.;U(0+(1 0%4)-2.0%2),n);   o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}    /same G
/N:{[n;o;i]0{x+T[(0 0 -4.;U(0+(1 1%4)-2.0%2),n);   o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}    /same H
/N:{[n;o;i]0{x+T[(0 0 -4.;U((xx::i)+(y%4)-n%2),n); o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+2_vs!4}    /copy of simpler

/ create scene = sphere or (sphere;5-scenes)
C:{[k;c;r]:[k=1;(c;r);((c;r*3);(,(c;r)),C[k-1;;r%2]'+c+-3 3[2_vs 2 3 6 7]*r%_sqrt 12)]}

/ outer loop: nxn -> PGM  (N,C)
/R:{[k;n]"P5\n",(5:n,n),"\n255\n",_ci _.5+15.9375*N[n*1.;C[k;0 -1 0.]1.]'+|@[n _vs!n*n;0;|:]}     /orig
/R:{[k;n]"P5\n",(5:n,n),"\n255\n",_ci _.5+15.9375*N[n*1.;\ C[k;0 -1 0.]1.]'+|@[n _vs!n*n;0;|:]}   /show C res
/R:{[k;n]"P5\n",(5:n,n),"\n255\n",_ci _.5+15.9375*N[n*1.;C[k;0 -1 0.]1.] \ '+|@[n _vs!n*n;0;|:]}     /orig
 R:{[k;n]N[n*1.;C[k;0 -1 0.]1.]'+|@[n _vs!n*n;0;|:]}                                              /just last part

/k:1; n:2; N[n*1.;   (0 -1 0.0;1.0)  ]0    /          res= 0.0
/k:3;      C[k;0 -1 0.]1.                  /          R(orig):large res
/k:1;      C[k;0 -1 0.]1.                  /          R(orig):res= (0 -1 0.0; 1.0)
/k:3; n:2; N[n*1.;   C[k;0 -1 0.]1.  ]0    / R[3]2    R(orig):res= 0.0
/k:1; n:2; N[n*1.;   C[k;0 -1 0.]1.  ]0    / R[1]2    R(orig):res= 0.0
/x:0;   y:0 0; n:2.0; o:(0 -1 0.0;1.0); i:0; x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.
/x:0.0; y:0 1; n:2.0; o:(0 -1 0.0;1.0); i:0; x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.
/x:0.0; y:1 0; n:2.0; o:(0 -1 0.0;1.0); i:0; x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.
/x:0.0; y:1 1; n:2.0; o:(0 -1 0.0;1.0); i:0; x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.


 N:{[n;o;i] {x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+4_vs!16}          /no init val
`
"The result WITHOUT inital value is:"
 k:1; n:2; N[n*1.;   (0 -1 0.0;1.0)  ]0

 N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/+4_vs!16}          /orig
`
"The result WITH initial value is:"
 k:1; n:2; N[n*1.;   (0 -1 0.0;1.0)  ]0