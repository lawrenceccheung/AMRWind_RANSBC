#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            SIMULATION STOP            #
#.......................................#
time.stop_time               =   22000.0     # Max (simulated) time to evolve
time.max_step                =   100           # Max number of time steps

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#         TIME STEP COMPUTATION         #
#.......................................#
time.fixed_dt         =   0.1          # Use this constant dt if > 0
time.cfl              =   0.5          # CFL factor

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            INPUT AND OUTPUT           #
#.......................................#
time.plot_interval            =  10       # Steps between plot files
time.checkpoint_interval      =  5       # Steps between checkpoint files

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

incflo.physics = ABL
ICNS.source_terms = BoussinesqBuoyancy CoriolisForcing ABLForcing
BoussinesqBuoyancy.reference_temperature = 314.4
ABL.reference_temperature = 314.4
CoriolisForcing.latitude = 33.6
ABLForcing.abl_forcing_height = 32.1
incflo.velocity = 7.250462296293199  3.380946093925596  0.0
ABL.temperature_heights = 0 650.0 750.0 1000.0
ABL.temperature_values = 314.4 314.4 314.4 323.15
ABL.temperature_heights = 0 10000
ABL.temperature_values = 314.4 314.4 
ABL.surface_temp_flux = 0.0
ABL.normal_direction = 2
ABL.kappa = .4
ABL.mo_beta_m = 16.0
ABL.mo_beta_h = 16.0
ABL.mo_gamma_m = 5.0
ABL.mo_gamma_h = 5.0
ABL.surface_roughness_z0 = 0.01
ABL.init_tke = 0.1
ABL.initial_sdr_value = 25.0

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#        ADAPTIVE MESH REFINEMENT       #
#.......................................#
amr.n_cell              = 48 48 48    # Grid cells at coarsest AMRlevel
amr.max_level           = 0           # Max AMR level in hierarchy 

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#              GEOMETRY                 #
#.......................................#
geometry.prob_lo        =   0.       0.     0.  # Lo corner coordinates
geometry.prob_hi        =   48 48 48  # Hi corner coordinates
geometry.is_periodic    =   1   1   0   # Periodicity x y z (0/1)

geometry.mesh_mapping = Geom2ConstantScaling
Geom2ConstantScaling.sratio        = 1.1 1.1 1.2
Geom2ConstantScaling.delta0        = 20.83333333 20.833333333 0.1
Geom2ConstantScaling.transwidth    = 0.10 0.10 0.10
Geom2ConstantScaling.translocation = 50.0 50.0 20.0
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
zlo.tke_type = "wall_model"
zlo.sdr_type = "wall_model"

zhi.type =   "slip_wall"
zhi.temperature_type = "fixed_gradient"
zhi.temperature = 0.003 # tracer is used to specify potential temperature gradient

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#              VERBOSITY                #
#.......................................#
incflo.verbose          =   0          # incflo_level

# Additional tolerance settings
diffusion.max_coarsening_level = 0
nodal_proj.mg_atol = 1.0e-09
nodal_proj.verbose = 0
#nodal_proj.bottom_solver = hypre
nodal_proj.max_coarsening_level = 0

mac_proj.mg_rtol = 1.0e-11
mac_proj.mg_atol = 1.0e-09
mac_proj.do_semicoarsening = true
#mac_proj.bottom_solver = hypre
mac_proj.bottom_verbose = 0
mac_proj.max_coarsening_level = 0
mac_proj.bottom_rtol = 1.0e-12
mac_proj.bottom_atol = 1.0e-16

hypre.hypre_solver = GMRES
hypre.hypre_preconditioner = BoomerAMG
hypre.recompute_preconditioner = 0
hypre.verbose = 0
hypre.bamg_verbose = 0
hypre.num_krylov = 20
hypre.bamg_max_levels = 4
hypre.bamg_num_sweeps = 1

