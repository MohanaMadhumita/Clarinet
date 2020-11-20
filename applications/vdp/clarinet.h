#ifdef POSIT
void fn_posit_p_fma (unsigned int a, unsigned int b);
void fn_init_p_quire (unsigned int initVal);
unsigned int fn_read_p_quire (void);
#endif
void fn_posit_fma (float a, float b);
float fn_float_fma (float a, float b, float acc);
void fn_init_quire (float initVal);
float fn_read_quire (void);
#ifdef ACCEL
void fn_posit_accel_fma (float a, float b);
void fn_reset_accel_quire (void);
float fn_read_accel_quire (void);
#endif

