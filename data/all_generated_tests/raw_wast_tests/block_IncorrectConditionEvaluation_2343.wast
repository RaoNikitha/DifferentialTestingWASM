;; 4. Construct a block that generates multiple i32 values using control flow and loop. Use `br_if` in combination with local variables defined outside the block to see if the local state change can affect the branching condition inside the block.

(assert_invalid
  (module (func $type-loop-branch (result i32)
    (local $cond i32)
    (local.set $cond (i32.const 1))
    (block (result i32)
      (loop (result i32)
        (br_if 1 (local.get $cond))
        (i32.const 0)
      )
      (i32.const 10)
    )
  ))
  "type mismatch"
)