;; 9. **Test Description:**    - Utilize a WASM module A exporting a function with `nop` instructions placed around parameters fetching and returning. Module B calls this function repeatedly and checks the accuracy of returned values.    - **Constraint Checked:** Ensures that parameters fetching/returning aren't disturbed by `nop`.    - **Relation to Issue:** Confirms that `nop` does not affect parameter passing across import/export boundaries.

 ;; (module
  (func (export "test") (param i32) (result i32)
    nop
    local.get 0
    nop
  )
)

(module
  (import "A" "test" (func $test (param i32) (result i32)))
  (func (export "runTests") (param i32) (result i32)
    nop
    local.get 0
    call $test
    nop
  )
)