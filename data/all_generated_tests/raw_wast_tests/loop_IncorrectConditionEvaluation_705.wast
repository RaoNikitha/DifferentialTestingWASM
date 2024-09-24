;; 6. Design a loop with a mixed sequence of `br_if` and `br` instructions, where `br_if` conditions vary based on the iteration index. Ensure the loop iterates correctly without unintended branches, demonstrating correct index evaluation.

(assert_invalid
  (module (func $loop-br-if-br (result i32)
    (local i32)
    (local.set 0 (i32.const 10))
    (loop (result i32)
      (local.get 0)
      (i32.const 1)
      (i32.sub)
      (local.tee 0)
      (br_if 1 (i32.eqz (local.get 0)))
      (br 0)
    )
  ))
  "type mismatch"
)