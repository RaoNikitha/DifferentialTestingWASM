;; Test 1: Create a block that expects an i32 type result, but performs a br instruction to a block that instead provides an f32 type on the stack.

(assert_invalid
 (module
  (func
   (block (result i32)
    (f32.const 0.0)
    (br 0)
   )
   (drop)
  )
 )
 "type mismatch"
)