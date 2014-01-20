// scalar ray-tracer
//  http://www.ffconsultancy.com/free/ray_tracer/comparison.html
//  http://ompf.org/ray/sphereflake/#files
//  http://shootout.alioth.debian.org/sandbox/benchmark.php?test=raytracer&lang=all&sort=fullcpu

/ ray_sphere
 S:{[r;s]:[0>d:_sqr[s 1]+_sqr[b:v _dot r 1]-v _dot v:s[0]-*r;0i;0>t:b+e:_sqrt d;0i;0<u:b-e;u;t]}  /orig

/ unit vector
 U:{x%_sqrt x _dot x}               /orig
/U:{x}

/ intersect (S,U)
 I:{[r;h;o]:[~4:*o;:[~S[r;*o]<*h;h;h _f[r]/o 1];~h[0]>l:S[r]o;h;(l;U r[0]-o[0]-l*r 1)]}   /orig
 I:{[r;h;o]:[~4:*o;:[~S[r;*o]<*h;h;h _f[r]/o 1];~h[0]>l:S[r]o;h;(l;U r[0]-o[0]-l*r 1)]}   /orig

/ ray_trace (I)
 T:{[r;o;d;z;l]:[0i=*h:I[r;z]o;0.;~0>g:h[1]_dot l;0.;0i=*I[(r[0]+(r[1]**h)+d*h 1;-l);z]o;-g;0.]}   /orig

/ inner loop: 0-15 (T,U)
 N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!4 4}       /orig
