;; 3. **Test Description:** Implement a `loop` inside a `block`, with multiple operations inside the loop. Use `br_if` with relative label indices to test correct backward branching. Insert an `unreachable` just before the loop to ensure a misinterpreted branch does not escape the loop and cause the program to end unexpectedly.

(assert_invalid
  (module (func $type-loop-block-br_if (result i32)
    (block $outer (result i32)
      (loop $inner (result i32)
        (br_if $outer (i32.const 1) (i64.const 1))
        (unreachable)
      )
    )
    (i32.const 0)
  ))
  "type mismatch"
)