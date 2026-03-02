<p align="center">
  <img src="assets/logo.png" width="220">
</p>
# Portal 2 Ultra (Linux Native)

A reproducible **graphics configuration framework** for the native Linux version of *Portal 2*.

This project maximizes visual fidelity **within Source Engine limits** while remaining:

* native Linux
* Steam-safe
* VAC-safe
* fully reversible
* non-destructive

No engine mods, texture replacements, Proton layers or binary modifications are used.

---

## 🎯 Project Goal

Provide a simple installer that enables the highest stable graphical settings supported by the **native Source Engine renderer on Linux**.

The project focuses on:

* stability over hacks
* reproducibility across systems
* clean uninstall capability
* zero permanent system modification

---

## ✅ What This Is

Portal 2 Ultra is **not a mod**.

It is a deployable runtime configuration that:

* installs a graphics profile (`ultra.cfg`)
* automatically enables it via Steam Launch Options
* can be safely removed at any time

All changes occur only inside the user Steam directory.

---

## ❌ What This Does NOT Do

This project does **not**:

* replace textures
* modify game files
* patch binaries
* require Proton or DXVK
* bypass engine limitations

Visual improvements come from optimized engine configuration only.

---

## 📦 Installation

Close Steam before installing.

```bash
git clone https://github.com/YOURNAME/portal2-ultra
cd portal2-ultra
./install.sh
```

The installer will:

* detect Steam automatically
* install `ultra.cfg`
* safely add `+exec ultra.cfg` to Portal 2 launch options

Restart Steam after installation.

---

## 🧹 Uninstall

Close Steam, then run:

```bash
./uninstall.sh
```

This will:

* remove `ultra.cfg`
* restore original Launch Options

No residual configuration remains.

---

## 🐧 Linux Support

Tested on native Linux Steam installations using:

* OpenGL Source Engine renderer
* Mesa drivers
* NVIDIA proprietary drivers

Designed to remain stable across different hardware classes.

---

## ⚙️ Technical Notes

The configuration:

* maximizes texture sampling and filtering
* enables full HDR and phong lighting
* increases geometry and detail distance
* improves portal lighting fidelity
* uses safe multicore scheduling for Linux (`mat_queue_mode -1`)

All settings remain inside official engine limits.

---

## 🔒 Safety

Portal 2 Ultra:

* does not trigger VAC
* does not alter Steam runtime
* does not modify system files
* can be installed repeatedly without duplication
* is fully reversible

---

## 🧠 Philosophy

Instead of modifying the engine, this project respects the Source Engine design and extracts the maximum visual quality achievable through configuration alone.

---

## 📜 License

MIT License (recommended — can be changed later).

---

## ⭐ Contribution

Issues and testing feedback from different Linux hardware setups are welcome.
