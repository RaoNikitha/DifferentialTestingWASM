;; 2. **Test: Default Target in `br_table` with Immediate Return**    - **Description**: A `br_table` instruction is given several targets, followed by a default target that contains a `return` instruction. This checks whether the default path correctly performs a return from the function.    - **Constraint**: Ensuring that the control flow reaches the `return` instruction in the default target and exits accurately.

(assert_invalid
  (module
    (func (param i32)
      (block $default
        (block $target1
          (block $target2
            (br_table $target1 $target2 $default (local.get 0))
          )
        )
        (return)
      )
    )
  )
)