/*
 * Generated by Bluespec Compiler, version 2018.10.beta1 (build e1df8052c, 2018-10-17)
 * 
 * On Tue Apr 21 18:01:52 IST 2020
 * 
 */

/* registration array */
#include "vpi_wrapper_c_end_timing.h"
#include "vpi_wrapper_c_get_symbol_val.h"
#include "vpi_wrapper_c_start_timing.h"
#include "vpi_wrapper_c_trygetchar.h"

/* Convenience function to register all imported functions */
void vpi_register_all()
{
  c_end_timing_vpi_register();
  c_get_symbol_val_vpi_register();
  c_start_timing_vpi_register();
  c_trygetchar_vpi_register();
}

/* Convenience function to register only tasks */
void vpi_register_tasks()
{
  c_end_timing_vpi_register();
  c_start_timing_vpi_register();
}
void (*vlog_startup_routines[])() = { vpi_register_all, 0u };