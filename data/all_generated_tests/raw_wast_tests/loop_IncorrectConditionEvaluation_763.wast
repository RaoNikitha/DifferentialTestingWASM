;; - Test Description 4: Implement a loop where an accumulator is added within each iteration. Use a `br_if` to exit the loop if the accumulator exceeds a specified limit. This will verify proper condition evaluation and ensure branching occurs solely based on the correct accumulation value.

(assert_invalid
  (module
    (func $accumulator-loop-test
      (local $acc i32)
      (local.set $acc (i32.const 0))
      (loop (result i32)
        (local.set $acc (i32.add (local.get $acc) (i32.const 1)))
        (br_if 0 (i32.gt_s (local.get $acc) (i32.const 10)))
      )
      (drop)
    )
  )
  "type mismatch"
)