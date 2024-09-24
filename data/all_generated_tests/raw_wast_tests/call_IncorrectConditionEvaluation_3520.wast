;; 9. Execute a series of calls and stack manipulations where the final outcome (an error or success flag) is determined by a `br_if` condition. The final flag should detect any incorrect conditional branch evaluations.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $test (param i32) (result i32)
      (call 0 (i32.const 10))
      (drop)
      (call 1 (i32.const 20))
      (i32.const 1)
      (br_if 0)
    )
  )
  "type mismatch"
)