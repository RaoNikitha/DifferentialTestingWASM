;; 1. **Invalid Out-of-Bounds Label Reference**:    - **Description**: Test where `br_if` attempts to reference a label index greater than the current nesting depth. This invalid reference should trigger an out-of-bounds error in the wizard_engine but may not be caught by WASM's simple lookup mechanism.    - **Constraint**: Indexed access beyond available labels.    - **CFG Impact**: Generates an invalid control flow due to out-of-bounds branching.

(assert_invalid
  (module (func $out_of_bounds_label (block (br_if 3 (i32.const 1)))))
  "unknown label"
)