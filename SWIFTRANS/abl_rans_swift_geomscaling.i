#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            SIMULATION STOP            #
#.......................................#
time.stop_time               =   22000.0     # Max (simulated) time to evolve
time.max_step                =   36000          # Max number of time steps

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#         TIME STEP COMPUTATION         #
#.......................................#
time.fixed_dt         =   0.1          # Use this constant dt if > 0
time.cfl              =   0.5          # CFL factor

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            INPUT AND OUTPUT           #
#.......................................#
time.plot_interval            =  -10       # Steps between plot files
time.checkpoint_interval      =  -1000       # Steps between checkpoint files

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#               PHYSICS                 #
#.......................................#
incflo.gravity          =   0.  0. -9.81  # Gravitational force (3D)
incflo.density             = 1.015          # Reference density
incflo.constant_density = true

incflo.use_godunov  = 0
transport.viscosity = 1.5e-5
transport.laminar_prandtl = 0.7
transport.turbulent_prandtl = 0.3333

#turbulence.model = Smagorinsky
#Smagorinsky_coeffs.Cs = 0.135
turbulence.model = KOmegaSSTABL
TKE.source_terms = KwSSTSrc
SDR.source_terms = SDRSrc
KOmegaSSTABL_coeffs.beta_star = 0.02 #.03329958974905429164

incflo.physics = ABL
ICNS.source_terms = ABLForcing BoussinesqBuoyancy CoriolisForcing #ABLForcing
BoussinesqBuoyancy.reference_temperature = 314.4
ABL.reference_temperature = 314.4
CoriolisForcing.latitude = 33.6
ABLForcing.abl_forcing_height = 32.1
#ABL.log_law_height = 0.055 #0.2
incflo.velocity = 8.69 0.0 0.0
ABL.temperature_heights = 0 500
ABL.temperature_values = 314.4 314.4 
ABL.surface_temp_flux = 0.0
ABL.normal_direction = 2
ABL.kappa = .41
ABL.mo_beta_m = 16.0
ABL.mo_beta_h = 16.0
ABL.mo_gamma_m = 5.0
ABL.mo_gamma_h = 5.0
ABL.surface_roughness_z0 = 0.01
ABL.init_tke_const = 0.1
ABL.init_sdr_const = 25.0
ABL.init_type = simple
ABL.perturb_velocity = 0
ABL.stats_output_frequency = 10
ABL.wall_shear_stress_type = constant #schumann #moeng schumann constant schumann


#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#        ADAPTIVE MESH REFINEMENT       #
#.......................................#
amr.n_cell              = 16 16 192     # Grid cells at coarsest AMRlevel
amr.max_level           = 0           # Max AMR level in hierarchy 

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#              GEOMETRY                 #
#.......................................#
geometry.prob_lo        =   0.       0.     0.  # Lo corner coordinates
geometry.prob_hi        =   960.0 960.0 6 #500.0  # Hi corner coordinates
geometry.is_periodic    =   1   1   0   # Periodicity x y z (0/1)


#geometry.mesh_mapping = ExpScaling
ExpScaling.delta0        = 20.833333333 20.833333333 0.1 #0.15
ExpScaling.do_map        = 0   0   1

geometry.mesh_mapping = Geom2ConstantScaling
Geom2ConstantScaling.sratio        = 1.1 1.1 1.1
Geom2ConstantScaling.delta0        = 20.83333333 20.833333333 0.10 #0.075
Geom2ConstantScaling.transwidth    = 0.10 0.10 0.10
Geom2ConstantScaling.translocation = 50.0 50.0 75 #40.0
Geom2ConstantScaling.do_map        = 0   0   1

#geometry.mesh_mapping = ABLScaling
#ABLScaling.sratio        = 1.0 1.0 1.1 
#ABLScaling.delta0        = 1.0 1.0 0.1 
#ABLScaling.transwidth    = 1.0 1.0 0.05
#ABLScaling.translocation = 1.0 1.0 2.0
#ABLScaling.do_map        = 0   0   1

#geometry.mesh_mapping = ConstantMap
#ConstantMap.scaling_factor = 1.0 1.0 1.0


# Boundary conditions
zlo.type     = "wall_model"
zlo.tke_type = "rans_wall_model"
#zlo.tke_type = no_slip_wall
#zlo.tke      = 0.5
zlo.sdr_type = "rans_wall_model"

zhi.type =   "slip_wall"
zhi.temperature_type = "fixed_gradient"
zhi.temperature = 0.003 # tracer is used to specify potential temperature gradient

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#              VERBOSITY                #
#.......................................#
incflo.verbose          =   0          # incflo_level

diffusion.max_coarsening_level = 0
#
nodal_proj.mg_atol = 1.0e-09
nodal_proj.verbose = 0
nodal_proj.bottom_solver = hypre
nodal_proj.max_coarsening_level = 0
#
mac_proj.mg_rtol = 1.0e-11
mac_proj.mg_atol = 1.0e-9
mac_proj.do_semicoarsening = true
mac_proj.bottom_solver = hypre
mac_proj.bottom_verbose = 0
mac_proj.max_coarsening_level = 0
mac_proj.bottom_rtol = 1.0e-12
mac_proj.bottom_atol = 1.0e-12
#
hypre.hypre_solver = GMRES
hypre.hypre_preconditioner = BoomerAMG
hypre.verbose = 0
hypre.bamg_verbose = 0
hypre.num_krylov = 20
hypre.bamg_max_levels = 5
hypre.bamg_num_sweeps = 1
#hypre.bamg_relax_type = 11
hypre.bamg_coarsen_type = 8
hypre.bamg_interp_type = 6
hypre.bamg_cycle_type = 1
hypre.bamg_relax_order = 0
hypre.bamg_trunc_factor = 0.25
hypre.bamg_agg_num_levels = 1
hypre.bamg_agg_interp_type = 7
hypre.bamg_agg_pmax_elmts = 3
hypre.bamg_pmax_elmts = 3
hypre.bamg_strong_threshold = 0.57
hypre.recompute_preconditioner = 0
#

