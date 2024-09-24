;; 9. **Split Execution Paths with Calls**: Create a test where multiple nested execution paths (blocks) are split, containing individual `call` instructions that affect shared state variables. This examines the engine’s handling of control flow upon returning from diverse function calls and reevaluating the nesting context.

(assert_invalid
  (module
    (func $f (param i32))
    (func $g (param i64))
    (func $h (param i32) (result i32) (i32.const 42))
    (table 1 funcref)
    (elem (i32.const 0) $h)
    (func $test-split-execution
      (block
        (block
          (call $f (i32.const 10))
          (call $g (i64.const 20))
          (br 1)
        )
        (block
          (call_indirect (type $f) (i32.const 0) (i32.const 15))
        )
      )
    )
  )
  "type mismatch"
)