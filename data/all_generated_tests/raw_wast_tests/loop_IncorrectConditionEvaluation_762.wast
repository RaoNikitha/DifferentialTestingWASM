;; - Test Description 3: Design a loop containing multiple `br_if` instructions, each driven by different stack values (positive, negative, zero). This will test if various condition evaluations are correctly handled in sequence, without always defaulting to branching.

(assert_invalid
  (module
    (func $test_loop_br_if
      (local $x i32)
      (local $y i32)
      (local.set $x (i32.const 1))
      (local.set $y (i32.const -1))
      (loop (result i32)
        (br_if 0 (local.get $x))
        (local.set $x (i32.const 0))
        (br_if 0 (local.get $y))
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)