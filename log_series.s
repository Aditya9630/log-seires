     area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function		 
              VLDR.f32 S3, = 1;
       VLDR.f32 S11, =0;	   
       VLDR.f32 S10,= 0 ; S10 --->FINAL ANSWER
       VLDR.f32 S14,= 0.7; ---> x
       VMOV.f32 S8,S14; S8 represents term value initially x
       VMOV.f32 S4,S3;  S4 represents Term  number initially its 1
       VLDR.f32 S2,= 0; S2----> SIGN
       VLDR.f32  S9,= 1 ;   
T1 		VMOV.f32 S9,S4 ; R9--->Count power of x
		VMOV.f32 S8,S14 
		VCMP.f32 S9,S3 ;
T3		VMRS APSR_nzcv,FPSCR
		BLE T2
		VMULGT.F32 S8,S14,S8;
		VSUBGT.F32 S9,S9,S3;
		BGT  
T2		VDIVLE.F32 S8,S8,S4; dividing by term no i.e x^n/n
		VCMPLE.F32 S2,#0 ; R2---->SIGN
		VMRS APSR_nzcv,FPSCR
		ITTE EQ;
		VADDEQ.f32 S10,S8,S10; add if sign in 0
		VMOVEQ.f32 S2,S3; change sign to 1
		VSUBNE.F32 S10,S10,S8;sub if sign is 1
		VMOVNE.f32 S2,S11;change sign to 0
		VADD.F32 S4,S4,S3;incrementing the term 
		B T1 ;
     endfunc
     end
;its a infinite series variefied upto few terms for x=0.7
