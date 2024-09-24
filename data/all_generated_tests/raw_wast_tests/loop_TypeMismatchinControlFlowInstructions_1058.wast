;; 9. Design a `loop` wherein the block type expects a single `i64` value, but the branch instruction `br_if` leaves an `f64` on the stack upon re-entry into the loop. This tests the engines' stack type validation when re-entering loops.

(assert_invalid
  (module (func $mismatched-stack-type (result i64)
    (loop (result i64)
      (local f64)
      (local.set 0 (f64.const 0.0))
      (br_if 0 (i64.eqz (i64.const 1)))
      (local.get 0)
      (i64.const 1)
    )
  ))
  "type mismatch"
)