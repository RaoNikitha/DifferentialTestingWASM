;; 9. Create a WebAssembly function with several nested `if` blocks inside a `loop`. Each nested `if` block has a unique label, and use `br_table` to choose to break to different levels based on conditions. This verifies if the implementation correctly interprets and manages the nested block depths.

(assert_invalid
  (module
    (func $nested-if-loop-br (param i32) (result i32)
      (loop (result i32)
        (if (result i32) (i32.const 1)
          (then
            (if (result i32) (i32.const 2)
              (then
                (if (result i32) (i32.const 3)
                  (then
                    (br_table 0 1 2 (local.get 0))
                  )
                  (else (i32.const 0))
                )
              )
              (else (i32.const 0))
            )
          )
          (else (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)