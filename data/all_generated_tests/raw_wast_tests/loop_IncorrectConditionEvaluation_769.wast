;; - Test Description 10: Design a loop that leverages a count-down mechanism utilizing `br_if` to exit the loop once a counter hits zero. This test checks if the decrement and subsequent condition evaluations are appropriately handled, ensuring correct loop termination based on the intended state of the counter.

(assert_invalid
  (module
    (func $countdown (param $counter i32) (result i32)
      (local.get $counter)
      (loop (result i32)
        (local.get $counter)
        (i32.const 1)
        (i32.sub)
        (local.tee $counter)
        (i32.const 0)
        (i32.eq)
        (br_if 1)
        (local.get $counter)
        (br 0)
      )
      (drop)
    )
  )
  "type mismatch"
)