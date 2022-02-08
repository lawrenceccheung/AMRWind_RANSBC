# Development & Validation of the RANS ABL BC in AMR-Wind

This repo will include documentation, checklist, and validation of the
RANS ABL boundary condition for AMR-Wind.  Initial implementation will
be for the k-omega RANS model.

## Documentation

Check out the docs section for notes and literature.

RANS k-omega implementation occuring in branch:
https://github.com/lawrenceccheung/amr-wind/tree/mesh_map_k_omega

Must also merge in changes from branch:  
https://github.com/ashesh2512/amr-wind/tree/mesh_map_multi_lev

## Things to do

### Things to do for implemention
- [x] Implement ABL stretching function
  - [ ] TODO: change stretching to constant after some height...
- [x] Make a copy of KOmegaSST called KOmegaSSTABL
- [ ] Implement ABL initial condition
  - [x] Edit `ABL::initialize_fields` to account for mesh mapping, sdr/tke init
  - [x] Edit `ABLFieldInit::operator()` -- include mesh mapping
  - [x] Edit `ABLFieldInit::perturb_temperature` for temperature
  - [ ] Edit `ABLFieldInit::operator()` -- initialize with M.O. profile?
  - [ ] Fill in `ABLFieldInit::init_tke()` -- use a profile?
  - [ ] Fill in `ABLFieldInit::init_sdr()` -- use a profile?
  
  
- [ ] Make changes to wall function BC
  - [x] Add ABLTKEWallFunc/ABLSDRWallFunc infrastructure in ABLWallFunction.cpp
  - [ ] Edit ABL constructor to include RANS ABL inputs/capability
  - [ ] Register TKE/SDR wall functions in ABL::post_init_actions()
  - [ ] Edit ABLWallFunction::init_log_lawHeight()
  - [ ] Fill in ABLTKEWallFunc
  - [ ] Fill in ABLSDRWallFunc

### Things to do for testing  
**Basic testing**

- [ ] Create test harness for KOmegaSSTABL+wall model (proper inputs
  for 1 iteration test case, no mesh mapping)

- [ ] Create test harness for KOmegaSSTABL+wall model+mesh mapping
  (proper inputs for 1 iteration test case, with mesh mapping)

