;; 4. **Test Description**: Create a function that contains several nested structures, where a `br_if` should branch to an outermost loop, consuming specific operand types from the stack. Design the test so that if operand types do not match, there is a clear indication of corrupted stack states.   - **Constraint Being Checked**: Correct operand types awareness when unwinding and reinitializing stack during branch.   - **Stack Corruption Aspect**: Incorrect branching could rearrange stack items, causing type mismatches that affect execution correctness.

(assert_invalid
  (module
    (func $nested-structures
      (block
        (loop
          (if (i32.const 1)
            (then
              (block (result i32)
                (br_if 1 (i32.const 1) (f32.const 0))  ;; Mismatched types: i32 and f32
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)