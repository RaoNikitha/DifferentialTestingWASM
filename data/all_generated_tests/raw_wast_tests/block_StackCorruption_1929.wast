;; Test 10: A nested set of blocks, with inner blocks pushing values to the stack and outer blocks popping values off. Examine if the correct values remain on the stack at the conclusion of the outermost block, ensuring no stack underflow or overflow errors occur.

(assert_invalid
  (module 
    (func $nested-blocks (result i32)
      (block (result i32)
        (i32.const 10)
        (block (result i32)
          (i32.const 20)
          (block (result i32)
            (i32.const 30)
            (br 2)
          )
          (drop)
        )
        (drop)
        (i32.add)
      )
    )
  )
  "type mismatch"
)