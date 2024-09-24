;; Design a script where an indirect function call is placed inside a loop with multiple exit conditions, each leading to different indirect calls. This evaluates the accurate structure of loops and exit paths in the CFG.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i64)))
    (table funcref (elem 0 0))
    (func $test
      (loop $loop
        (br_if $loop (i32.eq (i32.const 0) (i32.const 0)))
        (call_indirect (type 0) (i32.const 1) (i32.const 0))
        (call_indirect (type 1) (i32.const 1) (i64.const 42))
      )
    )
  )
  "type mismatch"
)