;; 5. **Test 5**: Embed a `br_if` inside a nested set of `loop` instructions, where the condition causes a branch to the beginning of an outer loop instead of the immediate next loop. Validate that the stack is correctly maintained, demonstrating the handling of nested loop structures.

(assert_invalid
  (module
    (func $nested_loops_br_if
      (loop (result i32)
        (loop (result i32)
          (i32.const 1)
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)