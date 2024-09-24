;; Construct a test with a function containing multiple levels of if-else blocks, and place a `call_indirect` within one of the inner branches. Test the correctness of branching by altering depth levels and verify correct control flow on both implementations.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (table funcref (elem $func1))
    (func $func1 (result i32) (i32.const 42))
    (func $test
      (i32.const 0)
      (if (result i32)
        (then
          (i32.const 0)
          (if (result i32)
            (then
              (call_indirect (type $sig) (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)