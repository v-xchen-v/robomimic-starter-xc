import h5py
with h5py.File("external/robomimic/datasets/lift/ph/low_dim_v15.hdf5", "r") as f:
    lengths = [len(f["data/episodes"][ep]["actions"]) for ep in f["data/episodes"]]
    print(f"Min length: {min(lengths)}")
