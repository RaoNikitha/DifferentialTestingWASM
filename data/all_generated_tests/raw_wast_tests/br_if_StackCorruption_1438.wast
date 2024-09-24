;; A combination of loops and `block`s where a `br_if` in a loop conditionally continues the loop. This test should validate that the stack unwinds to the loop’s input type correctly and the loop’s execution context is preserved.

(assert_invalid
  (module
    (func $loop-and-block (result i32)
      (local i32)
      (block (loop (local.set 0 (i32.const 1)) (br_if 1 (i32.const 0)) (br 0)))
    )
  )
  "type mismatch"
)