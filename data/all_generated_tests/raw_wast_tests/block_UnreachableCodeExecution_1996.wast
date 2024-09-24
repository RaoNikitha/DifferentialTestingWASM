;; 7. Develop a block with several sequential instructions where an incorrect `br_table` destination lands the execution outside the block’s boundary, trespassing into an `unreachable` instruction. Validate the boundary respect and control flow correctness.

(assert_invalid
  (module
    (func $incorrect-br_table 
      (block $outer (result i32)
        (block $inner
          (i32.const 10)
          (i32.const 20)
          (br_table 2 0 (i32.const 0)) 
        )
        (unreachable)
      )
    )
  )
  "invalid label index"
)