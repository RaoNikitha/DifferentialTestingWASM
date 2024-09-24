;; 2. **Test Description:**    - Define a function with nested control blocks (`block`, `loop`, `if`) interspersed with `nop` instructions in module A. Export this function. In module B, call this exported function and immediately follow it with another call. Verify correctness of call sequences in module B.    - **Constraint Checked:** `nop` should not alter nested control structures across module boundaries.    - **Relation to Issue:** Checks if `nop` causes any mismatches or corruptions in nested control flow when imported.

(assert_invalid
  (module 
    (func $nested-control-blocks
      (block
        (nop)
        (loop 
          (nop)
          (if (i32.const 1)
            (then (nop))
            (else (nop))
          )
          (nop)
        )
        (nop)
      )
    )
    (export "nestedControlBlocks" (func $nested-control-blocks))
  )
  "type mismatch"
)

(assert_invalid
  (module
    (import "env" "nestedControlBlocks" (func $importedFunc))
    (func (call $importedFunc) (call $importedFunc))
  )
  "type mismatch"
)