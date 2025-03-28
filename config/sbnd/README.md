# Summary of SBND full chain configurations and their characteristics

The configurations below have been trained on SBND MPV/MPR datasets. This summary is divided by training/validation dataset.

## Configurations for MPVMPR v02

```shell
sbnd_full_chain_250328.cfg
sbnd_full_chain_data_250328.cfg
```

These weights have been trained using the following files at Polaris:
- Training set: `/lus/eagle/projects/neutrinoGPU/bearc/simulation/mpvmpr_v02/train/files.txt` (255k)
- Test set: `/lus/eagle/projects/neutrinoGPU/bearc/simulation/mpvmpr_v02/test/larcv/files.txt` (68k)

Training samples MPVMPR using `sbndcode v10_04_01` which can be found [here](https://github.com/SBNSoftware/sbndcode/tree/v10_04_01) . The training samples are generated using the following fcls:
```
run_mpvmpr_sbnd.fcl
g4_sce_lite.fcl
detsim_sce_lite.fcl
reco1_mpvmpr.fcl
```

The following modifications were made to the `sbndcode` configuration:
- Ghost labeling parameters - [Supera PR #54](https://github.com/DeepLearnPhysics/Supera/pull/54)
- Doublets are used - [sbndcode PR #661](https://github.com/SBNSoftware/sbndcode/pull/661)
- Updated clock - [sbndcode PR #645](https://github.com/SBNSoftware/sbndcode/pull/645)
- `larwirecell` patch - [larwirecell PR #55](https://github.com/LArSoft/larwirecell/pull/55)

Description:
  - UResNet + PPN + gSPICE + GrapPAs (track + shower + interaction)
  - Class-weighted loss on PID predictions
  - The `*_data_*` declination is tailored for data (no labels)

## Configurations for MPV/MPR v01

These weights have been trained/validated using the following files:
- Training set: `/sdf/data/neutrino/sbnd/simulation/mpvmpr_v01/train.list`
- Test set: `/sdf/data/neutrino/sbnd/simulation/mpvmpr_v01/test.list`

### July 20th 2024

```shell
sbnd_full_chain_240720.cfg
sbnd_full_chain_data_240720.cfg
```

Description:
  - UResNet + PPN + gSPICE + GrapPAs (track + shower + interaction)
  - Class-weighted loss on PID predictions
  - The `*_data_*` declination is tailored for data (no labels)

Known issue(s):
  - The shower start point prediction of electron showers is problematic due to the way PPN labeling is trained
  - Flashes but no flash matching

### August 14th 2024

```shell
sbnd_full_chain_240814.cfg
sbnd_full_chain_data_240814.cfg
```

Description:
  - UResNet + PPN + gSPICE + GrapPAs (track + shower + interaction)
  - Class-weighted loss on PID predictions
  - The `*_data_*` declination is tailored for data (no labels)

Known issue(s):
  - Resolves the issue with the PPN target in the previous set of weights
  - Removed PPN-based end point predictions
  - No other known issue

### September 18th 2024

```shell
sbnd_full_chain_240918.cfg
sbnd_full_chain_data_240918.cfg
```

Description:
  - UResNet + PPN + gSPICE + GrapPAs (track + shower + interaction)
  - Class-weighted loss on PID predictions
  - The `*_data_*` declination is tailored for data (no labels)
  - This is the first configuration which **includes flash matching**

Known issue(s):
  - Includes flash matching
