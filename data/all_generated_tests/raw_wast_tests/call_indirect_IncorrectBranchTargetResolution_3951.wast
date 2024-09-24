;; 10. Design a function with mixed use of `loop` and `block` instructions, where `call_indirect` is executed based on computed indices that rely on correct branch resolution. A bug here should result in the control flow falsely processing indices leading to an invalid function reference.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32) (result i64)))
    (func $func1 (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $func2 (param i32) (result i64)
      (i64.add (i64.extend_i32_s (local.get 0)) (i64.const 2))
    )
    (table funcref (elem $func1 $func2))
    (func $test_func (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (br_if 1 (i32.eq (local.get 0) (i32.const 0)))
          (call_indirect (type 1) (i32.div_s (local.get 0) (i32.const 2)))
        )
      )
    )
  )
  "type mismatch"
)