;; Develop a `block` with nested control structures (`if`, `else`, `loop`) and include a `br_if` instruction after several stack operations. Validate that `br_if` correctly branches only if the expected stack value condition is met, ensuring stack remains intact otherwise.

(assert_invalid
  (module
    (func $nested-block-with-br_if 
      (block (result i32)
        (i32.const 10)
        (loop $loop (result i32)
          (i32.const 1)
          (i32.add)
          (block (result i32)
            (i32.const 0)
            (br_if 1)
            (i32.const 2)
            (if (result i32)
              (i32.const 3)
              (else (i32.const 4))
            )
          )
          (i32.const 5)
          (br_if $loop)
        )
      )
    )
  )
  "type mismatch"
)