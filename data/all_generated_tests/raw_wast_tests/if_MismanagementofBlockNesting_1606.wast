;; 7. An `if` statement within a loop, where the loop contains a `br_table` instruction. The branches in the `br_table` target various nested blocks and `if` statements within the loop. This examines if the targets are correctly differentiated by their nesting levels.

(assert_invalid
  (module
    (func $nested_ifs_in_loop
      (block $outer_block
        (loop $loop
          (if (result i32)
            (i32.const 1)
            (then
              (block $inner_block
                (i32.const 0)
                (br_if 0 (i32.const 1))  ;; target inner block
              )
              (i32.const 1)
            )
            (else
              (block $else_block
                (i32.const 1)
                (br 1)  ;; incorrect nesting level target
              )
            )
          )
          (i32.const 1)
          (br_table 0 1 2 (i32.const 0)) ;; target different nesting levels
        )
      )
    )
  )
  "type mismatch"
)