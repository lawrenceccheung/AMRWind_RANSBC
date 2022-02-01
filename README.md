# Development & Validation of the RANS ABL BC in AMR-Wind

This repo will include documentation, checklist, and validation of the
RANS ABL boundary condition for AMR-Wind.  Initial implementation will
be for the k-omega RANS model.

## Documentation

Check out the docs section for notes and literature.

RANS k-omega implementation occuring in branch:
https://github.com/lawrenceccheung/amr-wind/tree/mesh_map_k_omega

## Things to do

Things to do for implemention
- [x] Implement ABL stretching function
  - [ ] TODO: change stretching to constant after some height...
- [ ] Make a copy of KOmegaSST called KOmegaSSTABL
- [ ] Implement ABL initial condition
  - [ ] Edit `ABL::initialize_fields`, include SDR
  
- [ ] Make changes to wall function BC
  - [ ] Edit ABL constructor to include RANS ABL inputs/capability
  - [ ] Register TKE/SDR wall functions in ABL::post_init_actions()
  - [ ] Edit ABLWallFunction::init_log_lawHeight()
  - [ ] Fill in ABLTKEWallFunc
  - [ ] Fill in ABLSDRWallFunc