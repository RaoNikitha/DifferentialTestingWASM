;; - A `loop` nested within a function, with a `br_if` that conditionally breaks the loop and calls another function, which explicitly returns a value. The test checks if improper stack adjustments during the `br_if`'s conditional break result in incorrect call sequence or return values.

(assert_invalid
  (module
    (func $test_func
      (i32.const 1)
      (loop $loop
        (call $another_func)
        (br_if 0 (i32.const 0))
      )
    )
    (func $another_func (result i32)
      (i32.const 42)
    )
    (export "test_func" (func $test_func))
  )
  "type mismatch"
)