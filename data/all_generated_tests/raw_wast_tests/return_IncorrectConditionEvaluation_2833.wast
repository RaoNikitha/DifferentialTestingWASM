;; 2. Implement a loop containing a `br_if` that depends on an operand calculation for its condition. Verify if the loop exits prematurely in one engine but not the other, due to misinterpreted return condition.

(assert_invalid
  (module
    (func $loop-br-if (result i32)
      (local i32)
      (loop $label
        (local.set 0 (i32.add (local.get 0) (i32.const 1)))
        (br_if $label (local.get 0))
        (return (i32.const 42))
      )
    )
  )
  "type mismatch"
)