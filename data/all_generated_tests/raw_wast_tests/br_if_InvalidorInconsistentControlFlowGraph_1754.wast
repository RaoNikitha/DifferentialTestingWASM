;; 5. **Test Description: Nested Control Structure Violations**    - **Reasoning**: Nesting depths of structured control instructions are mismanaged, leading to scope ambiguities.    - **Constraint Checked**: Proper nesting of structured control instructions (`block`, `loop`, `if`).    - **Inconsistent CFG**: Incorrectly modeled nesting depth can lead to invalid label resolutions.    - **Expected Differential Behavior**: The WASM environment throws a generic error, while wizard_engine signals an `OobLabel` for out of bounds nesting target.

(assert_invalid
  (module
    (func $nested-control-structure-violation
      (block
        (loop
          (br_if 2 (i32.const 1))
        )
      )
    )
  )
  "out of bounds label"
)