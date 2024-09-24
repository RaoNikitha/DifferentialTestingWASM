;; 4. **Start and End Functions with `nop`**:    - Design functions that begin and end with a `nop` operation, ensuring those instructions only bookend meaningful operations without affecting the CFG.    - Constraint: Verifies the correct interpretation of a `nop` at the critical control points of a function.

(assert_invalid
  (module
    (func $test
      (nop)
      i32.const 42
      (nop)
      return
      (result i32)
    )
  )
  "type mismatch"
)