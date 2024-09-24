;; Test 6: Construct a block that receives an f32 input and expects an i32 output. Within the block, perform arithmetic operations that ensure the final stack value is an f32. This tests if the block compilation handles type conversion or raises a type error.

(assert_invalid
  (module
    (func $test-block-type-mismatch (result i32)
      (block (result i32)
        (local f32)
        (f32.const 1.0)
        (local.set 0)
        (local.get 0)
        (f32.add (f32.const 2.0))
        (f32.add (f32.const 3.0))
      )
    )
  )
  "type mismatch"
)