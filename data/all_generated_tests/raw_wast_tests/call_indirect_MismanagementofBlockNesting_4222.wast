;; 1. **Test Description**: A test where `call_indirect` is located inside nested loops with a `br_table` that jumps multiple layers. The test will validate if the function correctly identifies the target block for redirection based on the stack depth.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func (param i32) (result i32)
      (local i32)
      (loop (block (result i32)
        (call_indirect (type 0) (i32.const 0) (i32.const 1))
        (br_table 0 1 (local.get 0))
      ))
    )
  )
  "unknown table"
)