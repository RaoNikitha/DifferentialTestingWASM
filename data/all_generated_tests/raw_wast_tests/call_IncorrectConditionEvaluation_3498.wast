;; Test 7: Use a loop combined with `br_if` to repeatedly call a function until a condition is met. Compare the number of iterations and function calls between the implementations to identify any discrepancies due to incorrect condition evaluations.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $loop-calling-func (param i32) (result i32)
      (local i32)
      (local.set 1 (i32.const 0))
      (block (loop
        (call 1 (local.get 0))
        (local.set 1 (i32.add (local.get 1) (i32.const 1)))
        (br_if 0 (i32.lt_s (local.get 1) (i32.const 10)))
      ))
      (local.get 1)
    )
    (func (param i32) (result i32)
      (drop (local.get 0))
      (i32.const 0)
    )
  )
  "type mismatch"
)