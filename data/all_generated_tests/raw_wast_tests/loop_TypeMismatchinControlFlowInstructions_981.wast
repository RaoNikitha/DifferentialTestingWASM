;; Test 2: A `loop` block that begins with a `f32.add` operation on the stack, which expects two float inputs, but the predecessor block leaves the stack with integer types.

(assert_invalid
  (module
    (func $f32-add-wrong-type
      (block (i32.const 1) (i32.const 2) (loop (f32.add)))
    )
  )
  "type mismatch"
)