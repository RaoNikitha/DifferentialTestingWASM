;; 2. **Nested Loop with Forward and Backward Branching**:    - Create a nested loop structure where `br_table` must exit both inner and outer loops based on the operand. Verify if the engine correctly unwinds stacks and branches accordingly. If stack unwinding or branch targeting is incorrect, it might loop infinitely within the inner block.

(assert_invalid
  (module
    (func
      (loop
        (block
          (block
            (br_table 0 1 (i32.const 1) (local.get 0))
          )
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)