;; Test 8: Design a complex control flow with several `loop` constructs inside a function. Trigger these loops with conditional branching controlled by parameters and invoke multiple calls. Examine incorrect loop exit conditions or infinite loops due to improper branching resolutions.

(assert_invalid
  (module
    (func $complex_loop (param i32) (result i32)
      (local i32)
      (set_local 1 (i32.const 0))
      (loop $outer
        (br_if $outer (i32.eq (get_local 1) (get_local 0)))
        (set_local 1 (i32.add (get_local 1) (i32.const 1)))
        (call $inner_function (get_local 1))
        (br $outer)
      )
      (return (get_local 1))
    )
    (func $inner_function (param i32) (result i32)
      (local i32)
      (set_local 0 (i32.mul (get_local 0) (i32.const 2)))
      (loop $inner
        (br_if $inner (i32.lt_s (get_local 0) (i32.const 10)))
        (set_local 0 (i32.add (get_local 0) (i32.const 1)))
        (br $inner)
      )
      (get_local 0)
    )
    (func $invalid_function (call $complex_loop (i32.const 5) (i32.const 10)))
  )
  "type mismatch"
)