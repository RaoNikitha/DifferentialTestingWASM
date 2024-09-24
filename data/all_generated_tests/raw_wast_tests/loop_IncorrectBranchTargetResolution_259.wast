;; Test 10: Introduce a `br_if` within an infinite loop where the branch occurs based on a condition. Incorrect target resolution will misbranch on condition fulfillment, causing a lock in an unintended loop.

(assert_invalid
  (module (func (result i32)
    (loop (result i32)
      (i32.const 0)
      (br_if 0 (i32.const 1))
    )
  ))
  "end of function reached"
)