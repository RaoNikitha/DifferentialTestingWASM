;; Test 8: Write a loop with a complex condition involving multiple data types on the operand stack for a `br_if`, testing the integration of branch and type-checking methods within contexts.

(assert_invalid
  (module
    (func $complex-loop-test
      (loop (param f32 i32) (result i32)
        (f32.const 0.5) (i32.const 1)
        (i32.const 2) (i32.eqz)
        (br_if 0)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)