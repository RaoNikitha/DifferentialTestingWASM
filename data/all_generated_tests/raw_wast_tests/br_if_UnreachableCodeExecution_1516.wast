;; 7. **Test 7 - Loop Unwinding `br_if`**:    Create a loop where a `br_if` targets a non-loop label inside the loop body with a non-matching stack height. This tests if the stack unwinding handles loops correctly before reaching an `unreachable` instruction.

(assert_invalid
  (module
    (func $loop-unwinding-br_if
      (loop (block (i32.const 1) (br_if 1 (i32.const 1) (i32.const 0)) (unreachable)))
    )
  )
  "type mismatch"
)