;; 9. **Test Description**: Construct a module where an exported function contains a `loop` and involves multiple branches using `br_table` to target different loop blocks. The function calls an imported function that modifies the stack and control flow. This test verifies the handling of indirect branches and stack coherency across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func (export "test_loop")
      (i32.const 1)
      (loop (result i32)
        (i32.const 0)
        (br_table 0 0 0)
        (call $external_func)
      )
      drop
    )
  )
  "type mismatch"
)