#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            SIMULATION STOP            #
#.......................................#
time.stop_time               =   22000.0     # Max (simulated) time to evolve
time.max_step                =   1           # Max number of time steps

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#         TIME STEP COMPUTATION         #
#.......................................#
time.fixed_dt         =   0.01          # Use this constant dt if > 0
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
incflo.density             = 1.0          # Reference density 

incflo.use_godunov  = 0
incflo.godunov_type = weno_z
transport.viscosity = 1.0e-5
transport.laminar_prandtl = 0.7
transport.turbulent_prandtl = 0.3333
#turbulence.model = Smagorinsky
#Smagorinsky_coeffs.Cs = 0.135
turbulence.model = KOmegaSSTABL
TKE.source_terms = KwSSTSrc
SDR.source_terms = SDRSrc


incflo.physics = ABL
ICNS.source_terms = BoussinesqBuoyancy CoriolisForcing ABLForcing
BoussinesqBuoyancy.reference_temperature = 300.0
ABL.reference_temperature = 300.0
CoriolisForcing.latitude = 41.3
ABLForcing.abl_forcing_height = 90

incflo.velocity = 6.128355544951824  5.142300877492314 0.0

ABL.temperature_heights = 650.0 750.0 1000.0
ABL.temperature_values = 300.0 308.0 308.75

ABL.kappa = .41
ABL.surface_roughness_z0 = 0.15

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#        ADAPTIVE MESH REFINEMENT       #
#.......................................#
amr.n_cell              = 48 48 48    # Grid cells at coarsest AMRlevel
amr.max_level           = 0           # Max AMR level in hierarchy 

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#              GEOMETRY                 #
#.......................................#
geometry.prob_lo        =   0.       0.     0.  # Lo corner coordinates
geometry.prob_hi        =   1000.  1000.  1000.0  # Hi corner coordinates
geometry.is_periodic    =   1   1   0   # Periodicity x y z (0/1)

geometry.mesh_mapping = Geom2ConstantScaling
Geom2ConstantScaling.sratio        = 1.1 1.1 1.1
Geom2ConstantScaling.delta0        = 20.833333333 20.833333333 20.8333333333
Geom2ConstantScaling.transwidth    = 0.10 0.10 0.10
Geom2ConstantScaling.translocation = 50.0 50.0 30.0
Geom2ConstantScaling.do_map        = 0   0   1


#geometry.mesh_mapping = ABLScaling
ABLScaling.sratio        = 1.0 1.0 1.1 
ABLScaling.delta0        = 1.0 1.0 0.1 
ABLScaling.transwidth    = 1.0 1.0 0.05
ABLScaling.translocation = 1.0 1.0 2.0
ABLScaling.do_map        = 0   0   1

#geometry.mesh_mapping = ConstantMap
ConstantMap.scaling_factor = 1.0 1.0 1.0


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
