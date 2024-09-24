;; 4. **Type Enforcing on Loop**: Inside a `loop` instruction within a block, have the loop body producing a type `i32` while the loop itself expects an `i64` result. This tests whether the loop's internal control flow enforces the correct type.

(assert_invalid
  (module (func $type-loop-i32-vs-i64 (result i64)
    (block (result i64)
      (loop (result i64)
        (br_if 1 (i64.const 0))
        (i32.const 0) ;; Type mismatch here, expecting i64
      )
    )
  ))
  "type mismatch"
)