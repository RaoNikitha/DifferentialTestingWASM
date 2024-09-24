;; 2. Create a function with nested control structures (e.g., `if`, `loop`, `block`) and place `nop` instructions at various points within these structures. Validate that the stack remains consistent at checkpoints inside these structures.

(assert_invalid
  (module
    (func $nested (result i32)
      (block
        (loop
          (if
            (i32.const 1)
            (then
              (nop)
              (br 2)
            )
            (else
              (nop)
              (br 1)
            )
          )
          (nop)
        )
        (nop)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)