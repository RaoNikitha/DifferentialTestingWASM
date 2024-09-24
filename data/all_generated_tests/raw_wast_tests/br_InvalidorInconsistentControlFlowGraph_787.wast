;; 8. **Test Description:**    - Use a control structure containing nested `block`, `loop`, and `if` constructs, with a `br` instruction targeting the `loop` from within the `if` body.    - **Constraint:** Validate that the branch correctly jumps to the start of the `loop`, skipping the `if` structure’s remaining instructions.    - **CFG Check:** Ensures the CFG accurately maps the interactions between mixed control constructs and resolves branch targets correctly.

(assert_invalid
  (module
    (func $nested_blocks
      (block
        (loop
          (block
            (if (i32.eqz (i32.const 0))
              (then (br 1))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)