;; Test 2: Use `nop` instructions interspersed with local variable manipulations followed by a `br_if` condition dependent on those manipulations. Check if the correct branch is taken based on the expected variable state.

 ;; (module
  (func $test
    (local $x i32)
    (local $y i32)
    (local.set $x (i32.const 5))
    (nop)
    (local.set $y (i32.const 10))
    (nop)
    (br_if 0 (i32.eq (local.get $x) (i32.const 5)))
  )
)