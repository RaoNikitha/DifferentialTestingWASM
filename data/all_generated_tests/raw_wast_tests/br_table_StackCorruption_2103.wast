;; 3. **Complex Control Flow with Unmatched Types:**    - Design a complex control flow scenario with a mix of `block`, `loop`, and `if` constructs. Use a `br_table` to branch among targets with operand types different from the default label, observing if the stack reflects unexpected values.

(assert_invalid
  (module
    (func $complex-control-flow
      (block (result i32)
        (loop (result i64)
          (if
            (i32.const 1)
            (then
              (block (result i32)
                (br_table 0 1 (i32.const 0))
              )
            )
           )
        )
      )
    )
  )
  "type mismatch"
)