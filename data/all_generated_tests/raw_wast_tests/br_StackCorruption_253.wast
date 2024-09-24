;; 4. **Test 4: Mixed Branch Targets in Nested Constructs**    - A test with a combination of `block`, `loop`, and `if` constructs at different nesting levels with `br` instructions targeting these various constructs.    - Constraint: Ensure the br instruction correctly handles jumps to different types of structured control instructions.    - Stack Corruption Check: Validate that the operand stack remains accurate after jumps to diverse targets.

(assert_invalid
  (module
    (func $mixed-branch-targets
      (block
        (loop
          (if (i32.const 1)
            (then 
              (br 1) 
            )
          )
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)