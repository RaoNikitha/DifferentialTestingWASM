;; 9. **Test 9: Loop with Import/Export Function Chain**:    - A loop where each iteration calls an imported function, which immediately calls an exported function, creating a chain of function calls.    - **Constraint Checked**: Verifies context extension handling and stack integrity across a chain of function calls spanning module boundaries.    - **Relevance**: Ensures correct context extension and control stack management across intricate call chains.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (param i32) (result i32)))
    (func (export "testLoop") (result i32)
      (local $i i32)
      (local.set $i (i32.const 0))
      (loop (result i32)
        (call $externalFunc (local.get $i))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br_if 0 (i32.lt_s (local.get $i) (i32.const 10)))
      )
    )
  )
  "type mismatch"
)