;; 7. Construct a loop where conditional branches (`br_if`) erroneously cause stack underflows due to complex conditions, testing robust state management within the CFG.

(assert_invalid
  (module (func (result i32)
    (i32.const 0)
    (loop (result i32)
      (br_if 0 (i32.const 1))
      (i32.add)
    )
  ))
  "stack underflow"
)