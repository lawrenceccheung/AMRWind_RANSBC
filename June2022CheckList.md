# Checklist of runs for V&V

## Joukowski disk runs

### "Basic checks"
- [ ] Check epsilon
- [ ] Check num_points_r  --> What is the best number to use? (supply best practice to GE)
- [ ] Check num_points_t  --> What is the best number to use? (supply best practice to GE)
- [ ] Check root correction
- [ ] Check tip-loss correction
- [ ] Check grid resolution
- [ ] Check WS curves
- [ ] Check TSR's
- [ ] Check turbine yaw 
- [ ] Check diameters_to_sample

### Validation
- [ ] Validate against Sorensen 2020 (J. Phys.: Conf. Ser. 1618 052051) 
- [ ] Validate against 1-D actuator theory


## ABL runs for k-omega SST

Take a look at https://gist.github.com/lawrenceccheung/fb52b13a9104bbf8ed840b34c21ab64f

- [ ] Run Neutral RANS ABL with uniform mesh + multiple refinement levels
  https://cee-gitlab.sandia.gov/wind/SWIFT_Neutral_WS8.7_Alpha0.14/-/blob/master/AMRWind_Precursor/precursor1/SWIFT_Neutral87_precursor.inp
  
- [ ] Fix TKE source term for mesh mapping
- [ ] Fix Omega source term for mesh mapping
