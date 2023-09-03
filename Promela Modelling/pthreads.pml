// pthreads.pml

// Task: modify lock, unlock, wait and signal to do the correct thing.

// Saad Amir 20334372

byte g = 0;

mtype = { unlocked, locked } ;

typedef mutexData {
  mtype mstate;
  byte mid;
  
}


typedef condvarData {
  bool dummy;
  
}

mutexData mtx;

condvarData cvars[2];
#define PRODCONDVAR 0
#define CONSCONDVAR 1

inline initsync() {
  mtx.mstate = unlocked;
  
  cvars[0].dummy = false;
  cvars[1].dummy = false;
  
}

// pthread_mutex_lock(&m);
inline lock(mutex) {
  // I moved around a lot of print statements to clean up the
  
  atomic{(mutex.mstate == unlocked) -> printf("@@@ %d LOCKING : state is %e\n",_pid,mutex.mstate) -> mutex.mstate = locked -> mutex.mid = _pid}
  printf("@@@ %d LOCKED : state is %e\n",_pid,mutex.mstate)
}

// pthread_mutex_unlock(&m);
inline unlock(mutex) {
  
  atomic{
    printf("@@@ %d UNLOCKING : state is %e\n",_pid,mutex.mstate);
    // Make sure that the process trying to unlock has the lock in the first place
    // Then also check that the mutex trying to be unlocked was locked beforehand
    (mutex.mid == _pid && mutex.mstate) == locked -> mutex.mstate = unlocked -> mutex.mid = 255 ->  printf("@@@ %d UNLOCKED : state is %e\n",_pid,mutex.mstate);
  }
 
}

// pthread_cond_wait(&c,&m);
inline wait(c,m) {
  
  
  
  // Releasing the mutex, you must have it to wait. Hence the assert.
  atomic {
    assert(m.mstate == locked && m.mid == _pid) -> m.mstate = unlocked->  printf("@@@ %d WAIT for cond[%d]=%d with mutex=%e\n",_pid,c,cvars[c].dummy,m.mstate) ;
  }
  // Reset the signal as it may be true from a previous signalling
  // FOR SOME REASON IF PRODUCERS 1 AND 2 ARE BOTH WAITING ON A SIGNAL AND THE CONSUMER
  // SENDS THE SIGNAL NEITHER OF THEM RESUME 
  
  // Once the signal is given, start waiting for the lock to become unlocked again, then reaquire it.
   atomic {
    cvars[c].dummy == true -> m.mstate == unlocked-> m.mstate = locked -> m.mid = _pid -> printf("@@@ %d DONE with cond[%d]=%d with mutex=%e\n",_pid,c,cvars[c].dummy,m.mstate) -> cvars[c].dummy = false;
  }
  
  
  
}

// pthread_cond_signal(&c);
inline signal(c) {
  
  // Signal the condition variable.
  atomic {
    printf("@@@ %d SIGNAL cond[%d]=%d\n",_pid,c,cvars[c].dummy);
    cvars[c].dummy = true;
    printf("@@@ %d SIGNALLED cond[%d]=%d\n",_pid,c,cvars[c].dummy);
  }
 
}
