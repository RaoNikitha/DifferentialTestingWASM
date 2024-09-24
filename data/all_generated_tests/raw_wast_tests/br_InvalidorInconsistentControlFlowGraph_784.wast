;; 5. **Test Description:**    - Implement a control flow with an `if` statement that includes a nested `loop`, with a `br` instruction targeting the `loop` from within the `if`’s body.    - **Constraint:** Check that the branch correctly jumps to the start of the `loop`.    - **CFG Check:** Ensures that mixed `if` and `loop` constructs are correctly represented in the CFG and that backward branches are handled correctly.

(assert_invalid
  (module
    (func $nested_if_loop
      (block
        (loop 
          (if (i32.const 1)
            (then
              (br 1)
            )
          )
        )
      )
    )
  )
  "unknown label"
)