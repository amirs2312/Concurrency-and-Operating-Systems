#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - writers-and-reader.pml:121 - [printf('A Model of pthreads\\n')] (0:17:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		Printf("A Model of pthreads\n");
		/* merge: printf('\\n Producer-Consumer example\\n')(17, 2, 17) */
		reached[2][2] = 1;
		Printf("\n Producer-Consumer example\n");
		_m = 3; goto P999; /* 1 */
	case 4: // STATE 3 - writers-and-reader.pml:17 - [in = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		(trpt+1)->bup.oval = ((int)now.in);
		now.in = 0;
#ifdef VAR_RANGES
		logval("in", ((int)now.in));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 4 - writers-and-reader.pml:19 - [((in<4))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((int)now.in)<4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 5 - writers-and-reader.pml:19 - [buffer[in] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		(trpt+1)->bup.oval = ((int)now.buffer[ Index(((int)now.in), 4) ]);
		now.buffer[ Index(now.in, 4) ] = 0;
#ifdef VAR_RANGES
		logval("buffer[in]", ((int)now.buffer[ Index(((int)now.in), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 6 - writers-and-reader.pml:19 - [in = (in+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		(trpt+1)->bup.oval = ((int)now.in);
		now.in = (((int)now.in)+1);
#ifdef VAR_RANGES
		logval("in", ((int)now.in));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 8 - writers-and-reader.pml:20 - [in = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		(trpt+1)->bup.oval = ((int)now.in);
		now.in = 0;
#ifdef VAR_RANGES
		logval("in", ((int)now.in));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 13 - writers-and-reader.pml:22 - [out = (4-1)] (0:0:1 - 3)
		IfNotBlocked
		reached[2][13] = 1;
		(trpt+1)->bup.oval = ((int)now.out);
		now.out = (4-1);
#ifdef VAR_RANGES
		logval("out", ((int)now.out));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 14 - writers-and-reader.pml:23 - [bfull = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		(trpt+1)->bup.oval = ((int)now.bfull);
		now.bfull = 0;
#ifdef VAR_RANGES
		logval("bfull", ((int)now.bfull));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 15 - writers-and-reader.pml:23 - [bempty = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][15] = 1;
		(trpt+1)->bup.oval = ((int)now.bempty);
		now.bempty = 1;
#ifdef VAR_RANGES
		logval("bempty", ((int)now.bempty));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 16 - writers-and-reader.pml:24 - [printf('buffer zeroed\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][16] = 1;
		Printf("buffer zeroed\n");
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 18 - writers-and-reader.pml:31 - [printf('@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|',_pid,in,out,bempty,bfull)] (0:26:1 - 1)
		IfNotBlocked
		reached[2][18] = 1;
		Printf("@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|", ((int)((P2 *)_this)->_pid), ((int)now.in), ((int)now.out), ((int)now.bempty), ((int)now.bfull));
		/* merge: six = 0(26, 19, 26) */
		reached[2][19] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = 0;
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[2][27] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 14: // STATE 20 - writers-and-reader.pml:34 - [((six<4))] (26:0:1 - 1)
		IfNotBlocked
		reached[2][20] = 1;
		if (!((((int)now.six)<4)))
			continue;
		/* merge: printf(' %d |',buffer[six])(26, 21, 26) */
		reached[2][21] = 1;
		Printf(" %d |", ((int)now.buffer[ Index(((int)now.six), 4) ]));
		/* merge: six = (six+1)(26, 22, 26) */
		reached[2][22] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = (((int)now.six)+1);
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[2][27] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 15: // STATE 24 - writers-and-reader.pml:35 - [printf(']\\n')] (0:28:0 - 1)
		IfNotBlocked
		reached[2][24] = 1;
		Printf("]\n");
		/* merge: goto :b7(28, 25, 28) */
		reached[2][25] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 16: // STATE 31 - ./pthreads.pml:30 - [mtx.mstate = unlocked] (0:0:1 - 1)
		IfNotBlocked
		reached[2][31] = 1;
		(trpt+1)->bup.oval = now.mtx.mstate;
		now.mtx.mstate = 2;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 32 - ./pthreads.pml:32 - [cvars[0].dummy = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][32] = 1;
		(trpt+1)->bup.oval = ((int)now.cvars[0].dummy);
		now.cvars[0].dummy = 0;
#ifdef VAR_RANGES
		logval("cvars[0].dummy", ((int)now.cvars[0].dummy));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 33 - ./pthreads.pml:33 - [cvars[1].dummy = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][33] = 1;
		(trpt+1)->bup.oval = ((int)now.cvars[1].dummy);
		now.cvars[1].dummy = 0;
#ifdef VAR_RANGES
		logval("cvars[1].dummy", ((int)now.cvars[1].dummy));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 35 - writers-and-reader.pml:126 - [(run producer(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][35] = 1;
		if (!(addproc(II, 1, 0, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 36 - writers-and-reader.pml:127 - [(run producer(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][36] = 1;
		if (!(addproc(II, 1, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 37 - writers-and-reader.pml:128 - [(run consumer())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][37] = 1;
		if (!(addproc(II, 1, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 38 - writers-and-reader.pml:129 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][38] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC consumer */
	case 23: // STATE 1 - ./pthreads.pml:41 - [((mtx.mstate==unlocked))] (6:0:2 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((now.mtx.mstate==2)))
			continue;
		/* merge: printf('@@@ %d LOCKING : state is %e\\n',_pid,mtx.mstate)(6, 2, 6) */
		reached[1][2] = 1;
		Printf("@@@ %d LOCKING : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		/* merge: mtx.mstate = locked(6, 3, 6) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.mtx.mstate;
		now.mtx.mstate = 1;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: mtx.mid = _pid(6, 4, 6) */
		reached[1][4] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.mtx.mid);
		now.mtx.mid = ((int)((P1 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 24: // STATE 6 - ./pthreads.pml:42 - [printf('@@@ %d LOCKED : state is %e\\n',_pid,mtx.mstate)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		Printf("@@@ %d LOCKED : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 8 - writers-and-reader.pml:97 - [assert((mtx.mid==_pid))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P1 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 9 - writers-and-reader.pml:99 - [(!(bempty))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (!( !(((int)now.bempty))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 12 - ./pthreads.pml:64 - [assert(((mtx.mstate==locked)&&(mtx.mid==_pid)))] (0:22:1 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		spin_assert(((now.mtx.mstate==1)&&(((int)now.mtx.mid)==((int)((P1 *)_this)->_pid))), "((mtx.mstate==1)&&(mtx.mid==_pid))", II, tt, t);
		/* merge: mtx.mstate = unlocked(22, 13, 22) */
		reached[1][13] = 1;
		(trpt+1)->bup.oval = now.mtx.mstate;
		now.mtx.mstate = 2;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: printf('@@@ %d WAIT for cond[%d]=%d with mutex=%e\\n',_pid,1,cvars[1].dummy,mtx.mstate)(22, 14, 22) */
		reached[1][14] = 1;
		Printf("@@@ %d WAIT for cond[%d]=%d with mutex=%e\n", ((int)((P1 *)_this)->_pid), 1, ((int)now.cvars[1].dummy), now.mtx.mstate);
		_m = 3; goto P999; /* 2 */
	case 28: // STATE 16 - ./pthreads.pml:72 - [((cvars[1].dummy==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		if (!((((int)now.cvars[1].dummy)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 17 - ./pthreads.pml:72 - [((mtx.mstate==unlocked))] (24:0:3 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		if (!((now.mtx.mstate==2)))
			continue;
		/* merge: mtx.mstate = locked(24, 18, 24) */
		reached[1][18] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.mtx.mstate;
		now.mtx.mstate = 1;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: mtx.mid = _pid(24, 19, 24) */
		reached[1][19] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.mtx.mid);
		now.mtx.mid = ((int)((P1 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: printf('@@@ %d DONE with cond[%d]=%d with mutex=%e\\n',_pid,1,cvars[1].dummy,mtx.mstate)(24, 20, 24) */
		reached[1][20] = 1;
		Printf("@@@ %d DONE with cond[%d]=%d with mutex=%e\n", ((int)((P1 *)_this)->_pid), 1, ((int)now.cvars[1].dummy), now.mtx.mstate);
		/* merge: cvars[1].dummy = 0(24, 21, 24) */
		reached[1][21] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.cvars[1].dummy);
		now.cvars[1].dummy = 0;
#ifdef VAR_RANGES
		logval("cvars[1].dummy", ((int)now.cvars[1].dummy));
#endif
		;
		/* merge: .(goto)(0, 25, 24) */
		reached[1][25] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 30: // STATE 27 - writers-and-reader.pml:102 - [assert((mtx.mid==_pid))] (0:0:0 - 3)
		IfNotBlocked
		reached[1][27] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P1 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 28 - writers-and-reader.pml:55 - [assert(!(bempty))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][28] = 1;
		spin_assert( !(((int)now.bempty)), " !(bempty)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 29 - writers-and-reader.pml:56 - [out = ((out+1)%4)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][29] = 1;
		(trpt+1)->bup.oval = ((int)now.out);
		now.out = ((((int)now.out)+1)%4);
#ifdef VAR_RANGES
		logval("out", ((int)now.out));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 30 - writers-and-reader.pml:57 - [cout = buffer[out]] (0:0:1 - 1)
		IfNotBlocked
		reached[1][30] = 1;
		(trpt+1)->bup.oval = ((int)cout);
		cout = ((int)now.buffer[ Index(((int)now.out), 4) ]);
#ifdef VAR_RANGES
		logval("cout", ((int)cout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 31 - writers-and-reader.pml:57 - [buffer[out] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][31] = 1;
		(trpt+1)->bup.oval = ((int)now.buffer[ Index(((int)now.out), 4) ]);
		now.buffer[ Index(now.out, 4) ] = 0;
#ifdef VAR_RANGES
		logval("buffer[out]", ((int)now.buffer[ Index(((int)now.out), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 32 - writers-and-reader.pml:58 - [printf('@@@ %d **** EXTRACT cout := buf[%d] is %d\\n',_pid,out,cout)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][32] = 1;
		Printf("@@@ %d **** EXTRACT cout := buf[%d] is %d\n", ((int)((P1 *)_this)->_pid), ((int)now.out), ((int)cout));
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 33 - writers-and-reader.pml:59 - [bfull = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][33] = 1;
		(trpt+1)->bup.oval = ((int)now.bfull);
		now.bfull = 0;
#ifdef VAR_RANGES
		logval("bfull", ((int)now.bfull));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 34 - writers-and-reader.pml:60 - [bempty = (((out+1)%4)==in)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][34] = 1;
		(trpt+1)->bup.oval = ((int)now.bempty);
		now.bempty = (((((int)now.out)+1)%4)==((int)now.in));
#ifdef VAR_RANGES
		logval("bempty", ((int)now.bempty));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 35 - writers-and-reader.pml:31 - [printf('@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|',_pid,in,out,bempty,bfull)] (0:43:1 - 1)
		IfNotBlocked
		reached[1][35] = 1;
		Printf("@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|", ((int)((P1 *)_this)->_pid), ((int)now.in), ((int)now.out), ((int)now.bempty), ((int)now.bfull));
		/* merge: six = 0(43, 36, 43) */
		reached[1][36] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = 0;
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 44, 43) */
		reached[1][44] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 39: // STATE 37 - writers-and-reader.pml:34 - [((six<4))] (43:0:1 - 1)
		IfNotBlocked
		reached[1][37] = 1;
		if (!((((int)now.six)<4)))
			continue;
		/* merge: printf(' %d |',buffer[six])(43, 38, 43) */
		reached[1][38] = 1;
		Printf(" %d |", ((int)now.buffer[ Index(((int)now.six), 4) ]));
		/* merge: six = (six+1)(43, 39, 43) */
		reached[1][39] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = (((int)now.six)+1);
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 44, 43) */
		reached[1][44] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 40: // STATE 41 - writers-and-reader.pml:35 - [printf(']\\n')] (0:45:0 - 1)
		IfNotBlocked
		reached[1][41] = 1;
		Printf("]\n");
		/* merge: goto :b5(45, 42, 45) */
		reached[1][42] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 41: // STATE 49 - ./pthreads.pml:84 - [printf('@@@ %d SIGNAL cond[%d]=%d\\n',_pid,0,cvars[0].dummy)] (0:54:1 - 1)
		IfNotBlocked
		reached[1][49] = 1;
		Printf("@@@ %d SIGNAL cond[%d]=%d\n", ((int)((P1 *)_this)->_pid), 0, ((int)now.cvars[0].dummy));
		/* merge: cvars[0].dummy = 1(54, 50, 54) */
		reached[1][50] = 1;
		(trpt+1)->bup.oval = ((int)now.cvars[0].dummy);
		now.cvars[0].dummy = 1;
#ifdef VAR_RANGES
		logval("cvars[0].dummy", ((int)now.cvars[0].dummy));
#endif
		;
		/* merge: printf('@@@ %d SIGNALLED cond[%d]=%d\\n',_pid,0,cvars[0].dummy)(54, 51, 54) */
		reached[1][51] = 1;
		Printf("@@@ %d SIGNALLED cond[%d]=%d\n", ((int)((P1 *)_this)->_pid), 0, ((int)now.cvars[0].dummy));
		_m = 3; goto P999; /* 2 */
	case 42: // STATE 54 - writers-and-reader.pml:106 - [assert((mtx.mid==_pid))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][54] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P1 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 55 - ./pthreads.pml:49 - [printf('@@@ %d UNLOCKING : state is %e\\n',_pid,mtx.mstate)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][55] = 1;
		Printf("@@@ %d UNLOCKING : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 56 - ./pthreads.pml:52 - [((((mtx.mid==_pid)&&mtx.mstate)==locked))] (63:0:2 - 1)
		IfNotBlocked
		reached[1][56] = 1;
		if (!((((((int)now.mtx.mid)==((int)((P1 *)_this)->_pid))&&now.mtx.mstate)==1)))
			continue;
		/* merge: mtx.mstate = unlocked(63, 57, 63) */
		reached[1][57] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.mtx.mstate;
		now.mtx.mstate = 2;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: mtx.mid = 255(63, 58, 63) */
		reached[1][58] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.mtx.mid);
		now.mtx.mid = 255;
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: printf('@@@ %d UNLOCKED : state is %e\\n',_pid,mtx.mstate)(63, 59, 63) */
		reached[1][59] = 1;
		Printf("@@@ %d UNLOCKED : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		/* merge: .(goto)(0, 64, 63) */
		reached[1][64] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 45: // STATE 66 - writers-and-reader.pml:114 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][66] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC producer */
	case 46: // STATE 1 - ./pthreads.pml:41 - [((mtx.mstate==unlocked))] (6:0:2 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((now.mtx.mstate==2)))
			continue;
		/* merge: printf('@@@ %d LOCKING : state is %e\\n',_pid,mtx.mstate)(6, 2, 6) */
		reached[0][2] = 1;
		Printf("@@@ %d LOCKING : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		/* merge: mtx.mstate = locked(6, 3, 6) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.mtx.mstate;
		now.mtx.mstate = 1;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: mtx.mid = _pid(6, 4, 6) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.mtx.mid);
		now.mtx.mid = ((int)((P0 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 47: // STATE 6 - ./pthreads.pml:42 - [printf('@@@ %d LOCKED : state is %e\\n',_pid,mtx.mstate)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		Printf("@@@ %d LOCKED : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 48: // STATE 8 - writers-and-reader.pml:69 - [assert((mtx.mid==_pid))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P0 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 49: // STATE 9 - writers-and-reader.pml:71 - [(!(bfull))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!( !(((int)now.bfull))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 12 - ./pthreads.pml:64 - [assert(((mtx.mstate==locked)&&(mtx.mid==_pid)))] (0:22:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		spin_assert(((now.mtx.mstate==1)&&(((int)now.mtx.mid)==((int)((P0 *)_this)->_pid))), "((mtx.mstate==1)&&(mtx.mid==_pid))", II, tt, t);
		/* merge: mtx.mstate = unlocked(22, 13, 22) */
		reached[0][13] = 1;
		(trpt+1)->bup.oval = now.mtx.mstate;
		now.mtx.mstate = 2;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: printf('@@@ %d WAIT for cond[%d]=%d with mutex=%e\\n',_pid,0,cvars[0].dummy,mtx.mstate)(22, 14, 22) */
		reached[0][14] = 1;
		Printf("@@@ %d WAIT for cond[%d]=%d with mutex=%e\n", ((int)((P0 *)_this)->_pid), 0, ((int)now.cvars[0].dummy), now.mtx.mstate);
		_m = 3; goto P999; /* 2 */
	case 51: // STATE 16 - ./pthreads.pml:72 - [((cvars[0].dummy==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (!((((int)now.cvars[0].dummy)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 52: // STATE 17 - ./pthreads.pml:72 - [((mtx.mstate==unlocked))] (24:0:3 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (!((now.mtx.mstate==2)))
			continue;
		/* merge: mtx.mstate = locked(24, 18, 24) */
		reached[0][18] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.mtx.mstate;
		now.mtx.mstate = 1;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: mtx.mid = _pid(24, 19, 24) */
		reached[0][19] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.mtx.mid);
		now.mtx.mid = ((int)((P0 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: printf('@@@ %d DONE with cond[%d]=%d with mutex=%e\\n',_pid,0,cvars[0].dummy,mtx.mstate)(24, 20, 24) */
		reached[0][20] = 1;
		Printf("@@@ %d DONE with cond[%d]=%d with mutex=%e\n", ((int)((P0 *)_this)->_pid), 0, ((int)now.cvars[0].dummy), now.mtx.mstate);
		/* merge: cvars[0].dummy = 0(24, 21, 24) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.cvars[0].dummy);
		now.cvars[0].dummy = 0;
#ifdef VAR_RANGES
		logval("cvars[0].dummy", ((int)now.cvars[0].dummy));
#endif
		;
		/* merge: .(goto)(0, 25, 24) */
		reached[0][25] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 53: // STATE 27 - writers-and-reader.pml:74 - [assert((mtx.mid==_pid))] (0:0:0 - 3)
		IfNotBlocked
		reached[0][27] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P0 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 28 - writers-and-reader.pml:43 - [assert(!(bfull))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][28] = 1;
		spin_assert( !(((int)now.bfull)), " !(bfull)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 55: // STATE 29 - writers-and-reader.pml:44 - [buffer[in] = (p+pno)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][29] = 1;
		(trpt+1)->bup.oval = ((int)now.buffer[ Index(((int)now.in), 4) ]);
		now.buffer[ Index(now.in, 4) ] = (((P0 *)_this)->p+((P0 *)_this)->pno);
#ifdef VAR_RANGES
		logval("buffer[in]", ((int)now.buffer[ Index(((int)now.in), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 56: // STATE 30 - writers-and-reader.pml:45 - [printf('@@@ %d INSERT buf[%d] := %d\\n',_pid,in,(p+pno))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		Printf("@@@ %d INSERT buf[%d] := %d\n", ((int)((P0 *)_this)->_pid), ((int)now.in), (((P0 *)_this)->p+((P0 *)_this)->pno));
		_m = 3; goto P999; /* 0 */
	case 57: // STATE 31 - writers-and-reader.pml:46 - [bempty = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][31] = 1;
		(trpt+1)->bup.oval = ((int)now.bempty);
		now.bempty = 0;
#ifdef VAR_RANGES
		logval("bempty", ((int)now.bempty));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 58: // STATE 32 - writers-and-reader.pml:47 - [bfull = (in==out)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][32] = 1;
		(trpt+1)->bup.oval = ((int)now.bfull);
		now.bfull = (((int)now.in)==((int)now.out));
#ifdef VAR_RANGES
		logval("bfull", ((int)now.bfull));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 59: // STATE 33 - writers-and-reader.pml:48 - [in = ((in+1)%4)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][33] = 1;
		(trpt+1)->bup.oval = ((int)now.in);
		now.in = ((((int)now.in)+1)%4);
#ifdef VAR_RANGES
		logval("in", ((int)now.in));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 60: // STATE 34 - writers-and-reader.pml:31 - [printf('@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|',_pid,in,out,bempty,bfull)] (0:42:1 - 1)
		IfNotBlocked
		reached[0][34] = 1;
		Printf("@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|", ((int)((P0 *)_this)->_pid), ((int)now.in), ((int)now.out), ((int)now.bempty), ((int)now.bfull));
		/* merge: six = 0(42, 35, 42) */
		reached[0][35] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = 0;
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 43, 42) */
		reached[0][43] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 61: // STATE 36 - writers-and-reader.pml:34 - [((six<4))] (42:0:1 - 1)
		IfNotBlocked
		reached[0][36] = 1;
		if (!((((int)now.six)<4)))
			continue;
		/* merge: printf(' %d |',buffer[six])(42, 37, 42) */
		reached[0][37] = 1;
		Printf(" %d |", ((int)now.buffer[ Index(((int)now.six), 4) ]));
		/* merge: six = (six+1)(42, 38, 42) */
		reached[0][38] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = (((int)now.six)+1);
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 43, 42) */
		reached[0][43] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 62: // STATE 40 - writers-and-reader.pml:35 - [printf(']\\n')] (0:44:0 - 1)
		IfNotBlocked
		reached[0][40] = 1;
		Printf("]\n");
		/* merge: goto :b2(44, 41, 44) */
		reached[0][41] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 63: // STATE 48 - ./pthreads.pml:84 - [printf('@@@ %d SIGNAL cond[%d]=%d\\n',_pid,1,cvars[1].dummy)] (0:53:1 - 1)
		IfNotBlocked
		reached[0][48] = 1;
		Printf("@@@ %d SIGNAL cond[%d]=%d\n", ((int)((P0 *)_this)->_pid), 1, ((int)now.cvars[1].dummy));
		/* merge: cvars[1].dummy = 1(53, 49, 53) */
		reached[0][49] = 1;
		(trpt+1)->bup.oval = ((int)now.cvars[1].dummy);
		now.cvars[1].dummy = 1;
#ifdef VAR_RANGES
		logval("cvars[1].dummy", ((int)now.cvars[1].dummy));
#endif
		;
		/* merge: printf('@@@ %d SIGNALLED cond[%d]=%d\\n',_pid,1,cvars[1].dummy)(53, 50, 53) */
		reached[0][50] = 1;
		Printf("@@@ %d SIGNALLED cond[%d]=%d\n", ((int)((P0 *)_this)->_pid), 1, ((int)now.cvars[1].dummy));
		_m = 3; goto P999; /* 2 */
	case 64: // STATE 53 - writers-and-reader.pml:78 - [assert((mtx.mid==_pid))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][53] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P0 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 65: // STATE 54 - ./pthreads.pml:49 - [printf('@@@ %d UNLOCKING : state is %e\\n',_pid,mtx.mstate)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][54] = 1;
		Printf("@@@ %d UNLOCKING : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 66: // STATE 55 - ./pthreads.pml:52 - [((((mtx.mid==_pid)&&mtx.mstate)==locked))] (63:0:3 - 1)
		IfNotBlocked
		reached[0][55] = 1;
		if (!((((((int)now.mtx.mid)==((int)((P0 *)_this)->_pid))&&now.mtx.mstate)==1)))
			continue;
		/* merge: mtx.mstate = unlocked(63, 56, 63) */
		reached[0][56] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.mtx.mstate;
		now.mtx.mstate = 2;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: mtx.mid = 255(63, 57, 63) */
		reached[0][57] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.mtx.mid);
		now.mtx.mid = 255;
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: printf('@@@ %d UNLOCKED : state is %e\\n',_pid,mtx.mstate)(63, 58, 63) */
		reached[0][58] = 1;
		Printf("@@@ %d UNLOCKED : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		/* merge: p = ((p+2)%8)(63, 62, 63) */
		reached[0][62] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->p;
		((P0 *)_this)->p = ((((P0 *)_this)->p+2)%8);
#ifdef VAR_RANGES
		logval("producer:p", ((P0 *)_this)->p);
#endif
		;
		/* merge: .(goto)(0, 64, 63) */
		reached[0][64] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 67: // STATE 66 - writers-and-reader.pml:91 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][66] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

