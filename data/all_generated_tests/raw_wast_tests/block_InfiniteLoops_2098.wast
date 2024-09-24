;; A test where an outer block includes a nested loop and instructions inside the loop use `br_if` multiple times based on variable conditions, ensuring the stack is not mismanaged leading to endless looping.

(assert_invalid
  (module (func $nested-loop-block (result i32)
    (block (result i32)
      (loop (result i32)
        (i32.const 10)
        (br_if 0 (i32.const 0))
        (i32.const 20)
        (br_if 1 (i32.const 1))
      )
      (i32.const 30)
    )
  ))
  "type mismatch"
)