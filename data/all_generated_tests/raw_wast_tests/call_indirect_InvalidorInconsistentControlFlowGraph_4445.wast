;; 4. **Test Description**:    - Construct a WebAssembly module where a `call_indirect` is nested within control flow structures (loops and branches) and reference a non-existent `typeidx`.    - **Constraint**: Test handling of invalid type references within complex control flows.    - **CFG Relation**: CFG must handle loops and conditional branches correctly while resolving traps for invalid type indices.

(assert_invalid
  (module
    (type (func))
    (table 1 funcref)
    (func $complex_control_flow
      (loop
        (block
          (i32.const 0)
          (br_if 0 (i32.const 1))
          (call_indirect (type 999) (i32.const 0))
        )
        (br 1)
      )
    )
  )
  "unknown type"
)