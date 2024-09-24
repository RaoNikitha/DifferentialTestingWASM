;; - A nested `loop` with a `br_if` in each loop, where the inner loop conditionally breaks with a call to a function that returns a modified stack value. This setup verifies if improper stack height adjustments during break operations affect subsequent function calls.

(assert_invalid
 (module
  (func $test (result i32)
    (block
      (loop $outer (result i32)
        (loop $inner (result i32)
          (call $modifiesStack)
          (br_if $inner (i32.const 1))
          (br_if $outer (i32.const 1))
        )
        (i32.const 1)
      )
    )
  )
  (func $modifiesStack (result i32)
    (i32.const 42)
  )
 )
 "type mismatch"
)