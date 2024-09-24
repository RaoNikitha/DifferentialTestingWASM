;; 4. Construct a loop evaluating a dynamic condition (e.g., counter decrementing within the loop). Use `br_if` to exit when the counter hits zero. Ensure that branching only occurs when the condition is met, confirming the counter was decremented correctly.

(assert_invalid
  (module
    (func (local i32)
      (i32.const 5) 
      (loop (param i32)
        (local.set 0)
        (local.get 0)
        (i32.const 1)
        (i32.sub)
        (local.set 0)
        (local.get 0)
        (i32.const 0)
        (i32.eq)
        (br_if 1)
        (br 0)
      )
    )
  )
  "type mismatch"
)