;; 4. Create a deeply nested structure of `blocks` and `loops` with multiple `br` instructions targeting different levels. Validate if all branch operations correctly maintain the stack integrity throughout nested branches. Differential behavior may arise from mismanaging operand stacks at different nesting levels.

(assert_invalid
  (module (func $deeply_nested_blocks_and_br
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 42)
            (br 3)
          )
        )
      )
    )
    (drop)
  ))
  "type mismatch"
)