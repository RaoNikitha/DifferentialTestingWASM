;; 6. **Interleaved `block` and `if` Instructions**: Create several interleaved `block` and `if` instructions with branches leading outwards from the innermost `if`, checking if the implementation can follow control flow across multiple block types.

(assert_invalid
  (module
    (func $interleaved-block-if (result i32)
      (block (result i32)
        (i32.const 1) 
        (if (result i32)
          (then 
            (br 1 (i32.const 2)) 
            (i32.const 3)
          )
          (else 
            (i32.const 4)
          )
        )
      )
    )
  )
  "type mismatch"
)