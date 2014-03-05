U:{x%_sqrt x _dot x}                                                                              /k-orig
S:{[r;s]:[0>d:_sqr[s 1]+_sqr[b:v _dot r 1]-v _dot v:s[0]-*r;0i;0>t:b+e:_sqrt d;0i;0<u:b-e;u;t]}   /k-orig
I:{[r;h;o]:[~4:*o;:[~S[r;*o]<*h;h;h _f[r]/o 1];~h[0]>l:S[r]o;h;(l;U r[0]-o[0]-l*r 1)]}            /k-orig
T:{[r;o;d;z;l]:[0i=*h:I[r;z]o;0.;~0>g:h[1]_dot l;0.;0i=*I[(r[0]+(r[1]**h)+d*h 1;-l);z]o;-g;0.]}   /k-orig
V:{(1_|{ _ y % x}[x]\y)!x}                                                                        /kona
N:{[n;o;i]0{x+T[(0 0 -4.;U(i+(y%4.)-n%2.),n);o;_sqrt 2^-42;0i,,3#0.]U -1 -3 2.}/,3 2}             /kona (over ,3 2)
C:{[k;c;r]:[k=1;(c;r);((c;r*3);(,(c;r)),C[k-1;;r%2.]'+c+-3 3[V[2;2 3 6 7]]*r%_sqrt 12)]}          /kona
R:{[k;n]"P5\n",(5:n,n),"\n255\n",_ci _.5+15.9375*N[n*1.;C[k;0 -1 0.]1.]'+|@[+!n,n;0;|:]}          /kona

k:1; n:2; N[n*1.;C[k;0 -1 0.]1.]'(0 0;0 0)   /result should be     0.553329 0.553329 