/N:{[n;o;i] {x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!4 4}       /no init value
/N:{[n;o;i]0{x+T[(0 0 -4.;U((*xx::i,xx)+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!4 4} /i is _n (capture)
/N:{[n;o;i] {x+T[(0 0 -4.;U((*xx::i,xx)+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!4 4} /capture (no init value)
/N:{[n;o;i] {x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!4 4}       /no caputure
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!2 2}       /simpler
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4.)-n%2.),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!2 2}     /overloaded
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4.)-n%2.),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/(0 0;0 1)}  /only-2
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4.)-n%2.),n);     o;4.768372e-07;0i,,3#0.](-0.2672612 -0.8017837 0.5345225)}/(0 0;0 1)} /rm U
/N:{[n;o;i]0{x+T[(0 0 -4.;-0.7071068 -0.7071068,2);o;4.768372e-07;0i,,3#0.](-0.2672612 -0.8017837 0.5345225)}/(0 0;0 1)} /same A
/N:{[n;o;i]0{x+T[(0 0 -4.;-0.7071068 -0.7071068,2);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!2 2} /same B
/N:{[n;o;i]0{x+T[(0 0 -4.;-0.7071068 -0.7071068,n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!2 2} /same C
/N:{[n;o;i]0{x+T[(0 0 -4.;-0.8 -0.6,n);            o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!2 2} /same D
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(0 0%4.)-n%2.),n);   o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!2 2} /same E
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(0 1%4.)-n%2.),n);   o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!2 2} /same F
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(1 0%4.)-n%2.),n);   o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!2 2} /same G
/N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(1 1%4.)-n%2.),n);   o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!2 2} /same H
/N:{[n;o;i]0{x+T[(0 0 -4.;U((xx::1 0)+(y  %4.)-n%2.),n);   o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!2 2} /replace i with 1 0

/ vsprime
 V:{(1_|{ _ y % x}[x]\y)!x}

/ create scene = sphere or (sphere;5-scenes)  (V)
 C:{[k;c;r]:[k=1;(c;r);((c;r*3);(,(c;r)),C[k-1;;r%2]'+c+-3 3[V[2;2 3 6 7]]*r%_sqrt 12)]}

/ outer loop: nxn -> PGM  (N,C)
 R:{[k;n]"P5\n",(5:n,n),"\n255\n",_ci _.5+15.9375*N[n*1.;C[k;0 -1 0.]1.]'+|@[!n,n;0;|:]}  /orig
/R:{[k;n]N[n*1.;C[k;0 -1 0.]1.]'+|@[!n,n;0;|:]}  / just the last part

/xx:0; k:1; n:2; N[n*1.;   (0 -1 0.0;1.0)  ]0    / type
/k:3;      C[k;0 -1 0.]1.   /ok ok
/k:1;      C[k;0 -1 0.]1.   /ok ok  res= (0 -1 0.0; 1.0)
/k:3; n:2; N[n*1.;   C[k;0 -1 0.]1.  ]0    / R[3]2   type type
/k:1; n:2; N[n*1.;   C[k;0 -1 0.]1.  ]0    / R[1]2   type type
/x:0;   y:0 0; n:2.0; o:(0 -1 0.0;1.0); i:0; x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.   /ok ok
/x:0.0; y:0 1; n:2.0; o:(0 -1 0.0;1.0); i:0; x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.   /ok ok
/x:0.0; y:1 0; n:2.0; o:(0 -1 0.0;1.0); i:0; x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.   /ok ok
/x:0.0; y:1 1; n:2.0; o:(0 -1 0.0;1.0); i:0; x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.   /ok ok

/ 1st res is with orig R and N
/ 2nd res (same: ok or type) is with simpler R and N

/N:{[n;o;i] {x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!4 4}       /no init value
/N:{[n;o;i] {x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/(3 1;3 0;3 2;3 3)}
/N:{[n;o;i] {(*xx::x,xx)+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/(3 1;3 2)}
/N:{[n;o;i] {x+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.](-0.2672612 -0.8017837 0.5345225)}/(3 1;3 2)}
/N:{[n;o;i] {(*xx::x,xx)+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.](-0.2672612 -0.8017837 0.5345225)}/(3 1;3 2)}
/N:{[n;o;i] {(*xx::x,xx)+T[(0 0 -4.;U(i+(y%4)-n%2),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/!4 4}

/"The result WITHOUT initial value is:"
/k:1; n:2; xx:99; N[n*1.;   (0 -1 0.0;1.0)  ]0

/r:(0 0 -4.0;-0.4082483 -0.4082483 0.8164966); o:(0 -1 0.0;1.0); d:4.768372e-07; z:(0i;0 0 0.0); l:-0.2672612 -0.8017837 0.5345225
/r:(0 0 -4.0;-0.1230915 -0.1230915 0.9867319); o:(0 -1 0.0;1.0); d:4.768372e-07; z:(0i;0 0 0.0); l:-0.2672612 -0.8017837 0.5345225
/{[r;o;d;z;l]:[0i=*h:I[r;z]o;0.;~0>g:h[1]_dot l;0.;0i=*I[(r[0]+(r[1]**h)+d*h 1;-l);z]o;-g;0.]}[r;o;d;z;l]

 r:(0 0 -4.0;-0.1230915 -0.1230915 0.9867319); o:(0 -1 0.0;1.0); h:(0i;0 0 0.0);                       /I diff
 {[r;h;o]:[~4:*o;:[~S[r;*o]<*h;h;h _f[r]/o 1];~h[0]>l:S[r]o;h;(l;U r[0]-o[0]-l*r 1)]}[r;h;o]

/x:-0.4084567 0.5915433 -0.7257104                                                                     /U ok
/{x%_sqrt x _dot x}x

/r:(0 0 -4.0;-0.1230915 -0.1230915 0.9867319); s:(0 -1 0.0;1.0);                                       /S ok
/{[r;s]:[0>d:_sqr[s 1]+_sqr[b:v _dot r 1]-v _dot v:s[0]-*r;0i;0>t:b+e:_sqrt d;0i;0<u:b-e;u;t]}[r;s]

/ I:{[r;h;o]:[~4:*o;                   /cond1             0
/               :[~S[r;*o]<*h;         /true1   cond1a
/                   h;                 /        true1a
/                   h _f[r]/o 1];      /        false1a
/               ~h[0]>l:S[r]o;         /cond2             1
/               h;                     /true2             (0i;0 0 0.0)
/               (l;U r[0]-o[0]-l*r 1)  /false             
/            ]
/   }[r;h;o]   /orig

/ S:{[r;s]:[0>d:_sqr[s 1]+_sqr[b:v _dot r 1]-v _dot v:s[0]-*r;    /cond1
/             0i;                                                 /true1
/             0>t:b+e:_sqrt d;                                    /cond2
/             0i;                                                 /true2
/             0<u:b-e;                                            /cond3
/             u;                                                  /true3
/             t                                                   /false
/          ]
/   }      /orig