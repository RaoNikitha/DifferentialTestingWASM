;; Deploy a `br_table` where one of the valid target blocks includes another `br_table` with a valid and one invalid index to see how both implementations handle recursive context validations and state management of operand stacks under compound conditionals.

(assert_invalid
  (module
    (func $complex-branch-target
      (block $outer
        (block $inner
          (br_table 0 1 2 (i32.const 0))
          (br_table 0 1 2 (return)) 
        )
      )
    )
  )
  "type mismatch"
)