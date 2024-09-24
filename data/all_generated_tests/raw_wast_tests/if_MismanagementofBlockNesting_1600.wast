;; 1. A test with an `if` instruction that checks a nested block within another block, where the `else` part also includes another nested block. This checks if mismanagement of multiple nested block exit points results in incorrect control flow between blocks.

(assert_invalid
  (module
    (func $nested_if_blocks (result i32)
      (block
        (if (result i32)
          (i32.const 1)
          (then
            (block (result i32)
              (if (result i32)
                (i32.const 1)
                (then (i32.const 10))
                (else (i32.const 20))
              )
            )
          )
          (else
            (block (result i32)
              (if (result i32)
                (i32.const 0)
                (then (i32.const 30))
                (else (i32.const 40))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)