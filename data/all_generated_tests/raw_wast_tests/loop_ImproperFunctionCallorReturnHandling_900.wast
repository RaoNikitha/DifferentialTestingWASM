;; - Use a `loop` block that includes a `call` to a function with mismatching operand types, ensuring the type-checking mechanism within the loop's recursive structure accurately verifies the function signature.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (func $foo (param i32)
      (loop (call $foo (f32.const 0)))
    )
  )
  "type mismatch"
)