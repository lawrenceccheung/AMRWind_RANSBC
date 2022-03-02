# Development & Validation of the RANS ABL BC in AMR-Wind

This repo will include documentation, checklist, and validation of the
RANS ABL boundary condition for AMR-Wind.  Initial implementation will
be for the k-omega RANS model.

## Documentation

Check out the docs section for notes and literature.

RANS ABL k-omega model merged branch: 
https://github.com/lawrenceccheung/amr-wind/tree/mesh_map_k_omega_merge

Branches to merge in: 
- [x] https://github.com/lawrenceccheung/amr-wind/tree/mesh_map_k_omega

- [ ] https://github.com/ashesh2512/amr-wind/commits/mesh_map_turb
- [ ] https://github.com/lawrenceccheung/amr-wind/tree/mesh_map_subsetsampling

Do not merge this one (yet): 
- https://github.com/ashesh2512/amr-wind/tree/mesh_map_multi_lev


## Things to do

### Things to do for implemention
- [x] Implement ABL stretching function
  - [x] Blended stretching function defined in ABLScaling_function_blended.ipynb
  - [x] Implement in ABLScaling.cpp 
- [x] Make a copy of KOmegaSST called KOmegaSSTABL
- [ ] Implement ABL initial condition
  - [x] Edit `ABL::initialize_fields` to account for mesh mapping, sdr/tke init
  - [x] Edit `ABLFieldInit::operator()` -- include mesh mapping
  - [x] Edit `ABLFieldInit::perturb_temperature` for temperature
  - [ ] Edit `ABLFieldInit::operator()` -- initialize with M.O. profile?
  - [ ] Fill in `ABLFieldInit::init_tke()` -- use a profile?
  - [ ] Fill in `ABLFieldInit::init_sdr()` -- use a profile?
  
  
- [x] Make changes to wall function BC
  - [x] Add ABLTKEWallFunc/ABLSDRWallFunc infrastructure in ABLWallFunction.cpp
  - [x] Edit ABL constructor to include RANS ABL inputs/capability
    - Cmu is now linked to `beta_star` in RANS variables
  - [x] Register TKE/SDR wall functions in ABL::post_init_actions()
  - [x] Edit ABLWallFunction::init_log_lawHeight()
  - [x] Add phi calculations in `MOData.H`, `MOData.cpp`.
  - [x] Add mu, epsilon, tke calculations in `ShearStress.H`.
  - [x] Fill in ABLTKEWallFunc::wall_model()
  - [x] Fill in ABLSDRWallFunc::wall_model()

- [ ] Make changes for k-epsilon model
  - [ ] Fill in `ABLFieldInit::init_eps()` -- use a profile?
  - [x]	call init_eps() in ABL::initialize_fields()
  - [x] Register EPS wall functions in ABL::post_init_actions()
  - [x] Create ABLEPSWallFunc() in ABLWallFunction.H & fill in wall model

### Things to do for testing  
**Basic testing**

- [x] Create test harness for KOmegaSSTABL+wall model (proper inputs
  for 1 iteration test case, no mesh mapping)
  - see [abl_komegasst.i](testharness/ABL_kOmegaSST_uniform/abl_komegasst.i)

- [x] Create test harness for KOmegaSSTABL+wall model+mesh mapping
  (proper inputs for 1 iteration test case, with mesh mapping)
  - see [abl_komegasst_meshmap.i](testharness/ABL_kOmegaSST_meshmap/abl_komegasstabl_meshmap.i)

